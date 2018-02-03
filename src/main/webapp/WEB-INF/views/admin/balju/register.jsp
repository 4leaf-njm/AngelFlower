<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/include/header.jsp" %>
	
<!-- container (S) -->
<div id="container">
	<div class="content">
		<h3 class="title"><i class="fa fa-angle-right" aria-hidden="true"></i>발주 신청</h3>
		<form method="post" name="frm_balju">
			<input type="hidden" name="baljuSendId" value="${sessionScope.loginUser.id }"/>
			<input type="hidden" name="baljuRecId" />
			<table class="tbl03 balju">
				<tr>
					<th colspan="2">발주 정보</th>
				</tr>
				<tr>
					<th>발주 일자</th>
					<td><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr>
					<th>발주 고객명</th>
					<td><input type="text" name="baljuMemName" class="input01"/></td>
				</tr>
				<tr>
					<th>고객 핸드폰</th>
					<td>
						<input type="hidden" name="baljuMemPhone" class="input04"/>
						<input type="text" name="mem_phone1" class="input04" maxlength="3"/>&nbsp;-
						<input type="text" name="mem_phone2" class="input04" maxlength="4"/>&nbsp;-
						<input type="text" name="mem_phone3" class="input04" maxlength="4"/>
					</td>
				</tr>
				<tr>
					<th>발주 상품</th>
					<td id="nameArea">
						<div class="prodbox">
							<div class="image">
								<img src="${pageContext.request.contextPath }/resources/images/item/default.jpg" id="prod_image" alt='' /> 
							</div>
							<div class="prodname">
								<a href="#" class="btn btn02 btn_prod">상품 등록</a>
							</div> 
						</div>
					</td>
				</tr>
				<tr>
					<th>발주 가격</th>
					<td>
						<input type="text" name="baljuPrice" class="input01" />
						<a href="#" class="btn btn01 btn_price1" >적용</a>
					</td>
				</tr>
			</table>
			
			<table class="tbl03 balju">
				<tr>
					<th colspan="2">발주자 정보</th>
				</tr>
				<tr>
					<th>상호 (회사명)</th>
					<td>${sessionScope.loginUser.company }</td>
				</tr>
				<tr>
					<th>성명</th>
					<td>${sessionScope.loginUser.name }</td>
				</tr>
				<tr>
					<th>핸드폰</th>
					<td>${sessionScope.loginUser.phone }</td>
				</tr>
				<tr>
					<th>가져갈 금액</th>
					<td>
						<input type="text" name="baljuSendPrice" class="input01"/>
						<a href="#" class="btn btn01 btn_price2">적용</a>
					</td>
				</tr>
			</table>
			
			<table class="tbl03 balju">
				<tr>
					<th colspan="2">받는자 정보</th>
				</tr>
				<tr>
					<th>상호 (회사명)</th>
					<td>
						<input type="text" name="baljuRecCompany" class="input01"/>
						<a href="#" class="btn btn01 btn_admin">찾기</a>
					</td>
				</tr>
				<tr>
					<th>성명</th>
					<td><input type="text" name="baljuRecName" class="input01"/></td>
				</tr>
				<tr>
					<th>핸드폰</th>
					<td><input type="text" name="baljuRecPhone" class="input01"/></td>
				</tr>
				<tr>
					<th>받을 금액</th>
					<td><input type="text" name="baljuRecPrice" class="input01"/></td>
				</tr>
			</table>
		</form>
		
		<div id="prodDialog" class="regmodal" title="상품 목록">
			<div class="search">
				<select name="searchType" id="searchType">
					<option value="name">상품명</option>
				</select>
				<input type="text" name="keyword" id="keyword"/>
				<a href="#" class="btn_search"><i class="fa fa-search" aria-hidden="true"></i></a>
			</div>
			<table></table>
			
			<ul class="paging"></ul>
		</div>
		
		<div id="adminDialog" class="regmodal" title="기업회원 목록">
			<div class="search">
				<select name="searchType" id="searchType">
					<option value="name">성명</option>
					<option value="company">상호명</option>
				</select>
				<input type="text" name="keyword" id="keyword" />
				<a href="#" class="btn_search"><i class="fa fa-search" aria-hidden="true"></i></a>
			</div>
			<table></table>
			
			<ul class="paging"></ul>
		</div>
		
		<div class="btn_box">
			<a href="#" class="btn-big btn04" id="btn_submit">등 록</a>
		</div>
	</div>
		
	<%@ include file="/WEB-INF/views/admin/include/sidebar4.jsp" %>
