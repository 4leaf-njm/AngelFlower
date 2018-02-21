<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/product/product.css" />
</head>

<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!-- container (S) -->
<div id="container">
	<div class="item">
		<div class="top">
			<h2>${menu}</h2>
			<!-- <span>총 121개의 상품이 검색되었습니다.</span> -->
			<ul class="sort">
				<li><a href="list.do?menu=${param.menu}&sort=1">인기순</a></li>
				<li><a href="list.do?menu=${param.menu}&sort=2">상품후기많은순</a></li>
				<li><a href="list.do?menu=${param.menu}&sort=3">높은가격순</a></li>
				<li><a href="list.do?menu=${param.menu}&sort=4">낮은가격순</a></li>
			</ul>
			
			<table>
			<c:forEach var="prod" items="${prodList}" varStatus="status">
				<c:if test="${status.index eq 0 || status.index eq 3 }"><tr></c:if>
					<td data-no="${prod.prodNo }" 
					   <c:if test="${status.first}">rowspan="2"</c:if> 
					   class="<c:if test="${status.first}">one </c:if>go_detail">
						<img src="${pageContext.request.contextPath }/resources/upload/product/${prod.image}" alt="${prod.name }" />
						<div>
							<h3>${prod.name }</h3>
							<p class="price"><span><fmt:formatNumber value="${prod.price1}" pattern="#,##0"/></span><fmt:formatNumber value="${prod.price2}" pattern="#,##0"/>원</p>
							<p><span class="lbl lbl01">적립금</span><fmt:formatNumber value="${prod.save}" pattern="#,##0" /></p>
						</div>
					</td>
				<c:if test="${status.index eq 2 || status.index eq 4 }"></tr></c:if>
			</c:forEach>
			<c:if test="${fn:length(prodList) < 5}">
			<c:forEach begin="${fn:length(prodList)}" end="4" varStatus="status">
				<c:if test="${status.index eq 0 || status.index eq 3 }"><tr></c:if>
					<td <c:if test="${status.index eq 0}">rowspan="2"</c:if> 
					   class="<c:if test="${status.index eq 0}">one</c:if>" style="padding:5px 30px;; text-align: center;">
						<img src="${pageContext.request.contextPath }/resources/images/item/default.jpg" style="width:210px; height: 240px;"/>
					</td>
				<c:if test="${status.index eq 2 || status.index eq 4 }"></tr></c:if>
			</c:forEach>
			</c:if>
			</table>
		</div>
		
		<ul class="paging">
			<c:if test="${pageMaker.prev}">
				<li><a href="javascript:go_prodList('${category}', '${pageMaker.startPage - 1}', '${sort}')">&laquo;</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
				<li
					<c:out value="${pageMaker.cri.page == idx?'class=on':''}"/>>
					<a href="javascript:go_prodList('${category}', '${idx}', '${sort}')">${idx}</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li><a href="javascript:go_prodList('${category}', '${pageMaker.endPage +1}', '${sort}')">&raquo;</a></li>
			</c:if>
		</ul>
		
		<script>
			$('.go_detail').click(function(){
				var prodNo = $(this).data('no');
				var menu = '${param.menu}';
				var sort = '${sort}';
				var page = '${pageMaker.cri.page}';
				location.href='<c:url value="detail.do?menu=' + menu + '&sort=' + sort + '&page=' + page + '&no=' + prodNo + '"/>';
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
		
		<div class="top">
			<div class="nav">
				<ul>
					<li class="on" data-type="0">전체 후기<span class="line"></span></li>
					<li data-type="1">배송 후기<span class="line"></span></li>
					<li data-type="2">회원 후기<span class="line"></span></li>
				</ul>
				<script>
					$('.review .nav li').click(function(){
						$('.review .nav li').removeClass('on');
						$(this).addClass('on');
						
						var menu = $('.reviewTap .menu li.on').data('menu');
						var type = $(this).data('type');
					
						ajaxReviewList(menu, type, 1);
					});
				</script>
			</div>
			
			<div class="search">
				<p>지역별 검색</p>
				<select name="sido" id="sido" class="sel_addr">
					<option value="">시/도</option>
					<option value="">전체</option>
					<c:forEach var="sido" items="${sidoList }">
					<option value="${sido }">${sido }</option>
					</c:forEach>
				</select>
				<select name="gugun" id="gugun" class="sel_addr">
					<option value="">구/군</option>
				</select>
			</div>
		</div>
		
		<div class="reviewTap">
			<ul class="menu">
				<li class="on" data-menu="1">근조화환</li>
				<li data-menu="2">근조바구니</li>
				<li data-menu="3">축하화환</li>
				<li data-menu="4">꽃다발</li>
				<li data-menu="5">꽃바구니</li>
				<li data-menu="6">동·서양란</li>
			</ul>
			
			<ul class="list"></ul>
			
			<ul class="paging"></ul>
		</div>
	</div>
		
	<%@ include file="/WEB-INF/views/include/quick.jsp" %>
</div>
<!-- container (E) -->

<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script src="${pageContext.request.contextPath }/resources/js/product.js"></script>

<script>
	ajaxReviewList(1, 0, 1);
	$('.review .menu > li').click(function(){
		$('.review .menu > li').removeClass('on');
		$(this).addClass('on');
		
		var menu = $(this).data('menu');
		var type = $('.top .nav li.on').data('type');
		var sido = $('#sido option:selected').val();
		ajaxReviewList(menu, type, 1, sido);
	});
	
	$('#sido').change(function(){
		var menu = $('.reviewTap .menu li.on').data('menu');
		var val = $('#sido option:selected').val();
		$('.review .nav li').removeClass('on');
		$('.review .nav li').eq(1).addClass('on');
		if(val == '') 
			ajaxReviewList(menu, 1, 1);
		else 
			ajaxReviewList(menu, 1, 1, val);
		
		$.ajax({
			type: 'post',
			url: 'ajaxGugun.do',
			dataType: 'json',
			data: {'sido': val},
			success: function(data) {
				var html = '';
				html += '<option value="">구/군</option>';
				html += '<option value="">전체</option>';
				$.each(data, function(index, value) {
					html += '<option value="' + value + '">' + value + '</option>';
				});
				$('#gugun').html(html);
			}, 
			error: function() {
				alert('error');
			}
		});
	})
	
	$('#gugun').change(function(){
		var menu = $('.reviewTap .menu li.on').data('menu');
		var sido = $('#sido option:selected').val();
		var gugun = $('#gugun option:selected').val().trim();
		$('.review .nav li').removeClass('on');
		$('.review .nav li').eq(1).addClass('on');
		if(gugun == '') 
			ajaxReviewList(menu, 1, 1, sido);
		else 
			ajaxReviewList(menu, 1, 1, sido, gugun);
	});
	
	var sort = '${sort}';
	if(!sort) {
		$('.sort li').removeClass('on');
		$('.sort li').eq(0).addClass('on');
	} else {
		$('.sort li').removeClass('on');
		$('.sort li').eq(sort-1).addClass('on');					
	}
</script>