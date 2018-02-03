<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/admin/include/header.jsp" %>

<!-- container (S) -->
<div id="container">
	<div class="content">
		<h3 class="title"><i class="fa fa-angle-right" aria-hidden="true"></i>${order.memName} 님의 주문내역<span>주문번호 : ${order.orderSerial}</span></h3>
		<table class="tbl03 hori">
			<tr>
				<th colspan="5">주문 리스트</th>
			</tr>
			<tr>
				<th style="width:80px;">분류</th>
				<th>상품명</th>
				<th style="width:80px;">수량</th>
				<th style="width:80px;">가격</th>
				<th style="width:80px;">적립금</th>
			</tr>
			<c:forEach var="order" items="${orderList }">
			<tr>
				<td>
				<c:choose>
				<c:when test="${order.prodCategory eq 1 }">근조 화환</c:when>
				<c:when test="${order.prodCategory eq 2 }">근조 바구니</c:when>
				<c:when test="${order.prodCategory eq 3 }">축하 화환</c:when>
				<c:when test="${order.prodCategory eq 4 }">꽃다발</c:when>
				<c:when test="${order.prodCategory eq 5 }">꽃바구니</c:when>
				<c:when test="${order.prodCategory eq 6 }">동·서양란</c:when>
				<c:when test="${order.prodCategory eq 7 }">★ 플라워</c:when>
				</c:choose>
				</td>
				<td class="name">
					<img src="${pageContext.request.contextPath }/resources/upload/product/${order.prodImage}" />
					<p>${order.prodName }</p>
				</td>
				<td>${order.quantity } 개</td>
				<td>
				<c:choose>
				<c:when test="${order.memId eq null}">
					<fmt:formatNumber value="${order.prodPrice1 * order.quantity }" pattern="#,##0" /> 원
				</c:when>
				<c:otherwise>
					<fmt:formatNumber value="${order.prodPrice2 * order.quantity }" pattern="#,##0" /> 원
				</c:otherwise>
				</c:choose>
				</td>
				<td><fmt:formatNumber value="${order.prodSave * order.quantity }" pattern="#,##0" /> 원</td>
			</tr>
			</c:forEach>
		</table>
	
		<table class="tbl03">
			<tr>
				<th colspan="2">주문고객 정보</th>
			</tr>
			<tr>
				<th>이름</th>
				<td>${order.memName }</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>${order.memPhone }</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${order.memEmail }</td>
			</tr>
		</table>
		
		<table class="tbl03">
			<tr>
				<th colspan="2">받는사람 정보</th>
			</tr>
			<tr>
				<th>이름</th>
				<td>${order.receiveName }</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>${order.receivePhone }</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${order.receiveAddr }</td>
			</tr>
			<tr>
				<th>주문시 요청사항</th>
				<td>${order.orderRequest }</td>
			</tr>
			<tr>
				<th>희망배송일</th>
				<td><fmt:formatDate value="${order.hopeDate }" pattern="yyyy-MM-dd"/></td>
			</tr>
		</table>
		
		<table class="tbl03">
			<tr>
				<th colspan="2">메시지 정보</th>
			</tr>
			<tr>
				<th>리본(경조사문구)</th>
				<td>${order.orderMsg1 }</td>
			</tr>
			<tr>
				<th>리본(보내시는분)</th>
				<td>${order.orderMsg2 }</td>
			</tr>
		</table>
		
		<table class="tbl03">
			<tr>
				<th colspan="2">결제 정보</th>
			</tr>
			<tr>
				<th>총 주문금액</th>
				<td><fmt:formatNumber value="${totalPrice}" pattern="#,##0" /> 원</td>
			</tr>
			<tr>
				<th>받은 적립금</th>
				<td><fmt:formatNumber value="${totalSave}" pattern="#,##0" /> 원</td>
			</tr>
			<tr>
				<th>사용한 적립금</th>
				<td><fmt:formatNumber value="${order.useSave}" pattern="#,##0" /> 원</td>
			</tr>
			<tr>
				<th>최종 결제금액</th>
				<td style="font-weight: bold; font-size: 13px; color: #ff5858"><fmt:formatNumber value="${finalPrice}" pattern="#,##0" /> 원</td>
			</tr>
		</table>
		
		<div class="btn_box">
			<a href="javascript:history.go(-1)" class="btn btn03">확인 완료</a>
		</div>
	</div>
	<script>
		$('.tbl03 td label').click(function(){
			$(this).parents('td').find('label').removeClass('on');
			$(this).addClass('on');
		});
		
		$('.radioSel').click(function(){
			$(this).parents('td').find('.disable').prop('disabled', true);
			$(this).parent('label').find('.disable').prop('disabled', false);
		});
	</script>
	<%@ include file="/WEB-INF/views/admin/include/sidebar3.jsp" %>
</div>
<!-- container (E) -->
<script src="${pageContext.request.contextPath }/resources/js/admin.js"></script>