<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/admin/include/header.jsp" %>

<!-- container (S) -->
<div id="container">
	<div class="content">
		<h3 class="title"><i class="fa fa-angle-right" aria-hidden="true"></i>가입승인</h3>
		<table class="tbl02">
			<tr>
				<th>상호명</th>
				<th>대표자</th>
				<th>사업자등록번호</th>
				<th>아이디</th>
				<th>성명</th>
				<th>핸드폰</th>
				<th>신청일</th>
				<th>비고</th>
			</tr>
			<c:choose>
			<c:when test="${empty adminList}">
			<tr class="empty">
				<td colspan="8">가입 신청한 회원이 없습니다.</td>
			</tr>
			</c:when>
			<c:otherwise>
			<c:forEach var="admin" items="${adminList}">
			<tr>
				<td>${admin.company }</td>
				<td>${admin.represent }</td>
				<td>${admin.busiNo }</td>
				<td>${admin.id }</td>
				<td>${admin.name }</td>
				<td>${admin.phone }</td>
				<td><fmt:formatDate value="${admin.regdate }" pattern="yyyy-MM-dd"/></td>
				<td>
					<a href="javascript:permitYes('${m}', '${s}', '${admin.id}', '${pageMaker.cri.page}')" class="btn btn01">승인</a>
					<a href="javascript:permitNo('${m}', '${s}', '${admin.id}', '${pageMaker.cri.page}')" class="btn btn01">거부</a>
				</td>
			</tr>
			</c:forEach>
			</c:otherwise>
			</c:choose>
		</table>
		
		<ul class="paging">
		<c:if test="${pageMaker.prev}">
			<li><a href="permit.do?m=${m}&s=${s}&page=${pageMaker.startPage - 1}">&laquo;</a></li>
		</c:if>
		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
			<li
				<c:out value="${pageMaker.cri.page == idx?'class=on':''}"/>>
				<a href="permit.do?m=${m}&s=${s}&page=${idx}">${idx}</a>
			</li>
		</c:forEach>
		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			<li><a href="permit.do?m=${m}&s=${s}&page=${pageMaker.endPage +1}">&raquo;</a></li>
		</c:if>
		</ul>
	</div>
	
	<%@ include file="/WEB-INF/views/admin/include/sidebar1.jsp" %>
</div>
<!-- container (E) -->

<script src="${pageContext.request.contextPath }/resources/js/admin.js"></script>