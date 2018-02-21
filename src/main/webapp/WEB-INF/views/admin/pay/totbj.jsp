<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/admin/include/header.jsp" %>

<!-- container (S) -->
<div id="container">
	<div class="content">
		<div>
			<h3 class="title" style="float: left;"><i class="fa fa-angle-right" aria-hidden="true"></i>총 발주 내역</h3>
		</div>
		<table class="tbl02">
			<tr>
				<th>발주일자</th>
				<th>고객명</th>
				<th>발주자</th>
				<th>발주금</th>
				<th>가진금액</th>
				<th>받는자</th>
				<th>받은금액</th>
				<th style="width: 130px;">승인여부</th>
				<th style="width: 130px;">배송상태</th>
			</tr>
			
			<c:choose>
			<c:when test="${empty baljuList}">
			<tr class="empty">
				<td colspan="9">발주 내역이 없습니다.</td>
			</tr>
			</c:when>
			<c:otherwise>
			<c:forEach var="balju" items="${baljuList }">
			<tr>
				<td><fmt:formatDate value="${balju.baljuDate }" pattern="yyyy-MM-dd"/></td>
				<td>${balju.baljuMemName}</td>
				<td>${balju.baljuSendName }</td>
				<td><fmt:formatNumber value="${balju.baljuPrice }" pattern="#,##0" /> 원</td>
				<td><fmt:formatNumber value="${balju.baljuSendPrice }" pattern="#,##0" /> 원</td>
				<td>${balju.baljuRecName }</td>
				<td><fmt:formatNumber value="${balju.baljuRecPrice }" pattern="#,##0" /> 원</td>
				<td>
				<c:choose>
				<c:when test="${balju.checkyn eq 'y'.charAt(0)}">승인</c:when>
				<c:otherwise>미승인</c:otherwise>
				</c:choose>
				</td>
				<td>
				<c:choose>
				<c:when test="${balju.orderState eq 1}">입금대기</c:when>
				<c:when test="${balju.orderState eq 2}">상품준비</c:when>
				<c:when test="${balju.orderState eq 3}">배송중</c:when>
				<c:when test="${balju.orderState eq 4}">배송완료</c:when>
				</c:choose>
				</td>
			</tr>
			</c:forEach>
			</c:otherwise>
			</c:choose>
		</table>
		
		<ul class="paging">
		<c:if test="${pageMaker.prev}">
			<li><a href="totbj.do?m=${m}&s=${s}&page=${pageMaker.startPage - 1}">&laquo;</a></li>
		</c:if>
		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
			<li
				<c:out value="${pageMaker.cri.page == idx?'class=on':''}"/>>
				<a href="totbj.do?m=${m}&s=${s}&page=${idx}">${idx}</a>
			</li>
		</c:forEach>
		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			<li><a href="totbj.do?m=${m}&s=${s}&page=${pageMaker.endPage +1}">&raquo;</a></li>
		</c:if>
		</ul>
	</div>
	
	<%@ include file="/WEB-INF/views/admin/include/sidebar5.jsp" %>
</div>
<!-- container (E) -->
<script>
	if('${msg}' != '')
		alert('${msg}');
</script>