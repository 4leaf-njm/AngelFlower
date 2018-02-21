function ajaxMemberPaging(page) {
	$.ajax({
		type: 'post',
		url: 'ajaxMemberPaging.do',
		dataType: 'json',
		data: {'page': page},
		success: function(data) {
			var pageMaker = data.pageMaker;
			var html = '';
			
			html += '<tr><th>아이디</th><th>성명</th><th>핸드폰</th>';
			html += '<th>이메일</th><th style="width: 500px;">주소</th><th>적립금</th>';
			html += '<th>주문건수</th><th>탈퇴여부</th><th>비고</th></tr>';
			
			if(data.memList == null) {
				html += '<tr class="empty">';
				html += '가입한 일반회원이 없습니다.';
				html +=	'</tr>';
			} else {
				$.each(data.memList, function(index, value) {
					html += '<tr>';
					html +=	'<td>' + value.id + '</td>';
					html +=	'<td>' + value.name + '</td>';
					html +=	'<td>' + value.phone + '</td>';
					html +=	'<td>' + value.email + '</td>';
					html +=	'<td>' + value.address + '</td>';
					html +=	'<td>' + comma(value.save) + '</td>';
					html +=	'<td>' + value.orderCount + '건</td><td>';
					if(value.useyn == 'y') html += '미탈퇴';
					else html += '<span class="red">탈퇴</span>';
					html +=	'</td><td>';
					html +=		'<a href="javascript:ajaxLeave(2, \'m\', \'' + value.id + '\', \'' + value.useyn + '\', ' + page + ')" class="btn btn01">탈퇴</a>';
					html +=	'</td>';
					html +='</tr>';
				});
			}
			$('#ajaxMember').html(html);
			
			html = '';
			
			if(pageMaker.prev)
				html += '<li><a href="javascript:ajaxMemberPaging(' + (pageMaker.startPage-1) + ')">&laquo;</a></li>';
			for(var idx=pageMaker.startPage; idx<=pageMaker.endPage; idx++) {
				html += '<li ' + (pageMaker.cri.page == idx ? 'class=on' : '') + '>';
				html += '<a href="javascript:ajaxMemberPaging(' + idx + ')">' + idx + '</a></li>';
			}	
			if(pageMaker.next && pageMaker.endPage > 0) 
				html += '<li><a href="javascript:ajaxMemberPaging(' + (pageMaker.endPage + 1) + ')">&raquo;</a></li>';
			
			$('#memberPaging').html(html);
		},
		error: function() {
			alert('error');
		}
	});
}

function ajaxAdminPaging(page) {
	$.ajax({
		type: 'post',
		url: 'ajaxAdminPaging.do',
		dataType: 'json',
		data: {'page': page},
		success: function(data) {
			var pageMaker = data.pageMaker;
			var html = '';
			
			html += '<tr><th>상호명</th><th>대표자</th><th>사업자등록번호</th>';
			html += '<th>아이디</th><th>성명</th><th>핸드폰</th>';
			html += '<th>발주건수</th><th style="width:80px;">권한</th><th>탈퇴여부</th><th>비고</th></tr>';
			
			if(data.adminList == null) {
				html += '<tr class="empty">';
				html += '가입한 기업회원이 없습니다.';
				html +=	'</tr>';
			} else {
				$.each(data.adminList, function(index, value) {
					html += '<tr>';
					html +=	'<td>' + value.company + '</td>';
					html +=	'<td>' + value.represent + '</td>';
					html +=	'<td>' + value.busiNo + '</td>';
					html +=	'<td>' + value.id + '</td>';
					html +=	'<td>' + value.name + '</td>';
					html +=	'<td>' + value.phone + '</td>';
					html +=	'<td>' + value.baljuCount + ' 건</td>';
					html +=	'<td>' + value.roleName + '</td><td>';
					if(value.useyn == 'y') html += '미탈퇴';
					else html += '<span class="red">탈퇴</span>';
					html +=	'</td><td>';
					html +=		'<a href="javascript:go_authDialog(\'' + value.id + '\', \'' + page + '\')" class="btn btn01">권한</a>';
					html +=		'<a href="javascript:ajaxLeave(2, \'a\', \'' + value.id + '\', \'' + value.useyn + '\', ' + page + ')" class="btn btn01" style="margin: 0 0 0 4px;">탈퇴</a>';
					html +=	'</td>';
					html +='</tr>';
				});
			}
			$('#ajaxAdmin').html(html);
			
			html = '';
			
			if(pageMaker.prev)
				html += '<li><a href="javascript:ajaxAdminPaging(' + (pageMaker.startPage-1) + ')">&laquo;</a></li>';
			for(var idx=pageMaker.startPage; idx<=pageMaker.endPage; idx++) {
				html += '<li ' + (pageMaker.cri.page == idx ? 'class=on' : '') + '>';
				html += '<a href="javascript:ajaxAdminPaging(' + idx + ')">' + idx + '</a></li>';
			}	
			if(pageMaker.next && pageMaker.endPage > 0) 
				html += '<li><a href="javascript:ajaxAdminPaging(' + (pageMaker.endPage + 1) + ')">&raquo;</a></li>';
			
			$('#adminPaging').html(html);
			
		},
		error: function() {
			alert('error');
		}
	});
}

