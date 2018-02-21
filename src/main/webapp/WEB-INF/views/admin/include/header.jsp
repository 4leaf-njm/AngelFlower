<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>엔젤플라워 관리자</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/commons/default.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/jquery-ui/jquery-ui.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/default.js"></script>
<script src="${pageContext.request.contextPath }/resources/jquery-ui/jquery-ui.min.js"></script>
</head>
<body>

<!-- wrapper (S) -->
<div id="wrapper">
	<span id="ctx" style="display: none;">${pageContext.request.contextPath}</span>
	<!-- header (S) -->
	<div id="header">
		<div class="util">
			<h1 class="logo">엔젤플라워<span>관리자</span></h1>
			<div>
			<c:choose>
			<c:when test="${sessionScope.loginUser eq null }">
			<script>
				alert('로그인 후 이용가능합니다.');
				location.href = $('#ctx').text() + '/commons/login.do';
			</script>
			</c:when>
			<c:otherwise>
				<p><span>${sessionScope.loginUser.name}</span>님 (<span>${sessionScope.loginUser.company}</span>)</p>
				<a href="${pageContext.request.contextPath }/commons/logout.do">로그아웃</a>
			</c:otherwise>
			</c:choose>
				<a href="${pageContext.request.contextPath }/home.do">홈으로</a>
			</div>
		</div>
		
		<div class="gnb">
			<ul>
				<li>
					<a href="${pageContext.request.contextPath }/admin/home.do">
						<i class="fa fa-home" aria-hidden="true"></i>홈
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath }/admin/mb/list.do?m=2">
						<i class="fa fa-user" aria-hidden="true"></i>회원관리
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath }/admin/prd/list.do?m=3">
						<i class="fa fa-shopping-basket" aria-hidden="true"></i>상품관리
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath }/admin/ord/list.do?m=4">
						<i class="fa fa-shopping-cart" aria-hidden="true"></i>주문관리
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath }/admin/bj/reclist.do?m=5">
						<i class="fa fa-truck" aria-hidden="true"></i>발주관리
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath }/admin/pay/bjsale.do?m=6&y=<fmt:formatDate value="${now}" pattern="yyyy"/>">
						<i class="fa fa-krw" aria-hidden="true"></i>정산관리
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath }/admin/rev/shiplist.do?m=7">
						<i class="fa fa-pencil" aria-hidden="true"></i>후기관리
					</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath }/admin/store/notice.do?m=8">
						<i class="fa fa-bank" aria-hidden="true"></i>홈피관리
					</a>
				</li>
			</ul>
			<script>
				$('.gnb li').click(function(){
					$('.gnb li').removeClass('on');
					$(this).addClass('on');
				});
				
				var m = '${m}';
				if(!m) {
					$('.gnb li').removeClass('on');
					$('.gnb li').eq(0).addClass('on');
				} else {
					$('.gnb li').removeClass('on');
					$('.gnb li').eq(m-1).addClass('on');					
				}
			</script>
		</div>
	</div>
	<!-- header (E) -->