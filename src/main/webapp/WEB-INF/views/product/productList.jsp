<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
	<title>근조화환 | 엔젤 플라워</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/product/product.css" />
</head>

<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!-- container (S) -->
<div id="container">
	<div class="item">
		<div class="top">
			<h2>${menu}</h2>
			<!-- <span>총 121개의 상품이 검색되었습니다.</span> -->
			<ul>
				<li class="on"><a href="#">인기순</a></li>
				<li><a href="#">상품후기많은순</a></li>
				<li><a href="#">높은가격순</a></li>
				<li><a href="#">낮은가격순</a></li>
			</ul>
			
			<table>
			<c:forEach var="prod" items="${prodList}" varStatus="status">
				<c:if test="${status.index eq 0 || status.index eq 3 }"><tr></c:if>
					<td data-no="${prod.prodNo }" 
					   <c:if test="${status.first}">rowspan="2"</c:if> 
					   class="<c:if test="${status.first}">one </c:if>go_detail">
						<img src="${pageContext.request.contextPath }/resources/images/item/${prod.image}" alt="${prod.name }" />
						<div>
							<h3>${prod.name }</h3>
							<p class="price"><span><fmt:formatNumber value="${prod.price1}" pattern="#,##0"/></span><fmt:formatNumber value="${prod.price2}" pattern="#,##0"/>원</p>
							<p><span class="lbl lbl01">적립금</span><fmt:formatNumber value="${prod.save}" pattern="#,##0" /></p>
						</div>
					</td>
				<c:if test="${status.index eq 2 || status.index eq 4 }"></tr></c:if>
			</c:forEach>
			</table>
		</div>

		<%-- <div class="item_list">
			<ul class="list">
				<li class="go_detail">
					<img src="${pageContext.request.contextPath }/resources/images/item/sample_01.jpg" alt="근조화환 3단" width="150" height="210"/>
					<div>
						<h3>[ST-FB141] 근조3단</h3>
						<p class="price">판매가 : 77,000 원</p>
						<p class="sale">회원가 : <strong>74,700</strong>원</p>
						<p><span class="lbl lbl01">적립금</span>5,400</p>
					</div>
				</li>
			</ul>
			<ul class="paging">
				<li class="on"><a href="#">1</a></li>
				<li><a href="#">2</a></li>
			</ul>
		</div> --%>
		<script>
			$('.go_detail').click(function(){
				var prodNo = $(this).data('no');
				location.href='<c:url value="detail.do?no=' + prodNo + '"/>';
			})
			$('.go_detail').hover(function(){
				$(this).find('h3').addClass('on');
			}, function(){
				$(this).find('h3').removeClass('on');
			});
		</script>
	</div>
	
	<div class="review">
		<h2><img src="${pageContext.request.contextPath }/resources/images/text/txt_delivery.png" alt=""/></h2>
		<div>
			<ul class="menu">
				<li class="on" data-menu="menu01">근조화환</li>
				<li data-menu="menu02">근조바구니</li>
				<li data-menu="menu03">축하화환</li>
				<li data-menu="menu04">꽃다발</li>
				<li data-menu="menu05">꽃바구니</li>
				<li data-menu="menu06">동·서양란</li>
			</ul>
			
			<ul class="list">
				<c:forEach var="review" items="${reviewList}">
				<li>
					<img src="${pageContext.request.contextPath }/resources/images/item/${review.image}" alt="${review.prodName}" />
					<div class="region">
						<span>배송지역</span>
						<h3>${review.region}</h3>
					</div>
					<div class="info">
						<h3>${review.prodName}</h3>
						<p><fmt:formatNumber value="${review.price2}" pattern="#,##0" />원</p>
					</div>
				</li>
				</c:forEach>
			</ul>
		</div>
	</div>
		
	<%@ include file="/WEB-INF/views/include/quick.jsp" %>
</div>
<!-- container (E) -->

<%@ include file="/WEB-INF/views/include/footer.jsp" %>