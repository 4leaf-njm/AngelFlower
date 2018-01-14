<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
	<title>엔젤 플라워</title>
</head>

<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!-- container (S) -->
<div id="container">
	<div class="visual">
		<div class="info on">
			<a href="#">
				<img src="${pageContext.request.contextPath }/resources/images/main/v_img01.jpg" alt="가을시즌"/>
			</a>
		</div>
		<div class="info">
			<a href="#">
				<img src="${pageContext.request.contextPath }/resources/images/main/v_img02.jpg" alt="가을시즌"/>
			</a>
		</div>
		<div class="info">
			<a href="#">
				<img src="${pageContext.request.contextPath }/resources/images/main/v_img03.jpg" alt="가을시즌"/>
			</a>
		</div>
		<div class="info">
			<a href="#">
				<img src="${pageContext.request.contextPath }/resources/images/main/v_img04.jpg" alt="가을시즌"/>
			</a>
		</div>
		<div class="info">
			<a href="#">
				<img src="${pageContext.request.contextPath }/resources/images/main/v_img05.jpg" alt="가을시즌"/>
			</a>
		</div>
		<div class="info">
			<a href="#">
				<img src="${pageContext.request.contextPath }/resources/images/main/v_img06.jpg" alt="가을시즌"/>
			</a>
		</div>
		<div class="info">
			<a href="#">
				<img src="${pageContext.request.contextPath }/resources/images/main/v_img07.jpg" alt="가을시즌"/>
			</a>
		</div>
		<div class="cate">
			<ul>
				<li class="on" data-no="0"><a href="#">겨울시즌</a></li>
				<li data-no="1"><a href="#" >승진/영전 특가</a></li>
				<li data-no="2"><a href="#" >미니블룸</a></li>
				<li data-no="3"><a href="#" >정관장 기획전</a></li>
				<li data-no="4"><a href="#" >오설록 티세트</a></li>
				<li data-no="5"><a href="#" >꽃&amp;선물</a></li>
			</ul>
		</div>
		<script>
			var intervalId = setInterval(move_cate, 2500);
			var select = 0;
			$('.cate li').hover(function(){
				clearInterval(intervalId);
				
				$('.cate li').removeClass('on');
				$(this).addClass('on');
				select = parseInt($(this).data('no'));
			
				$('.info').removeClass('on');
				$('.info').eq(select).addClass('on');
			}, function(){
				intervalId = setInterval(move_cate, 2500);
			});
			
			function move_cate() {
				select = parseInt(select) + 1;
				if(select > 5) select = 0;
				
				$('.cate li').removeClass('on');
				$('.cate li').eq(select).addClass('on');
				
				$('.info').removeClass('on');
				$('.info').eq(select).addClass('on');
			}			
		</script>
	</div>
	
	<div class="item">
		<div class="top">
			<h2>추모 &amp; 근조</h2>
			<span>총 121개의 상품이 검색되었습니다.</span>
			<ul>
				<li class="on"><a href="#">인기순</a></li>
				<li><a href="#">상품후기많은순</a></li>
				<li><a href="#">높은가격순</a></li>
				<li><a href="#">낮은가격순</a></li>
			</ul>
			<table>
			<tr>
				<td rowspan="2" width="350" class="one">
					<img src="${pageContext.request.contextPath }/resources/images/item/sample_01.jpg" alt="특별한 고품격 검정리본 화환" width="210" height="340" />
				<h3>특별한 고품격 [검정리본] 화환</h3>
				<p class="price"><del>150,000</del>145,500 원</p>
				<p class="save"><span>적립금</span>10,500</p>
			</td>
			<td width="400">
				<img src="${pageContext.request.contextPath }/resources/images/item/sample_01.jpg" alt="근조화환 3단" width="150" height="210"/>
				<div>
					<h3>근조화환3단 &lt;애...</h3>
					<p class="price"><del>100,000</del>97,000원</p>
					<p class="save"><span>적립금</span>7,000</p>
				</div>
			</td>
			<td width="400">
				<img src="${pageContext.request.contextPath }/resources/images/item/sample_01.jpg" alt="근조화환 3단" width="150" height="210"/>
				<div>
					<h3>근조화환3단 &lt;애...</h3>
					<p class="price"><del>100,000</del>97,000원</p>
					<p class="save"><span>적립금</span>7,000</p>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<img src="${pageContext.request.contextPath }/resources/images/item/sample_01.jpg" alt="근조화환 3단" width="150" height="210"/>
				<div>
					<h3>근조화환3단 (분...</h3>
					<p class="price"><del>99,000</del>96,000원</p>
					<p class="save"><span>적립금</span>6,900</p>
				</div>
			</td>
			<td>
				<img src="${pageContext.request.contextPath }/resources/images/item/sample_01.jpg" alt="근조화환 3단" width="150" height="210"/>
				<div>
					<h3>근조화환3단 (분...</h3>
					<p class="price"><del>99,000</del>96,000원</p>
					<p class="save"><span>적립금</span>6,900</p>
				</div>
			</td>
		</tr>
		</table>
	</div>
	
	<div class="item_list">
		<ul class="list">
			<li>
				<img src="${pageContext.request.contextPath }/resources/images/item/sample_01.jpg" alt="근조화환 3단" width="150" height="210"/>
				<div>
					<h3>[ST-FB141] 근조3단</h3>
					<p class="price">판매가 : 77,000 원</p>
					<p class="sale">회원가 : <strong>74,700</strong>원</p>
					<p class="save"><span>적립금</span>5,400</p>
				</div>
			</li>
			<li>
				<img src="${pageContext.request.contextPath }/resources/images/item/sample_01.jpg" alt="근조화환 3단" width="150" height="210"/>
				<div>
					<h3>[ST-FB228] 명품 근조3단</h3>
					<p class="price">판매가 : 125,000 원</p>
					<p class="sale">회원가 : <strong>121,300</strong>원</p>
					<p class="save"><span>적립금</span>8,800</p>
				</div>
			</li>
			<li>
				<img src="${pageContext.request.contextPath }/resources/images/item/sample_01.jpg" alt="근조화환 3단" width="150" height="210"/>
				<div>
					<h3>[ST-FB205] NEW 근조화환 3단</h3>
					<p class="price">판매가 : 103,000 원</p>
					<p class="sale">회원가 : <strong>99,900</strong>원</p>
					<p class="save"><span>적립금</span>7,200</p>
				</div>
			</li>
			<li>
				<img src="${pageContext.request.contextPath }/resources/images/item/sample_01.jpg" alt="근조화환 3단" width="150" height="210"/>
				<div>
					<h3>[ST-FB239] 고급 근조 3단 화환</h3>
					<p class="price">판매가 : 130,000 원</p>
					<p class="sale">회원가 : <strong>126,100</strong>원</p>
					<p class="save"><span>적립금</span>9,100</p>
				</div>
			</li>
			<li>
				<img src="${pageContext.request.contextPath }/resources/images/item/sample_01.jpg" alt="근조화환 3단" width="150" height="210"/>
				<div>
					<h3>[ST-FB141] 근조3단</h3>
					<p class="price">판매가 : 77,000 원</p>
					<p class="sale">회원가 : <strong>74,700</strong>원</p>
					<p class="save"><span>적립금</span>5,400</p>
				</div>
			</li>
			<li>
				<img src="${pageContext.request.contextPath }/resources/images/item/sample_01.jpg" alt="근조화환 3단" width="150" height="210"/>
				<div>
					<h3>[ST-FB228] 명품 근조3단</h3>
					<p class="price">판매가 : 125,000 원</p>
					<p class="sale">회원가 : <strong>121,300</strong>원</p>
					<p class="save"><span>적립금</span>8,800</p>
				</div>
			</li>
			<li>
				<img src="${pageContext.request.contextPath }/resources/images/item/sample_01.jpg" alt="근조화환 3단" width="150" height="210"/>
				<div>
					<h3>[ST-FB205] NEW 근조화환 3단</h3>
					<p class="price">판매가 : 103,000 원</p>
					<p class="sale">회원가 : <strong>99,900</strong>원</p>
					<p class="save"><span>적립금</span>7,200</p>
				</div>
			</li>
			<li>
				<img src="${pageContext.request.contextPath }/resources/images/item/sample_01.jpg" alt="근조화환 3단" width="150" height="210"/>
				<div>
					<h3>[ST-FB239] 고급 근조 3단 화환</h3>
					<p class="price">판매가 : 130,000 원</p>
					<p class="sale">회원가 : <strong>126,100</strong>원</p>
					<p class="save"><span>적립금</span>9,100</p>
				</div>
			</li>
		</ul>
		<ul class="paging">
			<li class="on"><a href="#">1</a></li>
			<li><a href="#">2</a></li>
		</ul>
	</div>
</div>
	 
<%@ include file="/WEB-INF/views/include/quick.jsp" %>
</div>
<!-- container (E) -->
	
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<script>
	$('.category_area .cate a').hover(function(){
		$(this).addClass('on');
		$(this).closest('div').css('display', 'block');
	}, function(){
		$(this).removeClass('on');
		$(this).parent('div').css('display', 'none');
	});
</script>