<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage/mypage.css" />
</head>

<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!-- container (S) -->
<div id="container">
	<%@ include file="/WEB-INF/views/admin/mypage/sidebar.jsp" %>
	<div class="content">
		<h2>회원 탈퇴</h2>
		<p>탈퇴사유를 작성해 주시면 쇼핑몰 운영에 적극 반영하겠습니다.</p>
		<div class="msg">
			<h3>그동안 엔젤플라워 서비스를 이용해 주셔서 대단히 감사합니다.</h3>
			<p>더욱더 개선하여 좋은 서비스와 품질로 보답하겠습니다.</p>
		</div>
		<div class="info" style="text-align: center;">
			<p>사이트 탈퇴를 하셔도 언제나 고객님께서 원하실때 재가입하실 수 있습니다.</p>
			<p>엔젤플라워 탈퇴시 회원님의 <span>개인정보는 모두 삭제됩니다.</span></p>
			<p>회원님의 <span>적립금이 남아있는 경우에도 모두 삭제</span>되며 탈퇴후 재가입 하셔도 적립금이 복원되지 않습니다.</p>
		</div>
		<div class="reason">
			<h3>회원탈퇴를 하시겠습니까 ?</h3>
			<table class="tbl02">
				<tr>
					<th style="width: 110px;">사유</th>
					<td><textarea rows="6" cols="50"></textarea></td>
				</tr>
			</table>
		</div>
		<div class="btn_box">
			<a href="javascript:go_myexit()">회원탈퇴</a>
		</div>
		
		<form method="post" name="frm_exit">
			<input type="hidden" name="id" value="${sessionScope.loginUser.id}" />
		</form>
	</div>
	<%@ include file="/WEB-INF/views/include/quick.jsp" %>
</div>
<!-- container (E) -->

<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script src="${pageContext.request.contextPath }/resources/js/mypage.js"></script>