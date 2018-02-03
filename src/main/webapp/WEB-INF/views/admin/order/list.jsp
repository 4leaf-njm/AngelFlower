<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/admin/include/header.jsp" %>

<!-- container (S) -->
<div id="container">
	<div class="content">
		<table class="tbl01">
			<tr class="title">
				<th colspan="7">주문현황</th>
			</tr>
			<tr class="title2">
				<th>전체 주문</th>
				<th>입금 대기</th>
				<th>상품 준비</th>
				<th>&nbsp;배송 중&nbsp;</th>
				<th>배송 완료</th>
				<th>후기 작성</th>
				<th>주문 취소</th>
			</tr>
			<tr>
				<td><span>${totalCount }</span>건</td>
				<td><span>${countState1 }</span>건</td>
				<td><span>${countState2 }</span>건</td>
				<td><span>${countState3 }</span>건</td>
				<td><span>${countState4 }</span>건</td>
				<td><span>${countState5 }</span>건</td>
				<td><span>${countState6 }</span>건</td>
			</tr>
		</table>
		
		<h3 class="title"><i class="fa fa-angle-right" aria-hidden="true"></i>전체 주문</h3>
		<table class="tbl02">
			<tr>
				<th>주문일</th>
				<th>주문자</th>
				<th>주문번호</th>
				<th>총주문금액</th>
				<th>실결제금액</th>
				<th>결제수단</th>
				<th>입금</th>
				<th>배송</th>
				<th>후기</th>
				<th>취소</th>
			</tr>
			<c:choose>
			<c:when test="${empty orderList}">
			<tr class="empty">
				<td colspan="10">주문한 회원이 없습니다.</td>
			</tr>
			</c:when>
			<c:otherwise>
			<c:forEach var="order" items="${orderList }">
			<tr>
				<td><fmt:formatDate value="${order.orderDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${order.memName }</td>
				<td><a href="detail.do?m=${m}&page=${pageMaker.cri.page}&no=${order.orderNo}" class="link">${order.orderSerial }</a></td>
				<td><fmt:formatNumber value="${order.totalPrice }" pattern="#,##0" /> 원</td>
				<td><fmt:formatNumber value="${order.realPrice }" pattern="#,##0" /> 원</td>
				<td>${order.orderWay }</td>
				<td><c:out value="${order.orderState eq 1 ? 'X' : 'O' }" /></td>
				<td><c:out value="${order.orderState eq 4 ? 'O' : 'X' }" /></td>
				<td><c:out value="${order.reviewyn eq 'y'.charAt(0) ? 'O' : 'X' }" /></td>
				<td><c:out value="${order.cancelyn eq 'y'.charAt(0) ? 'O' : 'X' }" /></td>
			</tr>
			</c:forEach>
			</c:otherwise>
			</c:choose>
		</table>
		
		<ul class="paging">
		<c:if test="${pageMaker.prev}">
			<li><a href="list.do?m=${m}&page=${pageMaker.startPage - 1}">&laquo;</a></li>
		</c:if>
		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
			<li
				<c:out value="${pageMaker.cri.page == idx?'class=on':''}"/>>
				<a href="list.do?m=${m}&page=${idx}">${idx}</a>
			</li>
		</c:forEach>
		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			<li><a href="list.do?m=${m}&page=${pageMaker.endPage +1}">&raquo;</a></li>
		</c:if>
		</ul>
	</div>
	
	<%@ include file="/WEB-INF/views/admin/include/sidebar3.jsp" %>
</div>
<!-- container (E) -->
