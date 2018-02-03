<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/admin/include/header.jsp" %>

<!-- container (S) -->
<div id="container">
	<div class="content">
		<h3 class="title"><i class="fa fa-angle-right" aria-hidden="true"></i>입금대기 관리</h3>
		<table class="tbl02">
			<tr>
				<th>주문일</th>
				<th>주문자</th>
				<th>주문번호</th>
				<th>핸드폰</th>
				<th>총주문금액</th>
				<th>실결제금액</th>
				<th>결제수단</th>
				<th>입금계좌</th>
				<th>비고</th>
			</tr>
			<c:choose>
			<c:when test="${empty orderList}">
			<tr class="empty">
				<td colspan="9">입금 대기자가 없습니다.</td>
			</tr>
			</c:when>
			<c:otherwise>
			<c:forEach var="order" items="${orderList}">
			<tr>
				<td><fmt:formatDate value="${order.orderDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${order.memName }</td>
				<td><a href="detail.do?m=${m}&s=${s}&page=${pageMaker.cri.page}&no=${order.orderNo}" class="link">${order.orderSerial }</a></td>
				<td>${order.memPhone }</td>
				<td><fmt:formatNumber value="${order.totalPrice }" pattern="#,##0" /> 원</td>
				<td><fmt:formatNumber value="${order.realPrice }" pattern="#,##0" /> 원</td>
				<td>${order.orderWay }</td>
				<td><c:choose>
					<c:when test="${order.orderWay eq '무통장입금'}">${order.depAccount }</c:when>
					<c:otherwise>-</c:otherwise>
				</c:choose>
				</td>
				<td>
				<c:choose>
				<c:when test="${order.cancelyn ne 'r'.charAt(0) }">
					<a href="javascript:go_depwait('${m}', '${s}', '${order.orderNo}', '${pageMaker.cri.page}')" class="btn btn01">입금확인</a>
				</c:when>
				<c:otherwise><span class="red">주문취소 요청</span></c:otherwise>
				</c:choose>
				</td>
			</tr>
			</c:forEach>
			</c:otherwise>
			</c:choose>
		</table>
		
		<ul class="paging">
		<c:if test="${pageMaker.prev}">
			<li><a href="depwait.do?m=${m}&s=${s}&page=${pageMaker.startPage - 1}">&laquo;</a></li>
		</c:if>
		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
			<li
				<c:out value="${pageMaker.cri.page == idx?'class=on':''}"/>>
				<a href="depwait.do?m=${m}&s=${s}&page=${idx}">${idx}</a>
			</li>
		</c:forEach>
		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			<li><a href="depwait.do?m=${m}&s=${s}&page=${pageMaker.endPage +1}">&raquo;</a></li>
		</c:if>
		</ul>
	</div>
	
	<%@ include file="/WEB-INF/views/admin/include/sidebar3.jsp" %>
</div>
<!-- container (E) -->

<script src="${pageContext.request.contextPath }/resources/js/admin.js"></script>
<script>
	if('${msg}' != '')
		alert('${msg}');
</script>