function ajaxLeave(m, type, id, useyn, page) {
	if(hasRole('RIGHT_MB_DELETE') == false) {
		alert('권한이 없습니다.');
		return;
	}
	if(useyn == 'n') {
		alert('이미 탈퇴된 회원입니다.');
		return;
	}
	
	var result = confirm('이 회원을 탈퇴시키겠습니까 ?');
	if(result) {
		$.ajax({
			type: 'post',
			url: 'ajaxLeave.do',
			dataType: 'json',
			data: {'m': m, 'type': type, 'id': id},
			success: function(data) {
				if(type == 'm') ajaxMemberPaging(page);
				else ajaxAdminPaging(page);
				alert(data.msg);
			},
			error: function() {
				alert('error');
			}
		});
	}
}

function permitYes(m, s, id, page) {
	if(hasRole('RIGHT_MB_PERMIT') == false) {
		alert('권한이 없습니다.');
		return;
	}
	var result = confirm('가입을 승인하시겠습니까 ?');
	if(result)
		location.href = $('#ctx').text() + '/admin/mb/permitYes.do?m=' + m + '&s=' + s + '&page=' + page + '&id=' + id;
}

function permitNo(m, s, id, page) {
	if(hasRole('RIGHT_MB_PERMIT') == false) {
		alert('권한이 없습니다.');
		return;
	}
	var result = confirm('가입을 거부하시겠습니까 ?');
	if(result)
		location.href = $('#ctx').text() + '/admin/mb/permitNo.do?m=' + m + '&s=' + s + '&page=' + page + '&id=' + id;
}

function getPrice1() {
	var frm = document.frm_reg;
	
	var realPrice = parseInt(frm.realPrice.value);
	var margin = parseInt(frm.margin.value);
	var over = parseInt(frm.over.value);
	
	if(!realPrice) {
		alert('원가를 입력해주세요.');
		frm.realPrice.focus();
		return;
	}
	if(!margin) {
		alert('마진율을 입력해주세요.');
		frm.margin.focus();
		return;
	}
	if(!over) over = 0;
	
	var result = realPrice + (realPrice * margin / 100) + over;
	frm.price1.value = parseInt(result);
}

function getPrice2() {
	var frm = document.frm_reg;
	
	var price1 = parseInt(frm.price1.value);
	var radio = parseInt(frm.radioPrice2.value);
	var percent = parseInt(frm.percentPrice2.value);
	var direct = parseInt(frm.myPrice2.value);
	
	if(radio == 1) {
		if(!price1) {
			alert('판매가를 설정해주세요.');
			frm.price1.focus();
			return;
		}
		
		if(!percent) percent = 0;
		var result = price1 - (price1 * percent / 100);
		frm.price2.value = parseInt(result);
	} else {
		if(!direct) {
			alert('가격을 입력해주세요.');
			frm.myPrice2.focus();
			return;
		}
		frm.price2.value = parseInt(direct); 
	}
}

