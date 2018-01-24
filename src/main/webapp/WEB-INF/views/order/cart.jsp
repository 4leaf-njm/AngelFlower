<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
	<title>장바구니 | 엔젤 플라워</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/order/cart.css" />
</head>

<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!-- container (S) -->
<div id="container">
	<ul class="tap" style="margin-top: 20px;">
		<li class="on" data-tap="tap1">01 장바구니</li> 
		<li data-tap="tap2">02 주문/결제</li>
		<li data-tap="tap3">03 주문완료</li>
	</ul>
	
	<div class="cart">
		<table>
			<tr>
				<th style="width: 110px;">선택</th>
				<th>사진</th>
				<th style="width: 300px;">상품명</th>
				<th style="width: 120px;">판매가</th>
				<th style="width: 120px;">수량</th>
				<th style="width: 120px;">적립금</th>
				<th style="width: 160px;">합계</th>
			</tr>
			<c:choose>
				<c:when test="${empty cartList}">
					<tr>
						<th colspan="7" style="font-size: 18px;">장바구니에 담긴 상품이 없습니다.</th>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="cart" items="${cartList}">
					<tr>
						<td><input type="checkbox" name="remove" value="${cart.cartNo }" class="remove"/></td>
						<td class="image"><img src="${pageContext.request.contextPath }/resources/images/item/${cart.prodImage}" /></td>
						<td class="name">${cart.prodName }</td>
						<td><fmt:formatNumber value="${cart.prodPrice2 }" pattern="#,##0"/>원</td>
						<td class="quantity">
							<p class="num">${cart.quantity}</p>
							<span>
								<a href="#" class="up"><img src="${pageContext.request.contextPath }/resources/images/bullet/bu_arrow_top_02.gif" alt="수량 증가"/></a>
								<a href="#" class="down"><img src="${pageContext.request.contextPath }/resources/images/bullet/bu_arrow_bottom.gif" alt="수량 감소"/></a>
							</span>
							<p class="modify"><a href="#" data-no="${cart.cartNo}">수정</a></p>
						</td>
						<td><fmt:formatNumber value="${cart.prodSave }" pattern="#,##0"/>원</td>
						<td><b><fmt:formatNumber value="${cart.quantity * cart.prodPrice2 }" pattern="#,##0"/>원</b></td>
					</tr>
					</c:forEach>
					<tr>
						<td colspan="7">
							<div class="left">
								<a href="javascript:go_deleteCart()">선택 삭제</a>
							</div>
							<div class="right">
								<div>
									<p>상품합계금액</p>
									<span><fmt:formatNumber value="${totalPrice}" pattern="#,##0"/>원</span>
								</div>
								<div>
									<p>받으실 적립금</p>
									<span><fmt:formatNumber value="${totalSave}" pattern="#,##0"/>원</span>
								</div>
							</div>
						</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
		<div class="btn_box">
			<a href="javascript:go_deleteCartAll('${sessionScope.loginUser.id}')" class="btn01">장바구니비우기</a>
			<a href="javascript:go_order('${empty cartList}')" class="btn02">바로 주문</a>
			<a href="javascript:go_home()" class="btn03">계속 쇼핑</a>
		</div>
		<script>
			$('.quantity .up').click(function(event){
				event.preventDefault();
				var num = $(this).parents('.quantity').find('.num').text();
				$(this).parents('.quantity').find('.num').text(parseInt(num) + 1);
			});
			$('.quantity .down').click(function(event){
				event.preventDefault();
				var num = $(this).parents('.quantity').find('.num').text();
				if(num <= 1) return;
				$(this).parents('.quantity').find('.num').text(parseInt(num) - 1);
			});
			$('.quantity .modify a').click(function(event){
				event.preventDefault();
				var num = $(this).parents('.quantity').find('.num').text();
				var no = $(this).data('no');
				go_updateAmount(no, num);
			});
		</script>
	</div>
	
	<div class="wish">
		<h2><img src="${pageContext.request.contextPath }/resources/images/icon/ico_heart.png" /><span>관심상품</span></h2>
		<table>
			<tr>
				<th style="width: 170px;">사진</th>
				<th>상품명</th>
				<th style="width: 175px;">판매가</th>
				<th style="width: 175px;">수량</th>
				<th style="width: 175px;">적립금</th>
				<th style="width: 50px;">이동</th>
				<th style="width: 85px;">취소</th>
			</tr>
			<c:choose>
			<c:when test="${empty wishList}">
			<tr>
				<th colspan="7" style="font-size:18px;">관심상품에 등록된 상품이 없습니다.</th>	
			</tr>
			</c:when>
			<c:otherwise>
			<c:forEach var="wish" items="${wishList }">
			<tr>
				<td class="image"><img src="${pageContext.request.contextPath }/resources/images/item/${wish.prodImage}" /></td>
				<td class="name">${wish.prodName }</td>
				<td><fmt:formatNumber value="${wish.prodPrice2 }" pattern="#,##0"/>원</td>
				<td>${wish.quantity } 개</td>
				<td><fmt:formatNumber value="${wish.prodSave }" pattern="#,##0"/>원</td>
				<td><a href="javascript:go_addCartFromWish('${wish.wishNo}')" class="btn">담기</a></td>
				<td><a href="javascript:go_removeWish('${wish.wishNo}')" class="btn">삭제</a></td>
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
<script src="${pageContext.request.contextPath }/resources/js/order.js"></script>