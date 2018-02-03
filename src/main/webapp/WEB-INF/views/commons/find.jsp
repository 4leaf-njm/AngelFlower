<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/commons/login.css" />
</head>

<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!-- container (S) -->
<div id="container">
	<hr class="line01" />
	<div class="login">
		<h2>로그인</h2>
		<p>회원 로그인을 하시면 보다 편리한 서비스를 이용하실 수 있습니다.</p>
		<form method="post" name="frm_login">
			<div class="frm">
				<input type="text" name="id" placeholder="아이디를 입력하세요." />
				<input type="password" name="pw" placeholder="비밀번호를 입력하세요." />
			</div>
			<a href="javascript:go_login()" class="btn_login">로그인</a>
		</form>
		<div class="find">
			<div>
				<p>회원이 아니신가요 ?</p>
				<a href='<c:url value="/commons/join.do" />'>회원가입</a>
			</div>
			<div>
				<p>아이디/비밀번호를 잊으셨나요 ?</p>
				<a href="#">아이디/비밀번호 찾기</a>
			</div>
		</div>
	</div>
	
	<script src="${pageContext.request.contextPath }/resources/js/commons.js"></script>
</div>
<!-- container (E) -->

<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<c:if test="${msg ne null}">
	<script>
		alert('${msg}')
	</script>
</c:if>