<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>엔젤플라워</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/commons/default.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/commons/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/jquery-ui/jquery-ui.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/font-awesome/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/jquery-ui/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/default.js"></script>
</head>
<body>
<!-- wrapper (S) -->
<div id="wrapper">
	<span id="ctx" style="display: none;">${pageContext.request.contextPath}</span>
	<!-- header (S) -->
	<div id="header">
		<div class="util">
			<div>
				<ul class="util_right">
				<c:if test="${sessionScope.loginUser ne null and sessionScope.loginType eq 'admin'}">
					<li class="admin">
						<p>${sessionScope.loginUser.name}<span>님</span></p>
						<span>(${sessionScope.loginUser.company})</span>
						<a href='<c:url value="/admin/home.do" />'>관리자</a>
					</li>
				</c:if>
				<c:choose>
					<c:when test="${empty sessionScope.loginUser}">
						<li><a href='<c:url value="/commons/login.do" />'>로그인</a></li>
						<li><a href='<c:url value="/commons/join.do" />'>회원가입</a></li>
					</c:when>
					<c:otherwise>
						<li><a href='<c:url value="/commons/logout.do" />'>로그아웃</a></li>
						<c:choose>
						<c:when test="${sessionScope.loginType eq 'admin'}">
							<li><a href='<c:url value="/admin/mypage/myinfo.do?s=1" />'>마이페이지</a></li>
						</c:when>
						<c:otherwise>
							<li><a href='<c:url value="/mypage/myorder.do?s=1" />'>마이페이지</a></li>
						</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
				<c:if test="${sessionScope.loginUser eq null or sessionScope.loginType ne 'admin'}">
					<li><a href='<c:url value="/order/cart.do" />'>장바구니</a></li>
					<li><a href='<c:url value="/mypage/myorder.do?s=1" />'>주문내역조회</a></li>
				</c:if>
					<li><a href='<c:url value="/etc/location.do" />'>찾아오시는길</a></li>
				</ul>
			</div>
		</div>
		<div class="logo">
			<div>
				<h1><a href='<c:url value="/" />'><img src="${pageContext.request.contextPath }/resources/images/commons/logo.png" alt="엔젤 플라워" width="290" height="90"/></a></h1>
				<p><img src="${pageContext.request.contextPath }/resources/images/text/txt_tel_01.png" alt="24시간 전화상담 1588-8282" width="240" height="100"/></p>
				<div>
					<div class="ad">
						<img src="${pageContext.request.contextPath }/resources/images/icon/ico_bump.png" width="60" height="60"/>
						<p><span>전국 전지역 어디나</span>당일 2~3시간 배송</p>
						<div>
							<a href="#"><img src="${pageContext.request.contextPath }/resources/images/bullet/bu_arrow_left.png" alt="이전" /></a>
							<a href="#"><img src="${pageContext.request.contextPath }/resources/images/bullet/bu_arrow_right.png" alt="다음" /></a>
						</div>
					</div>
					<div class="search">
						<form action='<c:url value="/product/clist.do" />' method="get" name="frm_search">
							<p>결혼식화환&nbsp;&nbsp;|&nbsp;&nbsp;경조사화환&nbsp;&nbsp;|&nbsp;&nbsp;프러포즈꽃다발</p>
							<input type="text" name="pname" />
							<a href="javascript:search()">바로검색</a>
						</form>
						<script>
							function search() {
								var frm = document.frm_search;
								if(frm.pname.value == '') {
									alert('검색어를 입력해주세요.');
									frm.pname.focus();
									return;
								}
								frm.submit();
							}
						</script>
					</div>
				</div>
			</div>
		</div>
		<div class="gnb">
			<div>
				<ul>
					<li><a href='<c:url value="/product/list.do?menu=1" />'>근조화환</a></li>
					<li><a href='<c:url value="/product/list.do?menu=2" />'>근조바구니</a></li>
					<li><a href='<c:url value="/product/list.do?menu=3" />'>축하화환</a></li>
					<li><a href='<c:url value="/product/list.do?menu=4" />'>꽃다발</a></li>
					<li><a href='<c:url value="/product/list.do?menu=5" />'>꽃바구니</a></li>
					<li><a href='<c:url value="/product/list.do?menu=6" />'>동·서양란</a></li>
					<li><a href='<c:url value="/product/list.do?menu=7" />'>★ 플라워</a></li>
				</ul>
			</div>
		</div>
		
		<div class="category">
			<ul>
				<li>
					<a href='<c:url value="/product/clist.do?no=1" />'>
					<img src="${pageContext.request.contextPath }/resources/images/main/cate_01.png" alt="추모.근조" width="100" height="160"/>
					추모.근조<span>애도의마음</span></a>
				</li>
				<li>
					<a href='<c:url value="/product/clist.do?no=2" />'>
					<img src="${pageContext.request.contextPath }/resources/images/main/cate_02.png" alt="결혼.축하" width="100" height="160"/>
					결혼.축하<span>진심을담은 축하</span></a>
				</li>
				<li>
					<a href='<c:url value="/product/clist.do?no=3"/>' style="width:125px; padding: 12px 0 0 42px;">
					<img src="${pageContext.request.contextPath }/resources/images/main/cate_03.png" alt="승진&취임" width="100" height="160" style="left: -32px;"/>
					승진&amp;취임<span>축하의 마음</span></a>
				</li>
				<li>
					<a href='<c:url value="/product/clist.do?no=4" />' style="width:127px; padding: 12px 0 0 42px;">
					<img src="${pageContext.request.contextPath }/resources/images/main/cate_04.png" alt="개업&이전" width="100" height="160" style="left: -45px;"/>
					개업&amp;이전<span>대박기원</span></a>
				</li>
				<li>
					<a href='<c:url value="/product/clist.do?no=5" />' style="width:135px; padding: 12px 0 0 86px; border-left: none;">
					<img src="${pageContext.request.contextPath }/resources/images/main/cate_05.png" alt="전체상품" width="127" height="122" style="top: -23px; left: -38px;"/>
					생일&amp;기념일<span>아름다운 추억</span></a>
				</li>
			</ul>
		</div>
	</div>
	<!-- header (E) -->