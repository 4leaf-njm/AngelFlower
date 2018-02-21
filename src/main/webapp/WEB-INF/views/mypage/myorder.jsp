<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage/mypage.css" />
</head>

<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!-- container (S) -->
<div id="container">
	<%@ include file="/WEB-INF/views/mypage/sidebar.jsp" %>
	<div class="content">
		<h2>주문 조회</h2>
		<p>회원님의 주문 내역을 조회 하실 수 있습니다.</p>
		<div class="info">
			<p>상품명 또는 주문상세의 조회 버튼을 클릭하시면, 주문상세 내역을 확인하실 수 있습니다.</p>
		</div> 
		<table class="tbl">
			<tr>
				<th style="width: 75px;">번호</th>
				<th style="width: 170px;">주문일자</th>
				<th style="width: 320px;">상품명</th>
				<th style="width: 120px;">결제금액</th>
				<th style="width: 120px;">주문상세</th>
				<th style="width: 120px;">배송상태</th>
			</tr>
			<c:choose>
			<c:when test="${empty orderList}">
			<tr class="empty">
				<td colspan="6">주문한 상품이 없습니다.</td>
			</tr>
			</c:when>
			<c:otherwise>
			<c:forEach var="order" items="${orderList}" varStatus="status">
			<tr>
				<td>${status.count}</td>
				<td><fmt:formatDate value="${order.orderDate }" pattern="yyyy.MM.dd"/></td>
				<td style="text-align: left;"><a href="javascript:go_myorder_detail('${order.orderNo}')" class="link">${order.prodName }</a></td>
				<td><b><fmt:formatNumber value="${order.realPrice }" pattern="#,##0"/>원</b></td>
				<td><a href="javascript:go_myorder_detail('${order.orderNo}')" class="btn btn01">주문조회</a></td>
				<td>
				<c:choose>
				<c:when test="${order.cancelyn eq 'y'.charAt(0)}">주문취소</c:when>
				<c:when test="${order.cancelyn eq 'r'.charAt(0)}">주문취소 대기</c:when>
				<c:when test="${order.orderState eq 1}">입금대기</c:when>
				<c:when test="${order.orderState eq 2}">상품준비중</c:when>
				<c:when test="${order.orderState eq 3}">배송 중</c:when>
				<c:when test="${order.orderState eq 4}">배송완료</c:when>
				</c:choose>
				</td>
			</tr>
			</c:forEach>
			</c:otherwise>
			</c:choose>
		</table>
	</div>
	<%@ include file="/WEB-INF/views/include/quick.jsp" %>
</div>
<!-- container (E) -->

<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script src="${pageContext.request.contextPath }/resources/js/mypage.js"></script>