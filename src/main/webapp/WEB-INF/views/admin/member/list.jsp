<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/admin/include/header.jsp" %>

<!-- container (S) -->
<div id="container">
	<div class="content">
		<table class="tbl01">
			<tr class="title">
				<th colspan="5">회원현황</th>
			</tr>
			<tr class="title2">
				<th>일반회원 수</th>
				<th>기업회원 수</th>
				<th>총 주문 건수</th>
				<th>총 발주 건수</th>
				<th>총 탈퇴 회원수</th>
			</tr>
			<tr>
				<td><span>${memCount}</span>명</td>
				<td><span>${adminCount}</span>명</td>
				<td><span>${orderCount}</span>건</td>
				<td><span>${totalBaljuCount}</span>건</td>
				<td><span>${leaveCount}</span>명</td>
			</tr>
		</table>
		
		<h3 class="title"><i class="fa fa-angle-right" aria-hidden="true"></i>일반 회원</h3>
		<table class="tbl02" id="ajaxMember"></table>
		
		<ul class="paging" id="memberPaging"></ul>
		
		<h3 class="title"><i class="fa fa-angle-right" aria-hidden="true"></i>기업 회원</h3>
		<table class="tbl02" id="ajaxAdmin"></table>
		
		<ul class="paging" id="adminPaging"></ul>
	</div>
	
	<%@ include file="/WEB-INF/views/admin/include/sidebar1.jsp" %>
	
</div>
<!-- container (E) -->
<script src="${pageContext.request.contextPath }/resources/js/admin.js"></script>
<script>
	ajaxMemberPaging(1);
	ajaxAdminPaging(1);
</script>
