 function go_myorder_detail(orderNo) {
	 window.open("myorder_detail.do?no=" + orderNo, "주문상세", "width=600, height=530, toolbar=no, menubar=no, scrollbar=yes, resizable=yes" );  
 }
 
 function go_myexit() {
	var result = confirm('정말 탈퇴하시겠습니까 ?');
	if(result) {
		document.frm_exit.submit();
	}
}

 var emailchk = false;
 function go_updateInfo(type) {
 	var frm = document.frm_update;
 	
 	if(type == 'admin') {
 		frm.busiNo.value = frm.busiNo1.value + '-' + frm.busiNo2.value + '-' + frm.busiNo3.value;

 		if(frm.company.value == '') {
 			alert('상호(회사명)을 입력해주세요.');
 			frm.company.focus();
 			return;
 		} else if (frm.busiNo1.value == '') {
 			alert('사업자등록번호를 입력해주세요.');
 			frm.busiNo1.focus();
 			return;
 		} else if (frm.busiNo2.value == '') {
 			alert('사업자등록번호를 입력해주세요.');
 			frm.busiNo2.focus();
 			return;
 		} else if (frm.busiNo3.value == '') {
 			alert('사업자등록번호를 입력해주세요.');
 			frm.busiNo3.focus();
 			return;
 		} else if (frm.represent.value == '') {
 			alert('대표자를 입력해주세요.');
 			frm.represent.focus();
 			return;
 		}
 	}
 	frm.birth.value = frm.year.value.substr(2, 2) + frm.month.value + frm.day.value;
 	frm.phone.value = frm.phone1.value + '-' + frm.phone2.value + '-' + frm.phone3.value;
 	frm.address.value = '(' + frm.zip_code.value + ')' + frm.address1.value + ' ' + frm.address2.value;
 	if(frm.emailType.value == 'n')
 		frm.email.value = frm.email1.value + '@' + frm.email2.value;
 	else
 		frm.email.value = frm.email1.value + '@' + frm.email3.value;

 	var phone_reg = /^\d{3}-\d{3,4}-\d{4}$/;
 	var email_reg = new RegExp('^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$', 'i');
 	var email_match = email_reg.exec(frm.email.value);
 	
 	if (frm.pwd.value == '') {
 		alert('비밀번호를 입력해주세요.');
 		frm.pwd.focus();
 		return;
 	} else if (frm.pwd.value != frm.pwd_chk.value) {
 		alert('비밀번호가 일치하지 않습니다.');
 		frm.pwd_chk.focus();
 		return;
 	} else if (frm.year.value == '') {
 		alert('생년월일을 입력해주세요.');
 		frm.year.focus();
 		return;
 	} else if (frm.month.value == '') {
 		alert('생년월일을 입력해주세요.');
 		frm.month.focus();
 		return;
 	} else if (frm.day.value == '') {
 		alert('생년월일을 입력해주세요.');
 		frm.day.focus();
 		return;
 	} else if (frm.gender.value == '') {
 		alert('성별을 선택해주세요.');
 		frm.gender.focus();
 		return;
 	} else if (frm.phone1.value == '') {
 		alert('휴대폰 번호를 입력해주세요.');
 		frm.phone1.focus();
 		return;
 	} else if (frm.phone2.value == '') {
 		alert('휴대폰 번호를 입력해주세요.');
 		frm.phone2.focus();
 		return;
 	} else if (frm.phone3.value == '') {
 		alert('휴대폰 번호를 입력해주세요.');
 		frm.phone3.focus();
 		return;
 	} else if (!phone_reg.test(frm.phone.value)){
 		alert('휴대폰 번호가 올바르지 않습니다.');
 		frm.phone2.focus();
 		return;
 	} else if (frm.email1.value == '') {
 		alert('이메일을 입력해주세요.');
 		frm.email1.focus();
 		return;
 	} else if (frm.email2.value == '') {
 		alert('이메일을 입력해주세요.');
 		frm.email2.focus();
 		return;
 	} else if (email_match == null) {
 		alert('이메일이 올바르지 않습니다.');
 		frm.email1.focus();
 		return;
 	} else if (emailchk == false) {
 		alert('이메일 중복확인을 해주세요.');
 		frm.email1.focus();
 		return;
 	}
 	if (!pwdchk) {
 		alert('비밀번호가 올바르지 않습니다.');
 		return;
 	}
 	frm.submit();
 }
 var pwdchk = false;
 function keyPwdCheck() {
 	var frm = document.frm_update;
 	var pwd = document.frm_update.pwd.value;
 	var reg_exp = new RegExp('^[a-zA-Z0-9!@#$%^&*()?_~]{8,16}$', 'g');
 	var match = reg_exp.exec(pwd);
 	
 	keyPwdchkCheck();
 	
 	if(pwd == '') {
 		$('.pwd.info').text('영문자/숫자/특수문자를 혼용하여 8~16자 입력');
 		$('.pwd.info').css('color', '#ff0000');
 		pwdchk = false;
 		return false;
 	} else if(pwd.length < 8 || pwd.length > 16) {
 		$('.pwd.info').text('비밀번호는 8~16자리 입력');
 		$('.pwd.info').css('color', '#ff0000');
 		pwdchk = false;
 		return false;
 	} else if (match == null) {
 		$('.pwd.info').text('사용 불가능한 비밀번호입니다.');
 		$('.pwd.info').css('color', '#ff0000');
 		pwdchk = false;
 		return false;
 	} 
 	$('.pwd.info').text('사용 가능한 비밀번호입니다.');
 	$('.pwd.info').css('color', '#0000ff');
 	pwdchk = true;
 	return true;
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
			document.frm_update.zip_code.value = data.zonecode;
			document.frm_update.address1.value = fullAddr;
			document.frm_update.address2.focus();
		}
	}).open();
}

