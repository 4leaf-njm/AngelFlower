<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
	<title>근조화환 | 엔젤 플라워</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/product/product.css" />
</head>

<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!-- container (S) -->
<div id="container">
	<hr class="line01" />
	
	<div class="title">
		<h3>${prod.name }</h3>
		<p>
			<span class="lbl lbl02">전국배송</span>
			<span class="lbl lbl01">적립금</span>
		</p>
	</div>
	<img src="${pageContext.request.contextPath }/resources/images/item/${prod.image}" alt="${prod.name }" class="img_prod"/>
	<div class="info">
		<table class="detail">
			<tr>
				<th>판매가격</th>
				<td colspan="3"><span class="del"><b class="price1"><fmt:formatNumber value="${prod.price1}" pattern="#,##0" /></b>원</span></td>
			</tr>
			<tr>
				<th>회원할인가</th>
				<td colspan="3" class="price"><b class="price2"><fmt:formatNumber value="${prod.price2}" pattern="#,##0" /></b>원</td>
			</tr>
			<tr>
				<th>품명</th>
				<td>${menu}</td>
				<th>적립금</th>
				<td><fmt:formatNumber value="${prod.save}" pattern="#,##0" /></td>
			</tr>
			<tr>
				<th>제조원</th>
				<td>엔젤플라워</td>
				<th>배송비</th>
				<td>무료</td>
			</tr>
			<tr>
				<th>주문수량</th>
				<td colspan="3" class="number">
					<div>1</div>
					<span>
						<a href="javascript:quantity(1)"><img src="${pageContext.request.contextPath }/resources/images/bullet/bu_arrow_top_02.gif" alt="수량 증가"/></a>
						<a href="javascript:quantity(-1)"><img src="${pageContext.request.contextPath }/resources/images/bullet/bu_arrow_bottom.gif" alt="수량 감소"/></a>
					</span>
				</td>
			</tr>
			<tr>
				<th>상품정보</th>
				<td colspan="3">${prod.info }</td>
			</tr>
		</table>
		<div class="btn_box">
			<a href="#" class="buy">바로구매</a>
			<a href="#" class="cart">장바구니</a>
			<a href="#" class="zim">찜하기</a>
			<p><a href="#" class="ad">광고</a></p>
		</div>
		
		<script>
			var num = 1;
			function quantity(n) {
				if(num == 1 && n == -1) {
					alert('해당 상품은 최소 구매수량이 1개입니다.');
					return;
				}
				var price1 = '${prod.price1}';
				var price2 = '${prod.price2}';
				
				num = num + n;
				
				$('.number > div').text(num);
				$('.price1').text(comma(price1 * num));
				$('.price2').text(comma(price2 * num));
			}
		</script>
	</div>
	
	<h2 class="title">연관상품</h2>
	<hr class="line01" />
	
	<div class="rel_prod">
		<ul>
		<c:forEach var="prod" items="${relList}">
			<li data-no="${prod.prodNo }">
				<img src="${pageContext.request.contextPath }/resources/images/item/${prod.image}" alt="${prod.name}" width="160" height="220"/>
				<div>
					<h3>${prod.name}</h3>
					<p class="price">판매가 : <fmt:formatNumber value="${prod.price1}" pattern="#,##0" /> 원</p>
					<p class="sale">회원가 : <strong><fmt:formatNumber value="${prod.price2}" pattern="#,##0" /></strong>원</p>
					<p><span class="lbl lbl01">적립금</span><fmt:formatNumber value="${prod.save}" pattern="#,##0" /></p>
				</div>
			</li>
		</c:forEach>
		</ul>
		<script>
			$('.rel_prod li').click(function(){
				var prodNo = $(this).data('no');
				location.href='<c:url value="detail.do?no=' + prodNo + '"/>';
			})
		
			$('.rel_prod li').hover(function(){
				$(this).find('h3').addClass('on');
			}, function(){
				$(this).find('h3').removeClass('on');
			});
		</script>
	</div>
	
	<ul class="tap">
		<li class="on" data-tap="tap1">상품후기/포토후기</li> 
		<li data-tap="tap2">주문배송정보</li>
		<li data-tap="tap3">교환/환불안내</li>
	</ul>
	
	<div class="tap1">
		<ul>
			<li style="width: 110px;">상품이미지</li>
			<li style="width: 83px;">만족도</li>
			<li style="width: 525px;">구매후기</li>
			<li style="width: 133px;">작성자</li>
			<li style="width: 35px;">일자</li>
		</ul>
		<c:forEach var="com" items="${comList}">
		<div>
			<img src="${pageContext.request.contextPath }/resources/images/item/${com.image}" />
			<div>
				<div class="top">
					<p style="width: 101px; margin: 0 21px 0 40px; text-align: left;">
						<c:forEach begin="1" end="${com.star}">
						<img src="${pageContext.request.contextPath }/resources/images/icon/ico_star.gif" />
						</c:forEach>
					</p>
					<p style="width: 517px; line-height: 170%;">${com.content}</p>
					<p style="width: 101px;">${com.memId}</p>
					<p style="width: 78px;"><fmt:formatDate value="${com.regdate}" pattern="yyyy-MM-dd"/></p>
				</div>
				<div class="bottom">
					<p><img src="${pageContext.request.contextPath }/resources/images/icon/ico_reply.gif" />${com.reply}</p>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>
	
	<ul class="tap">
		<li data-tap="tap1">상품후기/포토후기</li> 
		<li class="on" data-tap="tap2">주문배송정보</li>
		<li data-tap="tap3">교환/환불안내</li>
	</ul>
	
	<div class="tap2">
		<h3>배송정보</h3>
		<ul>
			<li>상품에는 축하카드가 무료로 동봉되오니 5줄 이내로 전하실 메시지와 보내시는분을 주문접수 시 꼭 기재해주세요.</li>
			<li>영업시간 : (월~금) 오전 8시 ~ 오후 10시 / (토요일) 오전 8시 ~ 오후 9시 / (일요일 및 공휴일) 오전 9시 ~ 오후 6시</li>
			<li>전화 주문은 영업시간에만 가능하며, 인터넷 주문은 24시간 가능합니다.</li>
			<li><span>배송료는 무료!!</span> 배송가능 시간은 AM09:00 ~ PM09:00 이며, 전국 어디든지 2~3시간이내 배송가능합니다.<br>단, 도서/산간 지역은 2~3시간 배송이 불가하며, 소정의 배송료가 부과될 수 있습니다.<br>오전 10시 이전 배송은 최소 24시간 이전에 예약을 하셔야 합니다.</li>
			<li>상품은 결제확인 후 배송을 원칙으로 하나, 상점 여건에 따라 주문확인 후 바로 배송이 이뤄질 수 있음으로,<br><span><b>주문취소</b></span>는 <span><b>반드시 전화(☎02-586-1119)로 요청</b></span>하셔야 합니다. (입금확인: AM 09:00 ~ PM 07:00)</li>
			<li>꽃배달서비스의 수요가 급증하는 특별한 행사당일에는 오전/오후로만 배송시간 지정이 가능합니다.</li>
			<li>꽃배달 상품은 최고의 품종을 엄선하여 사랑과 정성을 다하여 제작 배송합니다.</li>
			<li>기타 꽃배달에 관련된 <span>문의사항은 <b>☎02-586-1119</b></span> 로 연락주시면 친절하게 답해드립니다.</li>
		</ul>
	</div>
	
	<ul class="tap">
		<li data-tap="tap1">상품후기/포토후기</li> 
		<li data-tap="tap2">주문배송정보</li>
		<li class="on" data-tap="tap3">교환/환불안내</li>
	</ul>
	
	<div class="tap3">
		<h3>교환 / 환불<span>안내</span></h3>
		<div>
			<ol>
				<li>1. 배송상품이 파손되었거나 오염된 경우.</li>
				<li>2. 배송상품이 주문한 내용과 전혀 다른 상품이 배송된 경우.</li>
				<li>3. 주문하신 상품이 품절되었거나 기타 사유 (지역적인 요인)로 인해 배송이 불가능 할 경우</li>
				<li>4. 주문 취소환불 요청 및 변경사항은 반드시 배송시간 3시간 전에 고객센터 <span>(☎02-586-1119)</span> 로 연락 바랍니다.
			</ol>
			<p>취소 환불 불가</p>
			<ul>
				<li>1. (주)엔젤 플라워의 모든 상품은 생화로 제작되며 한번 잘려진 생화는 다시 사용할 수 없습니다. 관엽이나 난인 경우에는 화분에 심으면 다시 뽑아내기가 어려우며 상품이 손상됩니다. 따라서 상품의 특성상 제작이 완료된 상품은 고객님의 변심에 의한 상품 교환 및 취소는 불가능합니다.</li>
				<li>2. 관엽 및 난 등 식물 상품의 경우 배송 완료 후 고객님의 부득이한 사정에 의해 교환/취소 될 경우 배송지역에 따라 왕복 배송료를 부담하셔야 합니다.</li>
			</ul>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/include/quick.jsp" %>
</div>
<!-- container (E) -->

<%@ include file="/WEB-INF/views/include/footer.jsp" %>