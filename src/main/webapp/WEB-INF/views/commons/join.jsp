<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
	<title>회원가입 | 엔젤 플라워</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/commons/join.css" />
</head>

<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!-- container (S) -->
<div id="container">
	<div class="content">
		<h2>회원가입</h2>
		<p>엔젤플라워는 개인정보취급방침을 따르고 있으며 입력하신 개인정보는 회원님의 동의없이 3자에게 제공되지 않습니다.</p>
		<ul class="tap" style="text-align: center;">
			<li data-tap="step1">01.약관 동의</li> <!-- step -->
			<li class="on" data-tap="step2">02.회원정보입력</li>
			<li data-tap="step3">03.가입완료</li>
		</ul>
		<div id="step1" class="tap_content">
		111
		</div>
		<div id="step2" class="tap_content on">
			<form method="post">
				<div class="form01">
					<div class="row">
						<label>회원 구분</label>
						<input type="radio" name="gubun" value="일반" checked="checked" />&nbsp;일반회원&nbsp;&nbsp;
						<input type="radio" name="gubun" value="기업" />&nbsp;기업회원
					</div>
				</div>  
				<div class="form02">
					<div class="row">
						<label for="company">* 상호 (회사명)</label>
						<input type="text" name="company" id="company" class="input02"/>
					</div>
					<div class="row">
						<label for="reg_no">* 사업자 등록번호</label>
						<input type="text" name="reg_no1" id="reg_no" class="input01" maxlength="3"/>
						<span class="space">-</span>
						<input type="text" name="reg_no2" class="input01" maxlength="2" />
						<span class="space">-</span>
						<input type="text" name="reg_no3" class="input01" maxlength="5" />
						<a href="#" class="btn_white">인증하기</a>
					</div>
					<div class="row">
						<label for="represent">* 대표자</label>
						<input type="text" name="represent" id="represent" class="input02" />
					</div>
				</div>
				<div class="form03">
					<div class="row">
						<label for="name">* 이름</label>
						<input type="text" name="name" id="name" class="input02"/>
					</div>
					<div class="row">
						<label for="id">* 아이디</label>
						<input type="text" name="id" id="id" class="input02"/>
						<p class="info">(회원아이디 특수문자 제외한 모든 문자 사용가능) 
					</div>
					<div class="row">
						<label for="pwd">* 비밀번호</label>
						<input type="password" name="pwd" id="pwd" class="input02"/>
						<p class="info">영문 대소문자/숫자/특수문자를 혼용하여 2종료 10~16자 또는 3종류 8~16자 입력</p>
					</div>
					<div class="row">
						<label for="pwd_chk">* 비밀번호 확인</label>
						<input type="password" name="pwd_chk" id="pwd_chk" class="input02"/>
					</div>
					<div class="row">
						<label for="birth">* 생일/성별</label>
						<select name="year" id="birth" class="input01">
							<option value="">선택</option>
							<option value="1997">1997</option>
							<option value="1998">1998</option>
						</select>
						<span class="space">년</span>&nbsp;
						<select name="month" class="input01">
							<option value="">선택</option>
							<option value="1">1</option>
							<option value="2">2</option>
						</select>
						<span class="space">월</span>&nbsp;
						<select name="day" class="input01">
							<option value="">선택</option>
							<option value="1">1</option>
							<option value="2">2</option>
						</select>
						<span class="space">일</span>&nbsp;&nbsp;
						<input type="radio" name="gender" value="남" />&nbsp;남
						<input type="radio" name="gender" value="여" />&nbsp;여
					</div>
				</div>
				<div class="form04">
					<div class="row">
						<label for="phone">* 휴대폰</label>
						<select name="phone1" id="phone" class="input01">
							<option value="">선택</option>
							<option value="010">010</option>
							<option value="011">011</option>
						</select>
						<span class="space">-</span>
						<input type="text" name="phone2" size="4" class="input01"/>
						<span class="space">-</span>
						<input type="text" name="phone3" size="4" class="input01"/>
					</div>
					<div class="row">
						<label>우편번호</label>
						<input type="text" name="zip_code1" class="input01" readonly="readonly" />
						<span class="space">-</span>
						<input type="text" name="zip_code2" class="input01" readonly="readonly" /> 
						<a href="#" class="btn_white">우편번호 검색</a> 
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
				<div class="form05">
					<div class="row">
						<label for="email">* 이메일</label>
						<input type="text" name="email1" id="email" class="input02" />
						<span class="space">@</span>
						<select name="email2" class="input02">
							<option value="">선택</option>
							<option value="naver.com">naver.com</option>
						</select>
						<a href="#" class="btn_white">중복확인</a>
					</div>
				</div>
				<a href="#" class="btn_join">회원가입</a>
			</form>
			<script>
				$('input:radio[name="gubun"]').click(function(){
					var gubun = $(this).val();
					if(gubun == '일반') 
						$('#step2 .form02').hide();
					else
						$('#step2 .form02').show();
				})
			</script>
		</div>
		<div id="step3" class="tap_content">
		333
		</div>
		<script>
			/* $('ul.tap li').click(function(){
				var active_tap = $(this).data('tap');
				$('ul.tap li').removeClass('on');
				$('.tap_content').removeClass('on');
				$(this).addClass('on');
				$('#' + active_tap).addClass('on');
			}) */
		</script>
	</div>
	<%@ include file="/WEB-INF/views/include/quick.jsp" %>
</div>
<!-- container (E) -->

<%@ include file="/WEB-INF/views/include/footer.jsp" %>