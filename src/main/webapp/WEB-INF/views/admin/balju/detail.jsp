<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/admin/include/header.jsp" %>

<!-- container (S) -->
<div id="container">
	<div class="content">
		<h3 class="title"><i class="fa fa-angle-right" aria-hidden="true"></i>${balju.baljuSendName} 님의 발주 신청내역<span>발주번호 : ${balju.baljuSerial}</span></h3>
		<table class="tbl03 hori">
			<tr>
				<th colspan="5">주문 리스트</th>
			</tr>
			<tr>
				<th style="width:80px;">분류</th>
				<th>상품명</th>
				<th style="width:80px;">수량</th>
			</tr>
			<c:forEach var="balju" items="${baljuList }">
			<tr>
				<td>
				<c:choose>
				<c:when test="${balju.category eq 1 }">근조 화환</c:when>
				<c:when test="${balju.category eq 2 }">근조 바구니</c:when>
				<c:when test="${balju.category eq 3 }">축하 화환</c:when>
				<c:when test="${balju.category eq 4 }">꽃다발</c:when>
				<c:when test="${balju.category eq 5 }">꽃바구니</c:when>
				<c:when test="${balju.category eq 6 }">동·서양란</c:when>
				<c:when test="${balju.category eq 7 }">★ 플라워</c:when>
				</c:choose>
				</td>
				<td class="name">
					<img src="${pageContext.request.contextPath }/resources/upload/product/${balju.prodImage}" />
					<p>${balju.prodName }</p>
				</td>
				<td>${balju.quantity } 개</td>
			</tr>
			</c:forEach>
		</table>
	
		<table class="tbl03">
			<tr>
				<th colspan="2">주문고객 정보</th>
			</tr>
			<tr>
				<th>고객명</th>
				<td>${balju.baljuMemName }</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>${balju.baljuMemPhone }</td>
			</tr>
		</table>
		
		<div class="btn_box">
			<a href="javascript:history.go(-1)" class="btn btn03">확인 완료</a>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/admin/include/sidebar4.jsp" %>
</div>
<!-- container (E) -->
<script src="${pageContext.request.contextPath }/resources/js/admin.js"></script>