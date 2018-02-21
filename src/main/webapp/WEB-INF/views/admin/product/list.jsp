<%@page import="com.dawn.angel.util.MenuUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/admin/include/header.jsp" %>

<!-- container (S) -->
<div id="container">
	<div class="content">
		<table class="tbl01">
			<tr class="title">
				<th colspan="3">상품현황</th>
			</tr>
			<tr class="title2">
				<th>전체등록 상품</th>
				<th>판매중 상품</th>
				<th>총 판매량</th>
			</tr>
			<tr>
				<td><span>${totalCount }</span>개</td>
				<td><span>${useCount }</span>개</td>
				<td><span>${totalOrderCount }</span>개</td>
			</tr>
		</table>
		
		<h3 class="title"><i class="fa fa-angle-right" aria-hidden="true"></i>전체 상품</h3>
		<table class="tbl02">
			<tr>
				<th>분류</th>
				<th>상품명</th>
				<th>판매가</th>
				<th>회원가</th>
				<th>적립금</th>
				<th>판매 상태</th>
				<th>베스트 여부</th>
				<th>판매량</th>
				<th>관리</th>
			</tr>
			<c:choose>
			<c:when test="${empty prodList }">
			<tr class="empty">
				<td colspan="9">등록된 상품이 없습니다.</td>
			</tr>
			</c:when>
			<c:otherwise>
			<c:forEach var="prod" items="${prodList }">
			<tr>
				<td>
				<c:choose>
				<c:when test="${prod.category eq 1 }">근조 화환</c:when>
				<c:when test="${prod.category eq 2 }">근조 바구니</c:when>
				<c:when test="${prod.category eq 3 }">축하 화환</c:when>
				<c:when test="${prod.category eq 4 }">꽃다발</c:when>
				<c:when test="${prod.category eq 5 }">꽃바구니</c:when>
				<c:when test="${prod.category eq 6 }">동·서양란</c:when>
				<c:when test="${prod.category eq 7 }">★ 플라워</c:when>
				</c:choose>
				</td>
				<td class="name">
					<img src="${pageContext.request.contextPath }/resources/upload/product/${prod.image}" />
					<p>${prod.name}</p>
				</td>
				<td><fmt:formatNumber value="${prod.price1 }" pattern="#,##0"/>원</td>
				<td><fmt:formatNumber value="${prod.price2 }" pattern="#,##0"/>원</td>
				<td><fmt:formatNumber value="${prod.save }" pattern="#,##0"/>원</td>
				<td><c:choose>
					<c:when test="${prod.useyn eq 'y'.charAt(0) }">판매중</c:when>
					<c:otherwise><span class="red">미판매</span></c:otherwise>
				</c:choose></td>
				<td><c:choose>
					<c:when test="${prod.bestyn eq 'y'.charAt(0) }">진열중</c:when>
					<c:otherwise><span class="red">미진열</span></c:otherwise>
				</c:choose></td>
				<td>${prod.orderCount } 개</td>
				<td>
					<a href="javascript:go_modifyProd('${m}', '${prod.prodNo}', '${pageMaker.cri.page}')" class="btn btn01">변경</a>
					<a href="javascript:go_removeProd('${m}', '${prod.prodNo}', '${pageMaker.cri.page}')" class="btn btn01">삭제</a>
				</td>
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
	
	<%@ include file="/WEB-INF/views/admin/include/sidebar2.jsp" %>
</div>
<!-- container (E) -->
<script src="${pageContext.request.contextPath }/resources/js/admin.js"></script>
<script>
	if('${msg}' != '')
		alert('${msg}');
</script>