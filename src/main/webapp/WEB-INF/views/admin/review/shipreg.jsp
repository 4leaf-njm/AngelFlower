<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/admin/include/header.jsp" %>

<!-- container (S) -->
<div id="container">
	<div class="content">
		<h3 class="title"><i class="fa fa-angle-right" aria-hidden="true"></i>배송후기 작성</h3>
		<form method="post" name="frm_rev" enctype="multipart/form-data">
			<input type="hidden" name="orderSerial" />
			<table class="tbl04">
				<tr>
					<th>주문자</th>
					<td>
						<input type="text" name="revTitle" class="input01" readonly="readonly"/>
						<a href="#" id="modal" class="btn btn01">찾기</a>
					</td>
					<td rowspan="5" style="width: 200px;">
						<div class="image">
							<img src="${pageContext.request.contextPath }/resources/upload/review/default.jpg" id="prod_image" alt='' /> 
						</div>
						<div class="file_box">
							<label for="mfile" class="btn btn02">사진 등록</label>
							<input type="file" id="mfile" name="mfile" value="파일 첨부" onchange="javascript:readURL(this, '#prod_image');">
						</div> 
					</td>
				</tr>
				<tr>
					<th>배송 상품명</th>
					<td><input type="text" name="revProd" class="input01" readonly="readonly"/></td>
				</tr>
				<tr>
					<th>구매 가격</th>
					<td><input type="text" name="revPrice" class="input01" readonly="readonly"/> 원</td>
				</tr>
				<tr>
					<th>분류</th>
					<td>
						<div>
							<label class="lblradio on"><span></span><input type="radio" name="category" value="1" class="radio" checked="checked"/>근조화환</label>
							<label class="lblradio"><span></span><input type="radio" name="category" value="2" class="radio"/>근조바구니</label>
							<label class="lblradio"><span></span><input type="radio" name="category" value="3" class="radio"/>축하화환</label>
							<label class="lblradio"><span></span><input type="radio" name="category" value="4" class="radio"/>꽃다발</label>
						</div>
						<div>
							<label class="lblradio"><span></span><input type="radio" name="category" value="5" class="radio"/>꽃바구니</label>
							<label class="lblradio"><span></span><input type="radio" name="category" value="6" class="radio"/>동·서양란</label>
							<label class="lblradio"><span></span><input type="radio" name="category" value="7" class="radio"/>★ 플라워</label>
						</div>
					</td>
				</tr>
				<tr>
					<th>배송 지역</th>
					<td>
						<input type="hidden" name="revRegion" />
						<select name="sido" id="sido">
							<option value="">1차 주소</option>
							<c:forEach var="sido" items="${sidoList }">
							<option value="${sido }">${sido }</option>
							</c:forEach>
						</select>
						<select name="gugun" id="gugun">
							<option value="">2차 주소</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>후기 내용</th>
					<td colspan="2"><textarea rows="12" name="revContent"></textarea></td>
				</tr>
			</table>
		</form>
		
		<div class="btn_box">
			<a href="#" class="btn-big btn04" id="btn_submit">등 록</a>
		</div>
	</div>
	
	<div id="dialog" class="regmodal" title="주문 목록">
		<div class="search">
			<select name="searchType" id="searchType">
				<option value="name">주문자명</option>
				<option value="no">주문번호</option>
			</select>
			<input type="text" name="keyword" id="keyword"/>
			<a href="#" class="btn_search"><i class="fa fa-search" aria-hidden="true"></i></a>
		</div>
		<table></table>
		
		<ul class="paging"></ul>
	</div>

	<%@ include file="/WEB-INF/views/admin/include/sidebar6.jsp" %>
</div>
<!-- container (E) -->