function getSave() {
	var frm = document.frm_reg;
	
	var price2 = parseInt(frm.price2.value);
	var radio = parseInt(frm.radioSave.value);
	var percent = parseInt(frm.percentSave.value);
	var direct = parseInt(frm.mySave.value);
	
	if(radio == 1) {
		if(!price2) {
			alert('회원가를 설정해주세요.');
			frm.price2.focus();
			return;
		}
		
		if(!percent) percent = 0;
		var result = (price2 * percent / 100);
		frm.save.value = parseInt(result);
	} else {
		if(!direct) {
			alert('가격을 입력해주세요.');
			frm.mySave.focus();
			return;
		}
		frm.save.value = parseInt(direct); 
	}
}

function go_addProduct() {
	var frm = document.frm_reg;
	
	if(frm.name.value == '') {
		alert('상품명을 입력해주세요.');
		frm.name.focus();
		return;
	} else if(frm.info.value == '') {
		alert('상품 설명을 입력해주세요.');
		frm.info.focus();
		return;
	} else if(frm.price1.value == '') {
		alert('판매가를 설정해주세요.');
		return;
	} else if(frm.price2.value == '') {
		alert('회원가를 설정해주세요.');
		return;
	} else if(frm.save.value == '') {
		alert('적립금을 설정해주세요.');
		return;
	}
	frm.submit();
}

function go_modifyProd(m, no, page) {
	if(!hasRole('RIGHT_PRD_UPDATE')) {
		alert('권한이 없습니다.');
		return;
	}
	location.href= "modify.do?m=" + m + "&no=" + no + "&page=" + page;
}

function go_removeProd(m, no, page) {
	if(hasRole('RIGHT_PRD_DELETE') == false) {
		alert('권한이 없습니다.');
		return;
	}
	var result = confirm('삭제하시겠습니까 ?');
	if(result)
		location.href = 'remove.do?m=' + m + '&no=' + no + '&page=' + page;
}

function go_depwait(m, s, no, page) {
	var result = confirm('입금 확인이 되었습니까 ?');
	if(result)
		location.href = $('#ctx').text() + '/admin/ord/modifydep.do?m=' + m + '&s=' + s + '&no=' + no + '&page=' + page;
}

function go_shipwait(m, s, no, page, state) {
	var result;
	
	if(state == 2)
		result = confirm('배송중 상태로 변경하시겠습니까 ?');
	else
		result = confirm('배송완료 상태로 변경하시겠습니까 ?');
	
	if(result)
		location.href = $('#ctx').text() + '/admin/ord/modifyship.do?m=' + m + '&s=' + s + '&no=' + no + '&page=' + page + '&state=' + (state+1);
}

function go_cancel(m, s, no, page, cancel) {
	var result;
	
	if(cancel == 1) 
		result = confirm('승인하시겠습니까 ?');
	else 
		result = confirm('거부하시겠습니까 ?');
	
	if(result) 
		location.href = $('#ctx').text() + '/admin/ord/modifyCancel.do?m=' + m + '&s=' + s + '&no=' + no + '&page=' + page + '&cancel=' + cancel;
}

function go_permitBalju(m, s, no, page, checkyn) {
	if(checkyn == 'y') {
		alert('이미 승인되었습니다.');
		return;
	}
	var result = confirm('승인하시겠습니까 ?');
	
	if(result)
		location.href = 'permit.do?m=' + m + '&s=' + s + '&no=' + no + '&page=' + page;
}

function go_baljuDetail(m, s, no) {
	location.href = 'detail.do?m=' + m + '&s=' + s + '&no=' + no;
}

function go_modifyShip(m, no, page) {
	if(!hasRole('RIGHT_REV_SHIP_UPDATE')) {
		alert('권한이 없습니다.');
		return;
	}
	location.href = 'modifyShip.do?m=' + m + '&no=' + no + '&page=' + page;
}

