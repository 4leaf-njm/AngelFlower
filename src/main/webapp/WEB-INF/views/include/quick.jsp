<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="quick">
	<h2>빠른메뉴</h2>
	<div>
		<h3>최근본상품</h3>
		<ul>
			<li>
				<img src="${pageContext.request.contextPath }/resources/images/item/sample_01.jpg" alt="" width="70" height="80"/>
				<p>근조3단</p>
			</li>
			<li>
				<img src="${pageContext.request.contextPath }/resources/images/item/sample_01.jpg" alt="" width="70" height="80"/>
				<p>명품 근조3단</p>
			</li>
			<li>
				<img src="${pageContext.request.contextPath }/resources/images/item/sample_01.jpg" alt="" width="70" height="80"/>
				<p>NEW 근조화환 3단</p>
			</li>
		</ul>
	</div>
	<p class="cart"><a href="#"><img src="${pageContext.request.contextPath }/resources/images/icon/ico_cart.PNG" alt="장바구니" width="129" height="90"/></a></p>
	<p class="top"><a href="#">TOP</a></p>
	
	<script>
		var initPos = parseInt($('.quick').css('top')); 
		var move = -245;
		
	    $(window).scroll(function() { 
	            var scrollPos = $(window).scrollTop(); 
	            console.log(scrollPos + ' ' + move);
	            if(scrollPos < 300) {
	            	init();
	            	return;
	            }
	            $('.quick').stop().animate({'top': scrollPos + move + 'px'}, 500);
	    });
	    
	    $('.quick .top a').click(function(){
	    	init();
	    });
	    
	    function init() {
	    	$('.quick').stop().animate({'top': initPos + 'px'}, 500);
	    }
	</script>
</div>