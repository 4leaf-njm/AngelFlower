<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/admin/include/header.jsp" %>

<!-- container (S) -->
<div id="container">
	<div class="content">
		<h3 class="title"><i class="fa fa-angle-right" aria-hidden="true"></i>받은발주 관리</h3>
		<table class="tbl02">
			<tr>
				<th>발주일자</th>
				<th>발주번호</th>
				<th>상호명</th>
				<th>성명</th>
				<th>핸드폰</th>
				<th>받는 금액</th>
				<th>상태</th>
				<th>비고</th>
			</tr>
			<c:choose>
			<c:when test="${empty baljuList}">
			<tr class="empty">
				<td colspan="8">받은 발주가 없습니다.</td>
			</tr>
			</c:when>
			<c:otherwise>
			<c:forEach var="balju" items="${baljuList}">
			<tr>
				<td><fmt:formatDate value="${balju.baljuDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${balju.baljuSerial }</td>
				<td>${balju.baljuSendCompany }</td>
				<td>${balju.baljuSendName }</td>
				<td>${balju.baljuSendPhone }</td>
				<td><fmt:formatNumber value="${balju.baljuRecPrice }" pattern="#,##0" /> 원</td>
				<td>
				<c:choose>
				<c:when test="${balju.checkyn eq 'y'.charAt(0)}">승인</c:when>
				<c:otherwise><span class="red">미승인</span></c:otherwise>
				</c:choose>
				</td>
				<td>
					<a href="javascript:go_permitBalju('${m}', '${s}', '${balju.baljuNo }', '${pageMaker.cri.page}')" class="btn btn01">승인</a>
				</td>
			</tr>
			</c:forEach>
			</c:otherwise>
			</c:choose>
		</table>
		
		<ul class="paging">
		<c:if test="${pageMaker.prev}">
			<li><a href="reclist.do?m=${m}&s=${s}&page=${pageMaker.startPage - 1}">&laquo;</a></li>
		</c:if>
		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
			<li
				<c:out value="${pageMaker.cri.page == idx?'class=on':''}"/>>
				<a href="reclist.do?m=${m}&s=${s}&page=${idx}">${idx}</a>
			</li>
		</c:forEach>
		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			<li><a href="reclist.do?m=${m}&s=${s}&page=${pageMaker.endPage +1}">&raquo;</a></li>
		</c:if>
		</ul>
	</div>
	
	<%@ include file="/WEB-INF/views/admin/include/sidebar4.jsp" %>
</div>
<!-- container (E) -->

<script src="${pageContext.request.contextPath }/resources/js/admin.js"></script>
<script>
	if('${msg}' != '')
		alert('${msg}');
</script>