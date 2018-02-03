<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/admin/include/header.jsp" %>

<!-- container (S) -->
<div id="container">
	<div class="content">
		<table class="tbl01">
			<tr class="title">
				<th colspan="4">후기현황</th>
			</tr>
			<tr class="title2">
				<th>전체 배송후기</th>
				<th>미작성 배송후기</th>
				<th>전체 상품후기</th>
				<th>미답변 상품후기</th>
			</tr>
			<tr>
				<td><span>${totalRevCount }</span>건</td>
				<td><span>${noRevCount }</span>건</td>
				<td><span>${totalPrdCount }</span>건</td>
				<td><span>${noPrdCount }</span>건</td>
			</tr>
		</table>
		
		<h3 class="title"><i class="fa fa-angle-right" aria-hidden="true"></i>전체 배송후기</h3>
		<table class="tbl02">
			<tr>
				<th style="width:130px;">분류</th>
				<th style="width:80px;">배송사진</th>
				<th style="width:130px;">배송지역</th>
				<th style="width:130px;">주문자</th>
				<th style="width:210px;">배송상품</th>
				<th style="width:130px;">구매가격</th>
				<th style="width:300px;">후기내용</th>
				<th style="width:100px;">비고</th>
			</tr>
			<c:choose>
			<c:when test="${empty reviewList}">
			<tr class="empty">
				<td colspan="8">작성한 배송후기가 없습니다.</td>
			</tr>
			</c:when>
			<c:otherwise>
			<c:forEach var="review" items="${reviewList}">
			<tr>
				<td>
				<c:choose>
				<c:when test="${review.category eq 1 }">근조 화환</c:when>
				<c:when test="${review.category eq 2 }">근조 바구니</c:when>
				<c:when test="${review.category eq 3 }">축하 화환</c:when>
				<c:when test="${review.category eq 4 }">꽃다발</c:when>
				<c:when test="${review.category eq 5 }">꽃바구니</c:when>
				<c:when test="${review.category eq 6 }">동·서양란</c:when>
				<c:when test="${review.category eq 7 }">★ 플라워</c:when>
				</c:choose>
				</td>
				<td style="padding: 5px 0;"><img src="${pageContext.request.contextPath }/resources/upload/review/${review.revImage }" width="45" height="50"/></td>
				<td>${review.revRegion }</td>
				<td>${review.revTitle }</td>
				<td>${review.revProd }</td>
				<td><fmt:formatNumber value="${review.revPrice }" pattern="#,##0" /></td>
				<td style="vertical-align: top; text-align: left; padding: 10px; line-height: 150%;">${review.revContent }</td>
				<td>
					<a href="javascript:go_modifyShip('${m}', '${review.reviewNo}', '${pageMaker.cri.page}')" class="btn btn01">수정</a>
					<a href="javascript:go_removeShip('${m}', '${review.reviewNo}', '${pageMaker.cri.page}')" class="btn btn01">삭제</a>
				</td>
			</tr>
			</c:forEach>
			</c:otherwise>
			</c:choose>
		</table>
		
		<ul class="paging">
		<c:if test="${pageMaker.prev}">
			<li><a href="shiplistdo?m=${m}&page=${pageMaker.startPage - 1}">&laquo;</a></li>
		</c:if>
		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
			<li
				<c:out value="${pageMaker.cri.page == idx?'class=on':''}"/>>
				<a href="shiplist.do?m=${m}&page=${idx}">${idx}</a>
			</li>
		</c:forEach>
		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			<li><a href="shiplist.do?m=${m}&page=${pageMaker.endPage +1}">&raquo;</a></li>
		</c:if>
		</ul>
	</div>
	
	<%@ include file="/WEB-INF/views/admin/include/sidebar6.jsp" %>
</div>
<!-- container (E) -->

<script src="${pageContext.request.contextPath }/resources/js/admin.js"></script>
<script>
	if('${msg}' != '')
		alert('${msg}');
</script>