function go_removeShip(m, no, page) {
	if(!hasRole('RIGHT_REV_SHIP_DELETE')) {
		alert('권한이 없습니다.');
		return;
	}
	var result = confirm('삭제하시겠습니까 ?');
	if(result) 
		location.href = 'removeShip.do?m=' + m + '&no=' + no + '&page=' + page;
}

function go_replyPrd(no, idx) {
	var reply = $('.r' + idx + ' .com_reply').val();

	if(reply == '') {
		alert('답변을 입력해주세요.');
		$('.r' + idx + ' .com_reply').focus();
		return;
	}
	document.frm_reply.reviewNo.value = no;
	document.frm_reply.comReply.value = reply;
	document.frm_reply.submit();
}

function go_removePrd(m, s, no, page) {
	if(!hasRole('RIGHT_REV_PRD_DELETE')) {
		alert('권한이 없습니다.');
		return;
	}
	var result = confirm('삭제하시겠습니까 ?');
	if(result)
		location.href = 'prdremove.do?m=' + m + '&s=' + s + '&no=' + no + '&page=' + page;
}

function go_authreg() {
	if(hasRole('RIGHT_MB_AUTH_INSERT') == false) {
		alert('권한이 없습니다.');
		return;
	}
	var frm = document.frm_auth;
	$('#adminyn').val($('#adminyn').is(':checked') ? 'y' : 'n');
	if($('#btnAuth').text() == '권한 수정') {
		if($('#roleName').val() == '') {
			alert('권한명을 입력해주세요.');
			$('#roleName').focus();
			return;
		}
		var result = confirm('권한을 수정하시겠습니까 ?');
		if(result) {
			frm.action = "authModify.do";
			var authList = [];
			$('input[name="auth"]:checked').each(function(){
				authList.push($(this).val());
			});
			frm.authList.value = authList;
			frm.submit();
		}
	} else {
		if($('.auth').hasClass('on')) {
			if($('#roleName').val() == '') {
				alert('권한명을 입력해주세요.');
				$('#roleName').focus();
				return;
			}
			var result = confirm('[' + $('#roleName').val() + '] 권한을 생성하시겠습니까 ?');
			if(result) {
				var authList = [];
				$('input[name="auth"]:checked').each(function(){
					authList.push($(this).val());
				});
				frm.authList.value = authList;
				frm.submit();
			}
		}
		$('.auth').addClass('on');
	}
}

function go_authRemove(m, s, page, no, name) {
	if(hasRole('RIGHT_MB_AUTH_INSERT') == false) {
		alert('권한이 없습니다.');
		return;
	}
	var result = confirm('[' + name + '] 권한을 삭제하시겠습니까 ?');
	if(result) {
		location.href = $('#ctx').text() + '/admin/mb/authRemove.do?m=' + m + '&s=' + s + '&page=' + page + '&no=' + no;
	}
}

function ajaxAuth(no, name) {
	if(hasRole('RIGHT_MB_AUTH_INSERT') == false) {
		alert('권한이 없습니다.');
		return;
	}
	document.frm_auth.roleNo.value = no;
	$('.auth').addClass('on');
	$('#btnAuth').text('권한 수정');
	$.ajax({
		type: 'post',
		url: 'ajaxAuth.do',
		data: {'no': no},
		dataType: 'json',
		success: function(data) {
			$('#roleName').val(name);
			$('input:checkbox[name=auth]').prop('checked', false);
			if(data.role.adminyn == 'y') {
				$('#adminyn').prop('checked', true);
			} else {
				$('#adminyn').prop('checked', false);
			}
			$.each(data.authList, function(index, value) {
				$('input:checkbox[name=auth][value=' + value.authName + ']').prop('checked', true);
			});
		}, 
		error: function() {
			alert('error');
		}
	});
}

function hasRole(role) {
	var url = $('#ctx').text() + '/admin/hasRole.do';
	var result = false;
	$.ajax({
		type: 'post',
		url: url,
		dataType: 'json',
		data: {'role': role},
		async: false,
		success: function(data) {
			result = data;
		},
		error: function() {
			alert('error');
		}
	});
	return result;
}