<script>
	$('.tbl04 td .lblradio').click(function(){
		$(this).parents('td').find('.lblradio').removeClass('on');
		$(this).addClass('on');
	});
	
	$('#dialog').dialog({
		autoOpen: false,
		width: 600,
		modal: false,
	});

	var type = '';
	var key = '';
	
	$('#modal').click(function(event){
		event.preventDefault();
		
		type = '';
		key = '';
		
		$('#searchType option').eq(0).prop('selected', true);
		$('#keyword').val('');
		
		ajaxOrderList();
		
		$('#dialog').dialog('open');
	});
	
	$('.btn_search').click(function(event) {
		event.preventDefault();
		
		type = $('#searchType option:selected').val();
		key = $('#keyword').val();
		
		ajaxOrderList(type, key);
	});
	
	$('#sido').change(function(){
		var val = $('#sido option:selected').val();
		
		if(val != '') {
			$.ajax({
				type: 'post',
				url: 'ajaxGugun.do',
				dataType: 'json',
				data: {'sido': val},
				success: function(data) {
					var html = '';
					html += '<option value="">2차 주소</option>';
					
					$.each(data, function(index, value) {
						html += '<option value="' + value + '">' + value + '</option>';
					});
					$('#gugun').html(html);
				}, 
				error: function() {
					alert('error');
				}
			});
		}
	})
	
	function ajaxOrderList(searchType, keyword, page) {
		$.ajax({
			type: 'post',
			url: 'ajaxOrderList.do',
			dataType: 'json',
			data: {'searchType': searchType, 'keyword': keyword, 'page': page},
			success: function(data) {
				var html = '';
				
				html += '<tr><th>주문번호</th><th>주문자</th><th>주문상품</th><th>구매가격</th></tr>';
				$.each(data.orderList, function(index, value) {
					html += '<tr>';
					html += '<td data-info="' + value.orderSerial + '">' + value.orderSerial + '</td>';
					html += '<td data-info="' + value.memName + '">' + value.memName + '</td>';
					html += '<td data-info="' + value.prodName + '">' + value.prodName + '</td>';
					html += '<td data-info="' + value.realPrice + '">' + comma(value.realPrice) + '</td>';
					html += '</tr>';
				});
				
				$('#dialog table').html(html);
				html = '';
				
				var pageMaker = data.pageMaker;
				
				if(pageMaker.prev)
					html += '<li><a href="javascript:ajaxOrderList(\'' + type + '\', \'' + key + '\' ' + (pageMaker.startPage-1) + ')">&laquo;</a></li>'
				for(var idx=pageMaker.startPage; idx<=pageMaker.endPage; idx++) {
					html += '<li ' + (pageMaker.cri.page == idx ? 'class=on' : '') + '>';
					html += '<a href="javascript:ajaxOrderList(\'' + type + '\', \'' + key + '\', ' + idx + ')">' + idx + '</a></li>';
				}	
				if(pageMaker.next && pageMaker.endPage > 0) 
					html += '<li><a href="javascript:ajaxOrderList(\'' + type + '\', \'' + key + '\', ' + (pageMaker.endPage + 1) + ')">&raquo;</a></li>';
				
				$('#dialog .paging').html(html);
				setReviewInfo();
			},
			error: function() {
				alert('error');
			}
		});
	}
	
	function setReviewInfo() {
		$('#dialog table tr').click(function(){
			var frm = document.frm_rev;
			var orderSerial = $(this).find('td').eq(0).data('info');
			var title = $(this).find('td').eq(1).data('info');
			var prodName = $(this).find('td').eq(2).data('info');			
			var prodPrice = $(this).find('td').eq(3).data('info');
			
			frm.orderSerial.value = orderSerial;
			frm.revTitle.value = title;
			frm.revProd.value = prodName;
			frm.revPrice.value = comma(prodPrice);
			
			$('#dialog').dialog('close');
		});
	}
	
	$('#btn_submit').click(function(event) {
		event.preventDefault();
		var frm = document.frm_rev;
		
		if(frm.revTitle.value == '') {
			alert('주문자를 선택해주세요.');
			return;
		} 
		var addr1 = $('#sido option:selected').val();
		var addr2 = $('#gugun option:selected').val();
		frm.revRegion.value = addr1 + ' ' + addr2;
		frm.revPrice.value = frm.revPrice.value.replace(',', '');
		frm.submit();
	});
</script>
