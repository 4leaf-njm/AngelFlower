function ajaxBestList(category) {
	$.ajax({
		type: 'post',
		url: 'ajaxBestList.do',
		dataType: 'json',
		data: {menu: category},
		success: function(data) {
			var html = '';
			$.each(data, function(index, value){
				html += '<li data-no="' + value.prodNo + '">';
				html += 	'<img src="/angel/resources/images/item/' + value.image + '" alt="' + value.name + '" width="150" height="210"/>';
				html += 	'<h3>' + value.name + '</h3>';
				html += 	'<p class="price">판매가 : <span>' + comma(value.price1) + '</span> 원</p>';
				html += 	'<p class="sale">회원가 : <strong>' + comma(value.price2) + '</strong>원</p>';
				html += 	'<p><span class="lbl lbl01">적립금</span>' + comma(value.save) + '</p>';
				html += '</li>';
			})
			$('.bestMenu ul').html(html);
		},
		error: function(request,status,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
}

function ajaxReviewList(category) {
	$.ajax({
		type: 'post',
		url: 'ajaxReviewList.do',
		dataType: 'json',
		data: {menu: category},
		success: function(data) {
			var html = '';
			$.each(data, function(index, value){
				html += '<li>';
				html += 	'<img src="/angel/resources/images/item/' + value.image + '" alt="' + value.prodName + '" />';
				html += 	'<div class="region">';
				html += 		'<span>배송지역</span>';
				html += 		'<h3>'+ value.region +'</h3>';
				html += 	'</div>';
				html += 	'<div class="info">';
				html += 		'<h3>'+ value.prodName +'</h3>';
				html += 		'<p>'+ comma(value.price2) +'원</p>';
				html += 	'</div>';
				html += '</li>';
			})
			$('.review .list').html(html);
		},
		error: function(request,status,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
}