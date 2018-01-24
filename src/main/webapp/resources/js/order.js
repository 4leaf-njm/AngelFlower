function go_order(length) {
	console.log(length);
	if(length == true) {
		alert('장바구니에 상품이 없습니다.\n상품을 추가해주세요.');
		return;
	}
	
	location.href = $('#ctx').text() + '/order/order.do';
}

function go_home() {
	location.href = $('#ctx').text() + '/home.do';
}

function go_updateAmount(no, num) {
	location.href = $('#ctx').text() + '/order/updateAmount.do?cartNo=' + no + '&quantity=' + num;
}

function go_deleteCart() {
	var delList = new Array();
	
	var chkbox = $('.remove:checked');
	var result = confirm(chkbox.length + ' 개의 상품을 삭제하시겠습니까 ?');
	if(result) {
		for(var i=0; i<chkbox.length; i++) {
			delList[i] = chkbox[i].value;
		}
		location.href = $('#ctx').text() + '/order/removeCart.do?delList=' + delList;
	}
}

function go_deleteCartAll(id) {
	var result = confirm('장바구니를 비우시겠습니까 ?');
	if(result){
		location.href = $('#ctx').text() + '/order/removeCartAll.do?id=' + id;
	}
}

function go_addCartFromWish(wishNo) {
	var result = confirm('장바구니에 담으시겠습니까 ?');
	if(result) {
		location.href = $('#ctx').text() + '/order/addCartFromWish.do?wishNo=' + wishNo;
	}
}

function go_removeWish(wishNo) {
	var result = confirm('이 상품을 삭제하시겠습니까 ?');
	if(result) {
		location.href = $('#ctx').text() + '/order/removeWish.do?wishNo=' + wishNo;
	}
}

function go_removeOrderCart(cartNo) {
	var result = confirm('이 상품을 삭제하시겠습니까 ?');
	if(result) {
		location.href = $('#ctx').text() + '/order/removeOrderCart.do?cartNo=' + cartNo;
	}
}

function go_selectSave(id) {
	$.ajax({
		url: 'ajaxGetSave.do',
		type: 'post',
		data: {'id': id},
		dataType: 'json',
		success: function(data) {
			$('.check .save').text(comma(data));
			
			if(data >= 30000) {
				$('#useY').removeAttr('disabled');
			}
		},
		error: function() {
			alert('error');
		}
	});
}

function changeUse(use) {
	if(use == 'y') {
		$('#save').show();
		$('#useOk').show();
	}
	else {
		$('#save').hide();
		$('#useOk').hide();
	}
}

function saveUseOk() {
	var cur_save = parseInt($('.check .save').text().replace(',', ''));
	var use_save = parseInt($('.use #save').val().trim());
	
	if(cur_save < use_save) {
		alert('적립금이 부족합니다.');
		return;
	}
	
	if(use_save < 0) {
		alert('0 이상 입력해주세요.');
		return;
	}
	var totalPrice = parseInt($('#totalPrice').text().replace('원','').replace(',', ''));

	$('#savePrice').text(comma(use_save) + '원');
	$('#finalPrice').text(comma(totalPrice - use_save));
	
	document.frm_order.useSave.value = use_save;
}