function changeEmail() {
	var frm = document.frm_update;
	
	if(frm.email3.value == '0') {
		$('#selEmail').val('');
		$('#selEmail').show();
		frm.emailType.value = 'n';
	} else {
		$('#selEmail').val(frm.email3.value);
		$('#selEmail').hide();
		frm.emailType.value = 'y';
	}
	
}

function settingBirth() {
	var date = new Date();
	var year = date.getFullYear();
	var selectYear = document.frm_update.year;
	var selectMonth = document.frm_update.month;
	var selectDay = document.frm_update.day;
	
	var optionIndex = 1;
	
	for(var i=year; i>=year-100; i--) {
		selectYear.add(new Option(i, i), optionIndex++);
	}
	
	optionIndex = 1;
	
	for(var i=1; i<=12; i++) {
		var value = (i+'').length == 1 ? '0' + i : i;
		selectMonth.add(new Option(i, value), optionIndex++);
	}
	
	optionIndex = 1;
	
	for(var i=1; i<=31; i++) {
		var value = (i+'').length == 1 ? '0' + i : i;
		selectDay.add(new Option(i, value), optionIndex++);
	}
}

 function keyPwdchkCheck() {
 	var frm = document.frm_update;
 	var pwd = frm.pwd.value;
 	var pwdchk = frm.pwd_chk.value;
 	
 	if(pwdchk == '') {
 		$('.pwdchk.info').text('비밀번호 확인 항목을 입력해주세요.');
 		$('.pwdchk.info').css('color', '#ff0000');
 		return false;
 	} else if(pwd != pwdchk) {
 		$('.pwdchk.info').text('비밀번호가 일치하지 않습니다.');
 		$('.pwdchk.info').css('color', '#ff0000');
 		return false;
 	} 
 	$('.pwdchk.info').text('비밀번호가 일치합니다.');
 	$('.pwdchk.info').css('color', '#0000ff');
 	
 	return true; 
 }
 
 function go_emailchk() {
	var frm = document.frm_update;
	if($('#emailChk').text() == '중복 확인') {
		var email = '';
		if(frm.emailType.value == 'n')
			email = frm.email1.value + '@' + frm.email2.value;
		else
			email = frm.email1.value + '@' + frm.email3.value;
		var email_reg = new RegExp('^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$', 'i');
		var email_match = email_reg.exec(email);
		if(email_match == null) {
			alert('이메일이 올바르지 않습니다.');
			frm.email1.focus();
			return;
		}
		var url = $('#ctx').text() + '/commons/emailCheck.do';
		$.ajax({
			type: 'post',
			url: url, 
			data: {'email': email},
			dataType: 'json',
			success: function(data) {
				if(data.msg == 'success') {
					alert('사용가능한 이메일입니다.');
					$('#emailChk').text('다시 입력');
					frm.email1.setAttribute('readonly', 'readonly');
					frm.email2.setAttribute('readonly', 'readonly');
					frm.email3.setAttribute('disabled', 'readonly');
					emailchk = true;
				} else {
					alert('이미 사용중인 이메일입니다.');
					emailchk = false;
				}
			},
			error: function() {
				alert('error');
			}
		});
	} else {
		frm.email1.removeAttribute('readonly');
		frm.email2.removeAttribute('readonly');
		frm.email3.removeAttribute('disabled');
		$('#emailChk').text('중복 확인');
		emailchk = false;
	}
}