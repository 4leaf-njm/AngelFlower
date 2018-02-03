<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${empty cartList}">
<script>
	alert('장바구니에 상품이 없습니다.\n상품을 추가해주세요.');
	location.href = '<c:url value="/order/cart.do" />';
</script>
</c:if>

<%@ include file="/WEB-INF/views/include/header.jsp" %>

<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/order/order.css" />
    <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <script>
	    var IMP = window.IMP;
	    IMP.init('iamport'); 
    </script>
</head>

<!-- container (S) -->
<div id="container">
	<ul class="tap" style="margin-top: 20px;">
		<li data-tap="tap1">01 장바구니</li> 
		<li class="on" data-tap="tap2">02 주문/결제</li>
		<li data-tap="tap3">03 주문완료</li>
	</ul>
	
	<div class="orderinfo">
		<h2>주문상품 확인</h2>
		<table>
			<tr>
				<th style="width:180px;">사진</th>
				<th>구입 상품명</th>
				<th style="width:170px;">수량</th>
				<th style="width:170px;">가격</th>
				<th style="width:170px;">적립금</th>
				<th style="width:150px;">취소</th>
			</tr>
			<c:forEach var="cart" items="${cartList}">
			<tr>
				<td class="image"><img src="${pageContext.request.contextPath }/resources/images/item/${cart.prodImage}" /></td>
				<td class="name">${cart.prodName }</td>
				<td>${cart.quantity } 개</td>
				<td><b><fmt:formatNumber value="${cart.prodPrice2 * cart.quantity}" pattern="#,##0"/>원</b></td>
				<td><fmt:formatNumber value="${cart.prodSave * cart.quantity}" pattern="#,##0"/>원</td>
				<td><a href="javascript:go_removeOrderCart('${cart.cartNo}')" class="btn">삭제</a></td>
			</tr>
			</c:forEach>
		</table>
	</div>
	<form action="complete.do" method="post" name="frm_order">
	<div class="userinfo">
		<h2>주문고객 정보</h2>
		<table>
			<tr>
				<th>* 이름</th>
				<td class="userName">
					<input type="text" name="memName" id="userName" class="input02" value="${user.name }"/>	
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="hidden" name="memEmail" />
					<input type="text" name="user_email1" class="input02" id="userEmail1"/>
					<span class="space">@</span>
					<input type="text" name="user_email2" class="input02" id="selEmail" style="margin: 0 7px 0 0; display: none;"/>
					<select name="user_email3" class="input02" id="userEmail2">
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
				</td>
			</tr>
			<tr>
				<th>* 연락처</th>
				<td>
					<input type="hidden" name="memPhone" />
					<select name="user_phone1" class="input01" id="userPhone1">
						<option value="">선택</option>
						<option value="010">010</option>
					</select>
					<span class="space">-</span>
					<input type="text" name="user_phone2" class="input01" id="userPhone2" maxlength="4"/>
					<span class="space">-</span>
					<input type="text" name="user_phone3" class="input01" id="userPhone3" maxlength="4"/>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="delivery">
		<div>
			<h2>배송지 정보</h2>
			<p><label><input type="checkbox" name="equal" id="equal" />위 정보와 같음</label></p> 		
		</div>
		<table>
			<tr>
				<th>* 이름</th>
				<td><input type="text" name="receiveName" class="input02" id="deliName"/></td>
			</tr>
			<tr>
				<th>* 연락처</th>
				<td>
					<input type="hidden" name="receivePhone" />
					<select name="deli_phone1" class="input01" id="deliPhone1">
						<option value="">선택</option>
						<option value="010">010</option>
					</select>
					<span class="space">-</span>
					<input type="text" name="deli_phone2" class="input01" id="deliPhone2" maxlength="4" />
					<span class="space">-</span>
					<input type="text" name="deli_phone3" class="input01" id="deliPhone3" maxlength="4" />
				</td>
			</tr>
			<tr>
				<th>* 주소</th>
				<td>
					<input type="hidden" name="receiveAddr" />
					<div class="top">
						<input type="text" name="deli_zipcode" class="input01" readonly="readonly"/>
						<a href="javascript:addrPostcode()" class="btn">우편번호</a>
					</div>
					<div class="bottom">
						<input type="text" name="deli_addr1" class="input03" readonly="readonly"/>
						<input type="text" name="deli_addr2" class="input03"/>
					</div>
				</td>
			</tr>
			<tr>
				<th class="">주문시 요청사항<span>(100자내외)</span></th>
				<td class="request">
					<textarea rows="5" cols="30" name="orderRequest"></textarea>
					<p>행사 또는 예식의 경우 시간 (ex 행사 오후 3시 / 예식 오후 3시)과 신랑측 또는 신부측 기재 해주시면 행사 또는 예식 시작 전에 배송이 완료 됩니다.</p>
					<p>근조화환의 경우 필히 고인성함 또는 상주성함을 입력해주세요.</p>
				</td>
			</tr>
			<tr>
				<th>* 희망배송일</th>
				<td>
					<input type="text" name="hope_date" class="input02" id="datePicker" style="margin: 0 10px 0 0;"/>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="msginfo">
		<h2>메시지 정보</h2>
		<table>
			<tr>
				<th>경조사문구</th>
				<td>
					<input type="text" name="orderMsg1" class="input03" maxlength="20"/>
					<span>경조사 문구를 입력해주세요. (띄어쓰기 포함 20자 이내)</span>
				</td>
			</tr>
			<tr>
				<th>보내시는분</th>
				<td>
					<input type="text" name="orderMsg2" class="input03" maxlength="20"/>
					<span>보내시는분을 입력해주세요. (띄어쓰기 포함 20자 이내)</span>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="payinfo">
		<h2>결제 정보</h2>
		<table>
			<tr>
				<th>결제방법</th>
				<td>
					<div class="top">
						<label><input type="radio" name="orderWay" value="무통장입금" checked="checked"/>무통장입금</label>
						<select name="account">
							<option value="">입금 계좌번호 선택(반드시 주문자 성함으로 입금)</option>
						</select>
					</div>
					<div class="bottom">
						<label><input type="radio" name="orderWay" value="신용카드" />신용카드</label>
						<label><input type="radio" name="orderWay" value="실시간 계좌이체" />실시간 계좌이체</label>
						<label><input type="radio" name="orderWay" value="가상계좌" />가상계좌</label>
					</div>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="agree">
		<h2>주문자 동의</h2>
		<table>
			<tr>
				<th>주문동의</th>
				<td>
					<label><input type="checkbox" name="agree" />
					상기 결제정보를 확인하였으며, 구매진행에 동의합니다.</label>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="cost">
		<table>
			<tr class="check">
				<th>적립금 조회</th>
				<td>
					<p class="save"></p><span>원</span>
					<button type="button" onclick="javascript:go_selectSave('${user.id}')" class="btn"
						<c:if test="${empty user}"> disabled="disabled"</c:if>
					>조회</button>
				</td>
			</tr>
			<tr class="use">
				<th>적립금 사용</th>
				<td>
					<input type="hidden" name="useSave" value="0" />
					<input type="text" name="save" id="save" style="display: none;"/>
					<a href="javascript:saveUseOk()" class="btn" id="useOk" style="display: none;">적용</a>
					<label><input type="radio" name="useyn" value="사용" id="useY" disabled="disabled" onclick="changeUse('y')"/>사용</label>
					<label><input type="radio" name="useyn" value="미사용" id="useN" checked="checked" onclick="changeUse('n')"/>미사용</label>
					<p>* 적립금은 30000 원 이상부터 사용가능합니다.</p>
				</td>
			</tr>
			<tr class="final">
				<th>최종 결제금액</th>
				<td>
					<div class="left">
						<p><span id="finalPrice"><fmt:formatNumber value="${totalPrice}" pattern="#,##0"/></span>원</p>
					</div>
					<div class="right">
						<div>
							<p>상품합계금액</p>
							<span id="totalPrice"><fmt:formatNumber value="${totalPrice}" pattern="#,##0"/>원</span>
						</div>
						<div>
							<p>적립금 할인</p>
							<span id="savePrice">0원</span>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<div class="btn_group">
		<a href="javascript:go_orderProd()" class="btn_order">주문하기</a>
		<a href="javascript:go_cancel()" class="btn_cancel">주문취소</a>
	</div>
	</form>
	<%@ include file="/WEB-INF/views/include/quick.jsp" %>
