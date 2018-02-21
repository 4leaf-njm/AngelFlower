<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/admin/include/header.jsp" %>

<!-- container (S) -->
<div id="container">
	<div class="main">
		<div class="left">
			<h2 class="title">오늘의 할 일</h2>
			<table class="tbl05">
				<tr>
					<th style="width: 120px;">미입금 체크</th>
					<th style="width: 120px;">미배송</th>
					<th style="width: 125px;">배송완료 체크전</th>
					<th style="width: 120px;">후기 미작성</th>
				</tr>
				<tr>
					<td><b>${orderState1}</b></td>
					<td><b>${orderState2}</b></td>
					<td><b>${orderState3}</b></td>
					<td><b>${orderState4}</b></td>
				</tr>
			</table>
			<h2 class="title">주문 현황</h2>
			<table class="tbl05 vert">
				<tr>
					<th style="width: 150px;">주문현황</th>
					<th style="width: 160px;">주문</th>
					<th style="width: 160px;">주문금액</th>
				</tr>
				<tr>
					<td>오늘</td>
					<td><b>${dayTotalCount}</b>건</td>
					<td><b><fmt:formatNumber value="${dayTotalPrice}" pattern="#,##0"/></b>원</td>
				</tr>
				<tr>
					<td>이번달</td>
					<td><b>${monthTotalCount}</b>건</td>
					<td><b><fmt:formatNumber value="${monthTotalPrice}" pattern="#,##0"/></b>원</td>
				</tr>
			</table>
			<h2 class="title">회원 현황</h2>
			<table class="tbl05 vert">
				<tr>
					<th style="width: 150px;">회원현황</th>
					<th style="width: 160px;">신규회원 수</th>
					<th style="width: 160px;">방문자 수</th>
				</tr>
				<tr>
					<td>오늘</td>
					<td><b>${dayNewCount}</b>명</td>
					<td><b>${sessionScope.todayVisitCount}</b>명</td>
				</tr>
				<tr>
					<td>이번달</td>
					<td><b>${monthNewCount}</b>명</td>
					<td><b>${sessionScope.monthVisitCount}</b>명</td>
				</tr>
			</table>
		</div>
		<div class="right">
			<h2 class="title">공지사항</h2>
			<ul>
				<c:choose>
				<c:when test="${empty noticeList }">
				<li>
					<h4>작성된 공지가 없습니다.</h4>
				</li>
				</c:when>
				<c:otherwise>
				<c:forEach var="notice" items="${noticeList}">
				<li>
					<h4><a href='<c:url value="/admin/store/notice.do?m=8" />'>${notice.noticeTitle}</a></h4>
					<p><fmt:formatDate value="${notice.noticeDate}" pattern="yyyy-MM-dd"/></p>
				</li>
				</c:forEach>
				</c:otherwise>
				</c:choose>
			</ul>
			<h2 class="title">상품후기</h2>
			<ul>
				<c:choose>
				<c:when test="${empty reviewList }">
				<li>
					<h4>작성된 공지가 없습니다.</h4>
				</li>
				</c:when>
				<c:otherwise>
				<c:forEach var="review" items="${reviewList}">
				<li>
					<h3>
					<c:choose>
					<c:when test="${review.memId eq null }">비회원</c:when>
					<c:otherwise>${review.memId}</c:otherwise>
					</c:choose>
					</h3>
					<h4><a href='<c:url value="/admin/rev/prdlist.do?m=7&s=3" />'>${review.comContent }</a></h4>
					<p><fmt:formatDate value="${review.comRegdate}" pattern="yyyy-MM-dd"/></p>
				</li>
				</c:forEach>
				</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</div>
<!-- container (E) -->
<script src="${pageContext.request.contextPath }/resources/js/admin.js"></script>
<script>
	if('${msg}' != '')
		alert('${msg}');
</script>