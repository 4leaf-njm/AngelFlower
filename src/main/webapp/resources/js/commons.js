function go_login() {
	var frm = document.frm_login;
	
	if(frm.id.value == '') {
		alert('아이디를 입력해주세요.');
		frm.id.focus();
		return;
	} else if(frm.pw.value == '') {
		alert('비밀번호를 입력해주세요.');
		frm.pw.focus();
		return;
	}
	
	frm.submit();
}

function join01() {
	var chk1 = $('input[name="chk1"]:checked').val();
	var chk2 = $('input[name="chk2"]:checked').val();

	if(chk1 != '동의함') {
		alert('이용약관에 동의해주세요.');
		return;
	} else if(chk2 != '동의함') {
		alert('개인정보 취급방침에 동의해주세요.');
		return;
	}
	
	$('.tap li').removeClass('on');
	$('.tap li').eq(1).addClass('on');
	$('#step1').hide();
	$('#step2').show();
}

function join_chk() {
	var frm = document.frm_join;
	var gubun = frm.gubun.value;
	
	if(gubun == '기업') { // 기업회원일 경우
		frm.busiNo.value = frm.busiNo1.value + '-' + frm.busiNo2.value + '-' + frm.busiNo3.value;
		frm.action = $('#ctx').text() + '/admin/join.do';
	
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
	
	if(frm.name.value == '') {
		alert('이름을 입력해주세요.');
		frm.name.focus();
		return;
	} else if (frm.id.value == '') {
		alert('아이디를 입력해주세요.');
		frm.id.focus();
		return;
	} else if (frm.pwd.value == '') {
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
	} 
	
	if(!idchk) {
		alert('아이디가 올바르지 않습니다.');
		return;
	} else if (!pwdchk) {
		alert('비밀번호가 올바르지 않습니다.');
		return;
	}
	
	frm.submit();
}

var idchk = false;
function keyIdCheck() {
	var frm = document.frm_join;
	var id = document.frm_join.id.value;
	var reg_exp = new RegExp('^[a-zA-Z][a-zA-Z0-9]{5,11}$', 'g');
	var match = reg_exp.exec(id);
	
	if(id == '') {
		$('.id.info').text('영문자/숫자를 혼용하여 6~12자 입력');
		$('.id.info').css('color', '#ff0000');
		idchk = false;
		return false;
	} else if(id.length < 6 || id.length > 12) {
		$('.id.info').text('아이디는 6~12자리 입력');
		$('.id.info').css('color', '#ff0000');
		idchk = false;
		return false;
	} else if (match == null){
		$('.id.info').text('사용 불가능한 아이디입니다.');
		$('.id.info').css('color', '#ff0000');
		idchk = false;
		return false;
	} else {
		$.ajax({
			url: 'ajaxIdCheck.do',
			type: 'post',
			dataType: 'json',
			data: {'id': id},
			success: function(data) {
				if(data == 1) {
					$('.id.info').text('사용 가능한 아이디입니다.');
					$('.id.info').css('color', '#0000ff');
					idchk = true;
					return true;
				}
				else {
					$('.id.info').text('이미 존재하는 아이디입니다.');
					$('.id.info').css('color', '#ff0000');
					idchk = false;
					return false;
				}
			},
			error: function() {
				alert('error');
			}
		});
	}
}

var pwdchk = false;
function keyPwdCheck() {
	var frm = document.frm_join;
	var pwd = document.frm_join.pwd.value;
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

function keyPwdchkCheck() {
	var frm = document.frm_join;
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

$('input:radio[name="gubun"]').click(function(){
	var gubun = $(this).val();
	if(gubun == '일반') 
		$('#step2 .form02').hide();
	else
		$('#step2 .form02').show();
});

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
			document.frm_join.zip_code.value = data.zonecode;
			document.frm_join.address1.value = fullAddr;
			document.frm_join.address2.focus();
		}
	}).open();
}

function changeEmail() {
	var frm = document.frm_join;
	
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
	var selectYear = document.frm_join.year;
	var selectMonth = document.frm_join.month;
	var selectDay = document.frm_join.day;
	
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