</div>
<!-- container (E) -->

<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/order.js"></script>

<script>
$(document).ready(function(){
	var frm = document.frm_order;
	var email = '${user.email}';
	var emailArr = email.split('@');
	var phone = '${user.phone}';
	var phoneArr = phone.split('-');
	
	$('#userEmail1').val(emailArr[0]);
	$('#userEmail2').val(emailArr[1]).prop('selected', true);
	$('#userPhone1').val(phoneArr[0]).prop('selected', true);
	$('#userPhone2').val(phoneArr[1]);
	$('#userPhone3').val(phoneArr[2]);
	
	$('#equal').click(function(){
		if($(this).prop('checked')) {
			$('#deliName').val($('#userName').val());
			$('#deliPhone1').val($('#userPhone1').val()).prop('selected', true);
			$('#deliPhone2').val($('#userPhone2').val());
			$('#deliPhone3').val($('#userPhone3').val())
		} else {
			$('#deliName').val('');
			$('#deliPhone1').val('').prop('selected', true);
			$('#deliPhone2').val('');
			$('#deliPhone3').val('')
		}
	});
	
	$('.request textarea').on('keydown', function(){
		if($(this).val().length > 250) {
            $(this).val($(this).val().substring(0, 250));
        }
	})
	
	$('#datePicker').datepicker({
		showOn: 'both',
		buttonImage: $('#ctx').text() + '/resources/images/icon/ico_calendar.png',
		buttonImageOnly: true,
		changeMonth: true,
		changeYear: true,
		nextText: '다음 달',
		prevText: '이전 달',
		dateFormat: 'yy-mm-dd',
		dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        minDate: 0
	});
});
</script>