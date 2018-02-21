<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage/mypage.css" />
</head>

<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!-- container (S) -->
<div id="container">
	<%@ include file="/WEB-INF/views/mypage/sidebar.jsp" %>
	<div class="content">
		<h2>회원정보 수정</h2>
		<p>입력하신 개인정보는 회원님의 동의없이 제 3자에게 제공되지 않으며, 개인정보취급방침에 따로 보호되고 있습니다.</p>
		<div class="update">
			<form method="post" name="frm_update">
				<input type="hidden" name="id" value="${user.id}" />
				<div class="form01">
					<div class="row">
						<label for="name">* 이름</label>
						<input type="text" name="name" id="name" class="input02" value="${user.name}" readonly="readonly"/>
					</div>
					<div class="row">
						<label for="id">* 아이디</label>
						<p class="userid">${user.id}</p>
					</div>
					<div class="row">
						<label for="pwd">* 비밀번호</label>
						<input type="password" name="pwd" id="pwd" class="input02" onkeyup="keyPwdCheck()" />
						<p class="pwd info">영문자/숫자/특수문자를 혼용하여 8~16자 입력</p>
					</div>
					<div class="row">
						<label for="pwd_chk">* 비밀번호 확인</label>
						<input type="password" name="pwd_chk" id="pwd_chk" class="input02" onkeyup="keyPwdchkCheck()"/>
						<p class="pwdchk info"></p>
					</div>
					<div class="row">
						<input type="hidden" name="birth" />
						<label for="year">* 생일/성별</label>
						<select name="year" id="year" class="input01" style="width: 76px;">
							<option value="">선택</option>
						</select>
						<span class="space">년</span>&nbsp;
						<select name="month" class="input01">
							<option value="">선택</option>
						</select>
						<span class="space">월</span>&nbsp;
						<select name="day" class="input01">
							<option value="">선택</option>
						</select>
						<span class="space">일</span>&nbsp;&nbsp;
						<label style="width: 46px; padding: 0;"><input type="radio" name="gender" value="1" />&nbsp;남</label>
						<label style="width: 46px; padding: 0;"><input type="radio" name="gender" value="2" />&nbsp;여</label>
					</div>
				</div>
				<div class="form02">
					<div class="row">
						<input type="hidden" name="phone" />
						<label for="user_phone">* 휴대폰</label>
						<select name="phone1" id="user_phone" class="input01">
							<option value="">선택</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>
						<span class="space">-</span>
						<input type="text" name="phone2" size="4" maxlength="4" class="input01"/>
						<span class="space">-</span>
						<input type="text" name="phone3" size="4" maxlength="4" class="input01"/>
					</div>
					<div class="row">
						<input type="hidden" name="address" />
						<label>우편번호</label>
						<input type="text" name="zip_code" class="input01" readonly="readonly" style="width:80px;"/>
						<a href="javascript:addrPostcode()" class="btn_white">우편번호 검색</a> 
					</div>
					<div class="row">
						<label for="address1">기본주소</label>
						<input type="text" name="address1" id="address1" class="input03" readonly="readonly" />
					</div>
					<div class="row">
						<label for="address2">상세주소</label>
						<input type="text" name="address2" id="address2" class="input03" />
					</div>
				</div>
				<div class="form03">
					<div class="row">
						<input type="hidden" name="email" />
						<input type="hidden" name="emailType" />
						<label for="mem_email">* 이메일</label>
						<input type="text" name="email1" id="mem_email" class="input02" />
						<span class="space">@</span>
						<input type="text" name="email2" class="input02" id="selEmail" style="margin: 0 7px 0 0; display: none;"/>
						<select name="email3" class="input02" onchange="changeEmail()" >
							<option value="">선택</option>
							<option value="naver.com">naver.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="gmail.com">gmail.com</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="chol.com">chol.com</option>
							<option value="dreamwiz.com">dreamwiz.com</option>
							<option value="freechal.com">freechal.com</option>
							<option value="hanmir.com">hanmir.com</option>
							<option value="nate.com">nate.com</option>
							<option value="paran.com">paran.com</option>
							<option value="yahoo.com">yahoo.com</option>
							<option value="0">직접입력</option>
						</select>
						<a href="javascript:go_emailchk()" class="btn_white" id="emailChk">중복 확인</a> 
					</div>
				</div>
				<div class="btn_box">
					<a href="javascript:go_updateInfo('member')">정보 수정</a>
				</div>
			</form>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/include/quick.jsp" %>
</div>
<!-- container (E) -->

<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/mypage.js"></script>
<script>
if('${msg}' != '')
	alert('${msg}');
	
	settingBirth();
</script>