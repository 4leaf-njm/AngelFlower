<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/commons/find.css" />
</head>

<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!-- container (S) -->
<div id="container">
	<div class="find">
		<h2>아이디 / 비밀번호 찾기</h2>
		<p>회원가입 시, 입력하신 회원정보로 아이디와 비밀번호를 확인할 수 있습니다.</p>
		<div class="form">
			<div>
				<h3>아이디 찾기</h3>
				<form action="findId.do" method="post" name="frmid">
					<table>
						<tr>
							<th>이   름</th>
							<td><input type="text" name="name" /></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="text" name="email" /></td>
						</tr>	
					</table>
				</form>
				<a href="javascript:go_findId()" class="btn">확인</a>
			</div>
			<div>
				<h3>비밀번호 찾기</h3>
				<form action="findPw.do" method="post" name="frmpw">
					<table>
						<tr>
							<th>아이디</th>
							<td><input type="text" name="id" /></td>
						</tr>
						<tr>
							<th>이   름</th>
							<td><input type="text" name="name" /></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="text" name="email" /></td>
						</tr>	
					</table>
				</form>
				<a href="javascript:go_findPw()" class="btn">확인</a>
			</div>
		</div>
		<div class="res" id="resid">
			<div>
				<p><span id="name"></span> 님의 아이디는 <span id="id"></span> 입니다.</p>
			</div>
			<a href="${pageContext.request.contextPath }/commons/login.do" class="btn">로그인</a>
		</div>
		<div class="res" id="respw">
			<form action="modifyPw.do" method="post" name="frmnew">
				<input type="hidden" name="id" />
				<table>
					<tr>
						<th>새로운 비밀번호</th>
						<td><input type="password" name="pwd" /></td>
					</tr>
					<tr>
						<th>새로운 비밀번호 확인</th>
						<td><input type="password" name="pwdchk" /></td>
					</tr>
				</table>
			</form>
			<a href="javascript:go_modifyPw()" class="btn">확인</a>
		</div>
	</div>
	
	<script src="${pageContext.request.contextPath }/resources/js/commons.js"></script>
</div>
<!-- container (E) -->

<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<c:if test="${msg eq 'success'}">
<c:choose>
<c:when test="${type eq 'id'}">
<script>
	$('.form').hide();
	$('#resid').show();
	$('#resid #name').text('${user.name}');
	$('#resid #id').text('${user.id}');
</script>
</c:when>
<c:otherwise>
<script>
	document.frmnew.id.value = '${user.id}';
	$('.form').hide();
	$('#respw').show();
</script>
</c:otherwise>
</c:choose>
</c:if>
<c:if test="${msg eq 'fail'}">
<script>
	alert('가입된 정보가 없습니다.');
</script>
</c:if>