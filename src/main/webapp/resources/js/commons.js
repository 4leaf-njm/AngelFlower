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