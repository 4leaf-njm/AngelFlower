<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>엔젤플라워</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/commons/default.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage/mypage.css" />
</head>
<body>
	<div class="detail">
		<h2>주문상세내역<span>회원님의 <span>주문내역</span>을 상세 조회하실 수 있습니다.</span></h2>
		<div>
			<p><span>[${order.memName}]</span> 님께서 <fmt:formatDate value="${order.orderDate}" pattern="yyyy년 MM월 dd일" />에 주문하신 내역입니다.</p>
		</div>
		<table class="tbl">
			<tr>
				<th>번호</th>
				<th>상품명</th>
				<th>수량</th>
				<th>가격</th>
			</tr>
			<c:choose>
			<c:when test="${empty orderList}">
			<tr class="empty">
				<td colspan="4">주문한 상품이 없습니다.</td>
			</tr>
			</c:when>
			<c:otherwise>
			<c:forEach var="order" items="${orderList}" varStatus="status">
			<tr>
				<td>${status.count }</td>
				<td style="text-align: left;"><img src="${pageContext.request.contextPath }/resources/upload/product/${order.prodImage}" style="vertical-align:middle; margin: 0 30px 0 20px;"/>${order.prodName }</td>
				<td>${order.quantity }</td>
				<td><b><fmt:formatNumber value="${order.realPrice }" pattern="#,##0" />원</b></td>
			</tr>
			</c:forEach>
			</c:otherwise>
			</c:choose>
		</table>
		<p class="total">총 구매 금액 : <fmt:formatNumber value="${totalPrice }" pattern="#,##0" />원</p>
		<table class="tbl02 clear">
			<tr>
				<th>주문일자</th>
				<td><fmt:formatDate value="${order.orderDate }" pattern="yyyy.MM.dd" /></td>
			</tr>
			<tr>
				<th>받는사람</th>
				<td>${order.receiveName } (${order.receivePhone })</td>
			</tr>
			<tr>
				<th>배달주소</th>
				<td>${order.receiveAddr }</td>
			</tr>
			<tr>
				<th>결제방법</th>
				<td>
				<c:choose>
				<c:when test="${order.orderWay eq '무통장입금'}">무통장입금  ${order.depAccount }</c:when>
				<c:otherwise>${order.orderWay }</c:otherwise>
				</c:choose>
				</td>
			</tr>
			<tr>	
				<th>고객메모</th>
				<td>
					<p>희망배송일 : <fmt:formatDate value="${order.hopeDate}" pattern="yyyy년 MM월 dd일" /></p>
					<p>주문시 요청사항 : ${order.orderRequest }</p>
				</td>
			</tr>
			<tr>
				<th>리본<span>(경조사문구)</span></th>
				<td>${order.orderMsg1 }</td>
			</tr>
			<tr>
				<th>리본<span>(보내시는분)</span></th>
				<td>${order.orderMsg2 }</td>
			</tr>
		</table>
	</div>
</body>
</html>