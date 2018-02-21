function ajaxBestList(category) {
	$.ajax({
		type: 'post',
		url: 'ajaxBestList.do',
		dataType: 'json',
		data: {menu: category},
		success: function(data) {
			var html = '';
			$.each(data, function(index, value){
				html += '<li data-no="' + value.prodNo + '" class="active">';
				html += 	'<img src="' + $('#ctx').text() + '/resources/upload/product/' + value.image + '" alt="' + value.name + '" width="180" height="235"/>';
				html += 	'<h3>' + value.name + '</h3>';
				html += 	'<p class="price">판매가 : <span>' + comma(value.price1) + '</span> 원</p>';
				html += 	'<p class="sale">회원가 : <strong>' + comma(value.price2) + '</strong> 원</p>';
				html += 	'<p><span class="lbl lbl01">적립금</span>' + comma(value.save) + '</p>';
				html += '</li>';
			})
			$('.bestMenu ul').html(html);
		},
		error: function(){
			alert('error');
	    }
	});
}

function ajaxReviewList(category, type, page, sido, gugun) {
	$.ajax({
		type: 'post',
		url: 'ajaxReviewList.do',
		dataType: 'json',
		data: {'menu': category, 'type': type, 'page': page, 'sido': sido, 'gugun': gugun},
		success: function(data) {
			var html = '';
			$.each(data.reviewList, function(index, value){
				html += '<li>';
				if(value.type == 1) {
					html += 	'<img src="' + $('#ctx').text() + '/resources/upload/review/' + value.revImage + '" alt="' + value.prodName + '" />';
					html += 	'<div class="region">';
					html += 		'<span class="type01">배송지역</span>';
					html += 		'<h3>'+ value.revRegion +'</h3>';
					html += 		'<p>'+ value.revTitle +'</p>';
					html += 	'</div>';
					html += 	'<div class="info">';
					html += 		'<h3>'+ value.revProd +'</h3>';
					html += 		'<p>'+ comma(value.revPrice) +'원</p>';
					html += 	'</div>';
				} else {
					html += 	'<img src="' + $('#ctx').text() + '/resources/upload/review/' + value.comImage + '" alt="' + value.prodName + '" />';
					html += 	'<div class="region">';
					html += 		'<span class="type02">상품후기</span>';
					html += 		'<h3>'+ value.memId +'</h3><p>';
					for(var i=0; i<value.comStar; i++) 
					html +=      	'<img src="' + $('#ctx').text() + '/resources/images/icon/ico_star.gif" />';
					html += 	'</p></div>';
					html += 	'<div class="info">';
					html += 		'<h3>'+ value.prodName +'</h3>';
					html += 		'<p>'+ comma(value.prodPrice2) +'원</p>';
					html += 	'</div>';
				}
				html += '</li>';
			})
			$('.review .list').html(html);
			
			html = '';
			var pageMaker = data.pageMaker; 
			var category = $('.reviewTap .menu li.on').data('menu');
			var type = $('.top .nav li.on').data('type');
				
			if(pageMaker.prev)
				html += '<li><a href="javascript:ajaxReviewList(' + category + ', ' + type + ', ' + (pageMaker.startPage-1) + ')">&laquo;</a></li>'
			for(var idx=pageMaker.startPage; idx<=pageMaker.endPage; idx++) {
				html += '<li ' + (pageMaker.cri.page == idx ? 'class=on' : '') + '>';
				html += '<a href="javascript:ajaxReviewList(' + category + ', ' + type + ', ' + idx + ')">' + idx + '</a></li>';
			}	
			if(pageMaker.next && pageMaker.endPage > 0) 
				html += '<li><a href="javascript:ajaxReviewList(' + category + ', ' + type + ', ' + (pageMaker.endPage + 1) + ')">&raquo;</a></li>';
			
			$('.reviewTap .paging').html(html);
		},
		error: function(request,status,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
}

function go_prodList(menu, page, sort) {
	location.href = $('#ctx').text() + '/product/list.do?menu=' + menu + '&sort=' + sort + '&page=' + page;
}

function go_order() {
	document.frm_prod.action = $('#ctx').text() + '/order/directOrder.do';
	document.frm_prod.quantity.value = $('td.number > div').text();
	document.frm_prod.submit();
}

function go_addCart() {
	document.frm_prod.action = $('#ctx').text() + '/order/cart.do';
	document.frm_prod.quantity.value = $('td.number > div').text();
	document.frm_prod.submit();
}

function go_addWish() {
	document.frm_prod.action = $('#ctx').text() + '/order/wish.do';
	document.frm_prod.quantity.value = $('td.number > div').text();
	document.frm_prod.submit();
}

function review_reg() {
	
}