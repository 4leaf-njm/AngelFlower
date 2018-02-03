<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
	<title>엔젤 플라워</title>
	<style>
	select::-ms-expand {
	    display: none;
	}  
	</style>
</head>

<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!-- container (S) -->
<div id="container">
	<div class="visual">
		<div class="info on">
			<a href="#">
				<img src="${pageContext.request.contextPath }/resources/images/main/v_img01.jpg" alt="가을시즌"/>
			</a>
		</div>
		<div class="info">
			<a href="#">
				<img src="${pageContext.request.contextPath }/resources/images/main/v_img02.jpg" alt="가을시즌"/>
			</a>
		</div>
		<div class="info">
			<a href="#">
				<img src="${pageContext.request.contextPath }/resources/images/main/v_img03.jpg" alt="가을시즌"/>
			</a>
		</div>
		<div class="info">
			<a href="#">
				<img src="${pageContext.request.contextPath }/resources/images/main/v_img04.jpg" alt="가을시즌"/>
			</a>
		</div>
		<div class="info">
			<a href="#">
				<img src="${pageContext.request.contextPath }/resources/images/main/v_img05.jpg" alt="가을시즌"/>
			</a>
		</div>
		<div class="info">
			<a href="#">
				<img src="${pageContext.request.contextPath }/resources/images/main/v_img06.jpg" alt="가을시즌"/>
			</a>
		</div>
		<div class="info">
			<a href="#">
				<img src="${pageContext.request.contextPath }/resources/images/main/v_img07.jpg" alt="가을시즌"/>
			</a>
		</div>
		<div class="cate">
			<ul>
				<li class="on" data-no="0"><a href="#">겨울시즌</a></li>
				<li data-no="1"><a href="#" >승진/영전 특가</a></li>
				<li data-no="2"><a href="#" >미니블룸</a></li>
				<li data-no="3"><a href="#" >정관장 기획전</a></li>
				<li data-no="4"><a href="#" >오설록 티세트</a></li>
				<li data-no="5"><a href="#" >꽃&amp;선물</a></li>
			</ul>
		</div>
		<script>
			var intervalId = setInterval(move_cate, 2500);
			var select = 0;
			$('.cate li').hover(function(){
				clearInterval(intervalId);
				
				$('.cate li').removeClass('on');
				$(this).addClass('on');
				select = parseInt($(this).data('no'));
			
				$('.info').removeClass('on');
				$('.info').eq(select).addClass('on');
			}, function(){
				intervalId = setInterval(move_cate, 2500);
			});
			
			function move_cate() {
				select = parseInt(select) + 1;
				if(select > 5) select = 0;
				
				$('.cate li').removeClass('on');
				$('.cate li').eq(select).addClass('on');
				
				$('.info').removeClass('on');
				$('.info').eq(select).addClass('on');
			}			
		</script>
	</div>
	
	<div class="best">
		<h2><img src="${pageContext.request.contextPath }/resources/images/temp/best02.PNG" alt=""/></h2>
		<div>
			<ul class="menu">
				<li class="on" data-menu="1">근조화환</li>
				<li data-menu="2">근조바구니</li>
				<li data-menu="3">축하화환</li>
				<li data-menu="4">꽃다발</li>
				<li data-menu="5">꽃바구니</li>
				<li data-menu="6">동·서양란</li>
			</ul>
			
			<div class="bestMenu">
				<ul></ul>
			</div>
		</div>
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
			
			<ul class="paging">
				
			</ul>
		</div>
	</div>
	
<%@ include file="/WEB-INF/views/include/quick.jsp" %>
</div>
<!-- container (E) -->
	
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<script src="${pageContext.request.contextPath }/resources/js/product.js"></script>
<script>
	$('.category_area .cate a').hover(function(){
		$(this).addClass('on');
		$(this).closest('div').css('display', 'block');
	}, function(){
		$(this).removeClass('on');
		$(this).parent('div').css('display', 'none');
	});
	
	$('.best .menu > li').click(function(){
		$('.best .menu > li').removeClass('on');
		$(this).addClass('on');
		
		var menu = $(this).data('menu');
		ajaxBestList(menu);
	});
	ajaxBestList(1);

	$(document).on('click', '.bestMenu li.active', function(){
		var prodNo = $(this).data('no');
		location.href='<c:url value="/product/detail.do?no=' + prodNo + '"/>';
	})
	$(document).on('mouseover', '.bestMenu li.active', function(){
		$(this).find('h3').addClass('on');	
	})
	$(document).on('mouseout', '.bestMenu li.active', function(){
		$(this).find('h3').removeClass('on');	
	})
	$('.review .menu > li').click(function(){
		$('.review .menu > li').removeClass('on');
		$(this).addClass('on');
		
		var menu = $(this).data('menu');
		var type = $('.top .nav li.on').data('type');
		var sido = $('#sido option:selected').val();
		ajaxReviewList(menu, type, 1, sido);
	});
	ajaxReviewList(1, 0, 1);
	
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
</script>