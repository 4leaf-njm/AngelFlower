<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
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
	<img src="${pageContext.request.contextPath }/resources/upload/product/${prod.image}" alt="${prod.name }" class="img_prod"/>
	<div class="infoTable">
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
		
		<form method="post" name="frm_prod">
			<input type="hidden" name="prodNo" value="${prod.prodNo }" />
			<input type="hidden" name="memId" value="${sessionScope.loginUser.id }" />
			<input type="hidden" name="quantity" />
			<input type="hidden" name="menu" value="${m}" />
		</form>
		
		<div class="btn_box">
			<a href="javascript:go_order()" class="buy">바로구매</a>
			<a href="javascript:go_addCart()" class="cart">장바구니</a>
			<a href="javascript:go_addWish()" class="zim">찜하기</a>
			<p><a href="javascript:go_prodList('${m}', '${cri.page}', '${sort}')" class="back">목록</a></p>
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
				<img src="${pageContext.request.contextPath }/resources/upload/product/${prod.image}" alt="${prod.name}" width="160" height="220"/>
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
				var page = '${cri.page}';
				var sort = '${sort}';
				location.href='<c:url value="detail.do?menu=${m}&sort=' + sort + '&page=' + page + '&no=' + prodNo + '"/>';
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
			<li style="width: 549px;">구매후기</li>
			<li style="width: 114px;">작성자</li>
			<li style="width: 31px;">일자</li>
		</ul>
		<c:choose>
		<c:when test="${empty comList}">
		<div class="empty">
			<p>작성된 상품후기가 없습니다.</p>
		</div>
		</c:when>
		<c:otherwise>
		<c:forEach var="com" items="${comList}">
		<div class="rev">
			<img src="${pageContext.request.contextPath }/resources/upload/review/${com.comImage}" />
			<div>
				<div class="top">
					<p style="width: 105px; margin: 0 30px 0 36px; text-align: center;">
						<c:forEach begin="1" end="${com.comStar}">
						<img src="${pageContext.request.contextPath }/resources/images/icon/ico_star.gif" />
						</c:forEach>
					</p>
					<p style="width: 552px; line-height: 170%;">${com.comContent}</p>
					<p style="width: 101px;">${com.memId}</p>
					<p style="width: 79px;"><fmt:formatDate value="${com.comRegdate}" pattern="yyyy-MM-dd"/></p>
				</div>
				<div class="bottom">
					<p><img src="${pageContext.request.contextPath }/resources/images/icon/ico_reply.gif" />${com.comReply}</p>
				</div>
			</div>
		</div>
		</c:forEach>
		</c:otherwise>
		</c:choose>
		<form action="review_reg.do" method="post" name="frm_rev" enctype="multipart/form-data">
			<div class="reg">
				<input type="hidden" name="memId" value="${sessionScope.loginUser.id}" />
				<input type="hidden" name="comStar" value="2" />
				<input type="hidden" name="type" value="2" />
				<input type="hidden" name="category" value="${m}" />
				<input type="hidden" name="prodNo" value="${prod.prodNo}" />
				<div>
					<img src="${pageContext.request.contextPath }/resources/images/item/default.jpg" id="rev_image"/>
					<label for="mfile">등록</label>
					<input type="file" id="mfile" name="mfile" value="파일 첨부" onchange="javascript:readURL(this, '#rev_image');">
				</div>
				<p style="width: 105px; margin: 0 30px 0 34px; text-align: center;" id="star">
				<c:forEach begin="1" end="5" varStatus="status">
					<span id="star${status.count}" class="on"><i class="fa fa-star" data-idx="${status.count}"></i></span>
				</c:forEach>
				</p>
				<p style="width: 552px; line-height: 170%;">
					<textarea rows="6" cols="20" name="comContent"></textarea>
				</p>
				<p style="width: 101px;">
				<c:choose>
				<c:when test="${sessionScope.loginUser.id eq null}">비회원</c:when>
				<c:otherwise>${sessionScope.loginUser.id}</c:otherwise>
				</c:choose>
				</p>
				<p style="width: 79px;"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/></p>
			</div>
		</form>
	</div>
	<div class="btn_box" style="text-align: center;">
		<a href="javascript:review_reg()" class="btn_reg" id="btnReg">후기 작성</a>
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

<script src="${pageContext.request.contextPath }/resources/js/product.js"></script>
<c:if test="${param.direct eq 'y'}">
<script>
	alert('장바구니에 담겨 있는 상품도 함께 주문됩니다.\n원치 않으실 경우 장바구니를 비워주세요.');
	location.href = getContextPath() + "/order/order.do";
</script>
</c:if>
<script>
	$('#btnReg').click(function(){
		var text = $(this).text();
		if(text == '후기 작성') {
			$('.tap1 .reg').show();
			$(this).text('후기 등록');
		} else {
			var frm = document.frm_rev;
			if(frm.comContent.value == '') {
				alert('후기 내용을 입력해주세요.');
				frm.comContent.focus();
				return;
			}
			var comstar = $('#star span.on').length;
			frm.comStar.value = comstar;
			frm.submit();
		}
	});
	$('#star span').click(function(){
		var idx = $(this).find('.fa').data('idx');
		for(var i=1; i<=5; i++) {
			if(i <= idx) {
				$('#star'+i).html('<i class="fa fa-star" data-idx="' + i + '"></i>');
				$('#star'+i).addClass('on');
			}
			else {
				$('#star'+i).html('<i class="fa fa-star-o" data-idx="' + i + '"></i>');
				$('#star'+i).removeClass('on');
			} 
		}
	});
</script>