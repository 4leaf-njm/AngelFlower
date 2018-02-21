<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시스템 에러발생</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/commons/default.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/commons/error.css" />
</head>
<body>
	<div class="error">
		<div>
			<img src="${pageContext.request.contextPath }/resources/images/icon/ico_error.jpg" />
			<div>
				<h2>죄송합니다.</h2>
				<p>요청하신 페이지에서 일시적인 에러가 발생하였습니다.<br>동일한 문제가 지속적으로 발생할 경우 관리자에게<br>문의해주시기 바랍니다.
			</div>
			<a href='<c:url value="/home.do" />'>홈으로 이동</a>
		</div>
	</div>
</body>
</html>