function go_orderProd() {
	var frm = document.frm_order;
	var type = frm.orderWay.value;
	
	if(frm.user_email3.value == '0') {
		frm.memEmail.value = frm.user_email1.value + '@' + frm.user_email2.value; 
	}else {
		frm.memEmail.value = frm.user_email1.value + '@' + frm.user_email3.value;
	}
	frm.memPhone.value = frm.user_phone1.value + '-' + frm.user_phone2.value + '-' + frm.user_phone3.value;
	frm.receivePhone.value = frm.deli_phone1.value + '-' + frm.deli_phone2.value + '-' + frm.deli_phone3.value;
	frm.receiveAddr.value = '(' + frm.deli_zipcode.value + ') ' + frm.deli_addr1.value + ' ' + frm.deli_addr2.value;
	
	if(type == '무통장입금') {
		frm.submit();
		
	} else if(type == '신용카드') {
	      IMP.request_pay({
	          pg : 'html5_inicis', 
	          pay_method : 'card',
	          merchant_uid : 'merchant_' + new Date().getTime(),
	          name : '주문명:결제테스트',
	          amount : 14000,
	          buyer_email : 'iamport@siot.do',
	          buyer_name : '구매자이름',
	          buyer_tel : '010-1234-5678',
	          buyer_addr : '서울특별시 강남구 삼성동',
	          buyer_postcode : '123-456',
	          m_redirect_url : 'https://www.yourdomain.com/payments/complete'
	      }, function(rsp) {
	          if ( rsp.success ) {
	              var msg = '결제가 완료되었습니다.';
	              msg += '고유ID : ' + rsp.imp_uid;
	              msg += '상점 거래ID : ' + rsp.merchant_uid;
	              msg += '결제 금액 : ' + rsp.paid_amount;
	              msg += '카드 승인번호 : ' + rsp.apply_num;
	          } else {
	              var msg = '결제에 실패하였습니다.';
	              msg += '에러내용 : ' + rsp.error_msg;
	          }
	      });
	} else if (type == '실시간 계좌이체') {
		IMP.request_pay({
	          pg : 'html5_inicis', 
	          pay_method : 'trans',
	          merchant_uid : 'merchant_' + new Date().getTime(),
	          name : '주문명:결제테스트',
	          amount : 14000,
	          buyer_email : 'iamport@siot.do',
	          buyer_name : '구매자이름',
	          buyer_tel : '010-1234-5678',
	          buyer_addr : '서울특별시 강남구 삼성동',
	          buyer_postcode : '123-456',
	          m_redirect_url : 'https://www.yourdomain.com/payments/complete'
	      }, function(rsp) {
	          if ( rsp.success ) {
	              var msg = '결제가 완료되었습니다.';
	              msg += '고유ID : ' + rsp.imp_uid;
	              msg += '상점 거래ID : ' + rsp.merchant_uid;
	              msg += '결제 금액 : ' + rsp.paid_amount;
	              msg += '카드 승인번호 : ' + rsp.apply_num;
	          } else {
	              var msg = '결제에 실패하였습니다.';
	              msg += '에러내용 : ' + rsp.error_msg;
	          }
	      });
	} else if (type == '가상계좌') {
		IMP.request_pay({
	          pg : 'html5_inicis', 
	          pay_method : 'vbank',
	          merchant_uid : 'merchant_' + new Date().getTime(),
	          name : '주문명:결제테스트',
	          amount : 14000,
	          buyer_email : 'iamport@siot.do',
	          buyer_name : '구매자이름',
	          buyer_tel : '010-1234-5678',
	          buyer_addr : '서울특별시 강남구 삼성동',
	          buyer_postcode : '123-456',
	          m_redirect_url : 'https://www.yourdomain.com/payments/complete'
	      }, function(rsp) {
	          if ( rsp.success ) {
	              var msg = '결제가 완료되었습니다.';
	              msg += '고유ID : ' + rsp.imp_uid;
	              msg += '상점 거래ID : ' + rsp.merchant_uid;
	              msg += '결제 금액 : ' + rsp.paid_amount;
	              msg += '카드 승인번호 : ' + rsp.apply_num;
	          } else {
	              var msg = '결제에 실패하였습니다.';
	              msg += '에러내용 : ' + rsp.error_msg;
	          }
	      });
	}
}

function go_cancel() {
	location.href = $('#ctx').text() + '/order/cart.do';
}

function addrPostcode() {
	new daum.Postcode(
	{
		oncomplete : function(data) {
			var fullAddr = '';
			var extraAddr = '';

			if (data.userSelectedType === 'R') {
				fullAddr = data.roadAddress;
			} else {
				fullAddr = data.jibunAddress;
			}
			if (data.userSelectedType === 'R') {
				if (data.bname !== '') {
					extraAddr += data.bname;
				}

				if (data.buildingName !== '') {
					extraAddr += (extraAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				fullAddr += (extraAddr !== '' ? ' (' + extraAddr
						+ ')' : '');
			}
			document.frm_order.deli_zipcode.value = data.zonecode;
			document.frm_order.deli_addr1.value = fullAddr;
			document.frm_order.deli_addr2.focus();
		}
	}).open();
}