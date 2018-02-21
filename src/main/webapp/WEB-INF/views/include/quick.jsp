<%@page import="java.util.ArrayList"%>
<%@page import="com.dawn.angel.domain.ProductVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<Integer> prodList = new ArrayList<Integer>();
	Cookie[] cookies = request.getCookies();
	for(Cookie cookie : cookies) {
		if(cookie.getName().indexOf("item") != -1) {
			prodList.add(Integer.parseInt(cookie.getValue()));
		}
	}
	while(prodList.size() > 3) {
		prodList.remove(0);
	} 
%>

<script>
	var url = $('#ctx').text() + '/ajaxQuickList.do';
	var list = "<%=prodList%>";
	list = list.replace('[', '').replace(']', '').split(', ');
	var str = '';
	var count = 0;
	for(var i=0; i<list.length; i++) {
		str += count == 0 ? list[i] : ',' + list[i]; 
		count ++;
	}
	$.ajax({
		type: 'post',
		url: url,
		dataType: 'json',
		data: {'strno': str},
		success: function(data) {
			var html = '';
			$.each(data, function(index, value) {
				html += '<li>';
				html += '<a href="' + $('#ctx').text() + '/product/detail.do?menu=' + value.category + '&no=' + value.prodNo + '">';
				html += '	<img src="' + $('#ctx').text() + '/resources/upload/product/' + value.image + '" alt="" width="70" height="80"/>';
				html += '	<p>' + value.name + '</p>';
				html += '</a></li>';
			});
			if(data.length < 3) {
				for(var i=data.length; i<3; i++) {
					html += '<li>';
					html += '<i class="fa fa-times" style="position: relative; top: 33px; font-size: 32px; color: #c1c1c1;"></i>';
					html += '</li>';
				}
			}
			$('.quick ul').html(html);
		},
		error: function(a, b, c) {
			alert(a + b + c);
		}
	}); 
</script>

<div class="quick">
	<h2>빠른메뉴</h2>
	<div>
		<h3>최근본상품</h3>
		<ul></ul>
	</div>
	<p class="gocart"><a href='<c:url value="/order/cart.do" />'><img src="${pageContext.request.contextPath }/resources/images/icon/ico_cart.PNG" alt="장바구니" width="129" height="90"/></a></p>
	<p class="top"><a href="#">TOP</a></p>
	
	<script>
		var initPos = parseInt($('.quick').css('top')); 
		var move = -245;
		
	    $(window).scroll(function() { 
	            var scrollPos = $(window).scrollTop(); 
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