</div>
<!-- container (E) -->
<script>
	$('#prodDialog').dialog({
		autoOpen: false,
		width: 550,
		modal: false,
	});
	$('#adminDialog').dialog({
		autoOpen: false,
		width: 500,
		modal: false,
	});
	
	var prod_type = '';
	var prod_key = '';
	
	$('.btn_prod').click(function(event){
		event.preventDefault();
		prod_type = '';
		prod_key = '';
		
		$('#prodDialog #searchType option').eq(0).prop('selected', true);
		$('#prodDialog #keyword').val('');
		
		ajaxProdList();
		
		$('#prodDialog').dialog('open');
	});
	
	$('#prodDialog .btn_search').click(function(event) {
		event.preventDefault();
		
		prod_type = $('#prodDialog #searchType option:selected').val();
		prod_key = $('#prodDialog #keyword').val();
		
		ajaxProdList(prod_type, prod_key);
	});
	
	function ajaxProdList(searchType, keyword, page) {
		$.ajax({
			type: 'post',
			url: 'ajaxProdList.do',
			dataType: 'json',
			data: {'searchType': searchType, 'keyword': keyword, 'page': page},
			success: function(data) {
				var html = '';
				
				html += '<tr><th>분류</th><th style="width: 40px;">사진</th><th>상품명</th><th>수량</th><th>비고</th>';
				$.each(data.prodList, function(index, value) {
					var category = value.category;
					if(category == 1) category = '근조 화환';
					else if(category == 2) category = '근조 바구니';
					else if(category == 3) category = '축하 화환';
					else if(category == 4) category = '꽃다발';
					else if(category == 5) category = '꽃바구니';
					else if(category == 6) category = '동·서양란';
					else if(category == 7) category = '★ 플라워';
					
					html += '<tr data-no="' + value.prodNo + '">';
					html += '<td>' + category + '</td>';
					html += '<td data-info="' + value.image + '"><img src="' + $('#ctx').text() + '/resources/upload/product/' + value.image + '" width="26" height="36"/></td>';
					html += '<td data-info="' + value.name + '">' + value.name + '</td>';
					html += '<td><input class="spinner" value="1" style="width:25px;"/></td>';
					html += '<td><a href="#" class="btn btn01 btn_sel">선택</a></td>';
					html += '</tr>';
				});
				$('#prodDialog table').html(html);
				$('.spinner').spinner();
				html = '';
				
				var pageMaker = data.pageMaker;
				
				if(pageMaker.prev)
					html += '<li><a href="javascript:ajaxProdList(\'' + prod_type + '\', \'' + prod_key + '\' ' + (pageMaker.startPage-1) + ')">&laquo;</a></li>'
				for(var idx=pageMaker.startPage; idx<=pageMaker.endPage; idx++) {
					html += '<li ' + (pageMaker.cri.page == idx ? 'class=on' : '') + '>';
					html += '<a href="javascript:ajaxProdList(\'' + prod_type + '\', \'' + prod_key + '\', ' + idx + ')">' + idx + '</a></li>';
				}	
				if(pageMaker.next && pageMaker.endPage > 0) 
					html += '<li><a href="javascript:ajaxProdList(\'' + prod_type + '\', \'' + prod_key + '\', ' + (pageMaker.endPage + 1) + ')">&raquo;</a></li>';
				
				$('#prodDialog .paging').html(html);
				setProdInfo()
			},
			error: function() {
				alert('error');
			}
		});
	}
	
	var prod_yn = false;
	function setProdInfo() {
		$('.btn_sel').click(function(event){
			event.preventDefault();
			
			var frm = document.frm_balju;
			var no = $(this).parents('tr').data('no');
			var image = $(this).parent('td').siblings('td').eq(1).data('info');
			var name = $(this).parent('td').siblings('td').eq(2).data('info');	
			var quentity = $(this).parent('td').siblings('td').eq(3).find('.spinner').val();
			if(quentity < 1) {
				alert('수량은 1 이상이여야 합니다.')
				return;
			}
			var html = '';
			html += '<div class="prodbox">';
			html +=		'<input type="hidden" name="prodArr" value="' + no + '" />';
			html +=		'<input type="hidden" name="quentArr" value="' + quentity + '" />';
			html += 	'<div class="image">';
			html += 		'<img src="' + $('#ctx').text() + '/resources/upload/product/' + image + '" />';
			html += 	'</div>';
			html += 	'<div class="prodname">' + name + ' (' + quentity + '개)';
			html +=     '<a href="#" class="btn_prodRemove" style="margin-left: 5px;"><i class="fa fa-times" aria-hidden="true"></i></a></div>';
			
			html += '</div>';
			$('#nameArea').prepend(html);
			$('#prodDialog').dialog('close');
			prod_yn = true;
			
			$('.btn_prodRemove').click(function(event){
				event.preventDefault();
				$(this).parents('.prodbox').remove();
			});
		});
	}
	
	var admin_type = '';
	var admin_key = '';
	$('.btn_admin').click(function(event){
		event.preventDefault();
		admin_type = '';
		admin_key = '';
		
		$('#adminDialog #searchType option').eq(0).prop('selected', true);
		$('#adminDialog #keyword').val('');
		
		ajaxAdminList();
		
		$('#adminDialog').dialog('open');
	});
	
	$('#adminDialog .btn_search').click(function(event) {
		event.preventDefault();
		
		admin_type = $('#adminDialog #searchType option:selected').val();
		admin_key = $('#adminDialog #keyword').val();
		
		ajaxAdminList(admin_type, admin_key);
	});
	
	function ajaxAdminList(searchType, keyword, page) {
		var id = '${sessionScope.loginUser.id}';
		$.ajax({
			type: 'post',
			url: 'ajaxAdminList.do',
			dataType: 'json',
			data: {'searchType': searchType, 'keyword': keyword, 'page': page, 'id': id},
			success: function(data) {
				var html = '';
				
				html += '<tr><th>상호(회사명)</th><th>성명</th><th>핸드폰</th>';
				$.each(data.adminList, function(index, value) {
					html += '<tr data-id="' + value.id + '">';
					html += '<td data-info="' + value.company + '">' + value.company + '</td>';
					html += '<td data-info="' + value.name + '">' + value.name + '</td>';
					html += '<td data-info="' + value.phone + '">' + value.phone + '</td>';
					html += '</tr>';
				});
				$('#adminDialog table').html(html);
				html = '';
				
				var pageMaker = data.pageMaker;
				
				if(pageMaker.prev)
					html += '<li><a href="javascript:ajaxAdminList(\'' + admin_type + '\', \'' + admin_key + '\' ' + (pageMaker.startPage-1) + ')">&laquo;</a></li>'
				for(var idx=pageMaker.startPage; idx<=pageMaker.endPage; idx++) {
					html += '<li ' + (pageMaker.cri.page == idx ? 'class=on' : '') + '>';
					html += '<a href="javascript:ajaxAdminList(\'' + admin_type + '\', \'' + admin_key + '\', ' + idx + ')">' + idx + '</a></li>';
				}	
				if(pageMaker.next && pageMaker.endPage > 0) 
					html += '<li><a href="javascript:ajaxAdminList(\'' + admin_type + '\', \'' + admin_key + '\', ' + (pageMaker.endPage + 1) + ')">&raquo;</a></li>';
				
				$('#adminDialog .paging').html(html);
				setAdminInfo()
			},
			error: function() {
				alert('error');
			}
		});
	}
	
	var admin_yn = false;
	function setAdminInfo() {
		$('#adminDialog table tr').click(function(event){
			event.preventDefault();
			
			var frm = document.frm_balju;
 			var id = $(this).data('id');
			var company = $(this).find('td').eq(0).data('info');	
			var name = $(this).find('td').eq(1).data('info');	
			var phone = $(this).find('td').eq(2).data('info');	
			frm.baljuRecId.value = id;
			frm.baljuRecCompany.value = company;
			frm.baljuRecName.value = name;
			frm.baljuRecPhone.value = phone;
			$('#adminDialog').dialog('close');
			admin_yn = true;
		});
	}
	
	var baljuPrice = '';
	var baljuPrice_yn = false;
	$('.btn_price1').click(function(event){
		event.preventDefault();
		var frm = document.frm_balju;
		var text = $(this).text();
		if(text == '적용') {
			if(frm.baljuPrice.value == '') {
				alert('발주 가격을 입력해주세요.');
				frm.baljuPrice.focus();
				return;
			}
			if(isNaN(frm.baljuPrice.value) == true) {
				alert('발주 가격은 숫자만 입력가능합니다.');
				frm.baljuPrice.focus();
				return;
			}
			baljuPrice = frm.baljuPrice.value;
			frm.baljuPrice.setAttribute('readonly', 'readonly');
			$(this).text('다시입력');
			baljuPrice_yn = true;
		} else {
			frm.baljuPrice.removeAttribute('readonly');
			$(this).text('적용');
			baljuPrice_yn = false;
		}
	});
	
	var sendPrice_yn = false;
	$('.btn_price2').click(function(event){
		event.preventDefault();
		var frm = document.frm_balju;
		var text = $(this).text();
		if(text == '적용') {
			if(frm.baljuPrice.value == '') {
				alert('발주 가격을 입력해주세요.');
				frm.baljuPrice.focus();
				return;
			}
			if(isNaN(frm.baljuPrice.value) == true) {
				alert('발주 가격은 숫자만 입력가능합니다.');
				frm.baljuPrice.focus();
				return;
			}
			if(baljuPrice_yn == false) {
				alert('발주 가격 적용 버튼을 눌러주세요.');
				frm.baljuPrice.focus();
				return;
			}
			if(frm.baljuSendPrice.value == '') {
				alert('가져갈 금액을 입력해주세요.');
				frm.sendPrice.focus();
				return;
			}
			if(isNaN(frm.baljuSendPrice.value) == true) {
				alert('가져갈 금액은 숫자만 가능합니다.');
				frm.sendPrice.focus();
				return;
			}
			if(parseInt(frm.baljuSendPrice.value) > baljuPrice) {
				alert('발주 금액을 초과했습니다.');
				frm.sendPrice.focus();
				return;
			}
			frm.baljuRecPrice.value = baljuPrice - frm.baljuSendPrice.value;
			frm.baljuSendPrice.setAttribute('readonly', 'readonly');
			frm.baljuRecPrice.setAttribute('readonly', 'readonly');
			$(this).text('다시입력');
			sendPrice_yn = true;
		} else {
			frm.baljuSendPrice.removeAttribute('readonly');
			frm.baljuRecPrice.removeAttribute('readonly');
			$(this).text('적용');
			sendPrice_yn = false;
		}
	});
	
	$('#btn_submit').click(function(event){
		event.preventDefault();
		var frm = document.frm_balju;
		
		if(frm.baljuMemName.value == '') {
			alert('발주 고객명을 입력해주세요.');
			frm.baljuMemName.focus();
			return;
		} else if(prod_yn == false) {
			alert('발주 상품을 등록해주세요.');
			return;
		} else if (baljuPrice_yn == false) {
			alert('발주 가격 적용 버튼을 눌러주세요.');	
			return;
		} else if (sendPrice_yn == false) {
			alert('가져갈 금액 적용 버튼을 눌러주세요.');	
			return;
		} else if (admin_yn == false) {
			alert('받는자 정보를 찾기버튼으로 입력해주세요.');	
			return;
		} 
		frm.baljuMemPhone.value = frm.mem_phone1.value + '-' + frm.mem_phone2.value + '-' + frm.mem_phone3.value;
		frm.submit();
	});
</script>
