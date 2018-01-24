<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
	<title>엔젤 플라워</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/order/order_complete.css" />
</head>

<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!-- container (S) -->
<div id="container">
	<ul class="tap" style="margin-top: 20px;">
		<li data-tap="tap1">01 장바구니</li> 
		<li data-tap="tap2">02 주문/결제</li>
		<li class="on" data-tap="tap3">03 주문완료</li>
	</ul>
	
	<div class="sec sec01">
		<h2>주문정보를 확인하신 후, 주문확인을 눌러주세요</h2>
		<table>
			<tr>
				<th style="width: 500px;">구입 상품명</th>
				<th style="width: 110px;">수량</th>
				<th style="width: 110px;">가격</th>
				<th style="width: 110px;">적립금</th>
			</tr>
			<c:forEach var="orderVO" items="${orderList }">
			<tr>
				<td class="image">
					<img src="${pageContext.request.contextPath }/resources/images/item/${orderVO.prodImage}" />
					<p class="name">${orderVO.prodName }</p>
				</td>
				<td>${orderVO.quantity }개</td>
				<td><fmt:formatNumber value="${orderVO.prodPrice2 * orderVO.quantity }" pattern="#,##0"/>원</td>
				<td>${orderVO.prodSave * orderVO.quantity}</td>
			</tr>	
			</c:forEach>
			<tr>
				<td colspan="4">
					<div class="left">
						<h4>결제금액</h4>
						<p><span id="finalPrice"><fmt:formatNumber value="${totalPrice - order.useSave }" pattern="#,##0"/></span>원</p>
					</div>
					<div class="right">
						<div>
							<p>상품합계금액</p>
							<span id="totalPrice"><fmt:formatNumber value="${totalPrice }" pattern="#,##0"/>원</span>
						</div>
						<div>
							<p>받은 적립금</p>
							<span id="savePrice"><fmt:formatNumber value="${totalSave }" pattern="#,##0"/>원</span>
						</div>
						<div>
							<p>사용한 적립금</p>
							<span id="useSavePrice"><fmt:formatNumber value="${order.useSave }" pattern="#,##0"/>원</span>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="sec sec02">
		<h3>결제방법</h3>
		<table>
			<tr>
				<td>
					<p>무통장 입금 : <span>국민은행 084001-04-164228 (예금주 : (주)엔젤플라워)</span>
					<p>(입금확인후 배송이 됩니다.)</p>
					<p>입금자명 : <span><c:choose>
						<c:when test="${empty guest}">${order.memName}</c:when>
						<c:otherwise>${guest.name }</c:otherwise>
					</c:choose></span>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="sec sec03">
		<h3>주문자 정보</h3>
		<table>
			<tr>
				<th>이 름</th>
				<td colspan="3"><c:choose>
						<c:when test="${empty guest}">${order.memName}</c:when>
						<c:otherwise>${guest.name }</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<th>E-mail</th>
				<td><c:choose>
						<c:when test="${empty guest}">${order.memEmail}</c:when>
						<c:otherwise>${guest.email }</c:otherwise>
					</c:choose></td>
				<th>연락처</th>
				<td><c:choose>
						<c:when test="${empty guest}">${order.memPhone}</c:when>
						<c:otherwise>${guest.phone }</c:otherwise>
					</c:choose></td>
			</tr>
		</table>
	</div>
	
	<div class="sec sec04">
		<h3>받으실 분 정보</h3>
		<table>
			<tr>
				<th>이 름</th>
				<td>${order.receiveName }</td>
			</tr>
			<tr>
				<th>휴대폰</th>
				<td>${order.receivePhone }</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${order.receiveAddr }</td>
			</tr>
			<tr>
				<th>주문메시지</th>
				<td>
					<p><span>희망배송일 : <fmt:formatDate value="${order.hopeDate }" pattern="yyyy년 MM월 dd일"/></span>
					<p>경조사문구 : ${order.orderMsg1 }</p>
					<p>보내시는분 : ${order.orderMsg2 }</p>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="btn_group">
		<p><c:choose>
			<c:when test="${empty guest}">${order.memName}</c:when>
			<c:otherwise>${guest.name }</c:otherwise>
		</c:choose> 님의 주문이 완료되었습니다.</p>
		<p>입금방법이 무통장입금의 경우 계좌번호를 메모하세요.</p>
		<p>입금 확인 후 상품을 준비하여 배송해드리겠습니다.</p>
		
		<div>
			<a href="javascript:go_home()">주문확인</a>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/include/quick.jsp" %>
</div>
<!-- container (E) -->

<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script src="${pageContext.request.contextPath }/resources/js/order.js"></script>