<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/product/product.css" />
</head>

<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!-- container (S) -->
<div id="container">
	<div class="item">
	<c:choose>
	<c:when test="${menu eq 0}">
	<form method="get" name="frm_search2">
		<div class="search">
			<img src="${pageContext.request.contextPath }/resources/images/img/img_search.jpg" />
			<div>
				<div>
					<label>상품명 검색<input type="text" name="pname" /></label>
				</div>
				<div>
					<label>가격대 검색
					<select name="p1" style="width: 95px; font-size: 14px;">
						<option value="">제한없음</option>
						<option value="10000">10000</option>
						<option value="30000">30000</option>
						<option value="50000">50000</option>
						<option value="70000">70000</option>
						<option value="90000">90000</option>
						<option value="110000">110000</option>
						<option value="130000">130000</option>
					</select> 원 ~
					<select name="p2" style="width: 95px; font-size: 14px;">
						<option value="">제한없음</option>
						<option value="20000">20000</option>
						<option value="40000">40000</option>
						<option value="60000">60000</option>
						<option value="80000">80000</option>
						<option value="100000">100000</option>
						<option value="120000">120000</option>
						<option value="140000">140000</option>
					</select> 원</label>
					
				</div>
				<a href="javascript:search()">상세검색</a>
			</div>
		</div>
	</form>
	<script>
		function search() {
			document.frm_search2.submit();
		}
	</script>
	</c:when>
	<c:otherwise>
		<div class="titbox">
			<h3 class="title">${title}</h3>
			<p class="subtit">${subtit}</p>
		</div>
	</c:otherwise>
	</c:choose>
		<h3 class="count">총 <span>${count}</span>개의 상품이 검색되었습니다.</h3> 
		<div class="item_list">
			<ul class="list">
			<c:choose>
			<c:when test="${empty prodList}">
				<li class="empty">해당하는 상품이 없습니다.</li>
			</c:when>
			<c:otherwise>
			<c:forEach var="prod" items="${prodList}">
				<li class="go_detail" data-no="${prod.prodNo}">
					<img src="${pageContext.request.contextPath }/resources/upload/product/${prod.image}" />
					<div>
						<h3>${prod.name}</h3>
						<p class="price">판매가 : <span><fmt:formatNumber value="${prod.price1}" pattern="#,##0" /></span> 원</p>
						<p class="sale">회원가 : <strong><fmt:formatNumber value="${prod.price2}" pattern="#,##0" /></strong> 원</p>
						<p><span class="lbl lbl01">적립금</span><fmt:formatNumber value="${prod.save}" pattern="#,##0" /></p>
					</div>
				</li>
			</c:forEach>
			</c:otherwise>
			</c:choose>
			</ul>
			
			<script>
			$('.go_detail').click(function(){
				var prodNo = $(this).data('no');
				var menu = '${menu}';
				location.href='<c:url value="detail.do?menu=' + menu + '&no=' + prodNo + '"/>';
			})
			$('.go_detail').hover(function(){
				$(this).find('h3').addClass('on');
			}, function(){
				$(this).find('h3').removeClass('on');
			});
		</script>
		</div>
	</div>
		
	<%@ include file="/WEB-INF/views/include/quick.jsp" %>
</div>
<!-- container (E) -->

<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script src="${pageContext.request.contextPath }/resources/js/product.js"></script>