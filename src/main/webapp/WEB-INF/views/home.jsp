<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인  | 엔젤 플라워</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/commons/default.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/commons/layout.css" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
<!-- wrapper (S) -->
<div id="wrapper">
	<!-- header (S) -->
	<div id="header">
		<div class="util">
			<div>
				<ul class="util_left">
					<li><a href="#">즐겨찾기</a></li>
					<li><a href="#">바로주문전화 <span>1588-8282</span></a></li>
				</ul>
				<ul class="util_right">
					<li><a href="#">로그인</a></li>
					<li><a href="#">회원가입</a></li>
					<li><a href="#">주문내역조회</a></li>
					<li><a href="#">마이페이지</a></li>
					<li><a href="#">찾아오시는길</a></li>
				</ul>
			</div>
		</div>
		<div class="logo">
			<div>
				<h1><img src="${pageContext.request.contextPath }/resources/images/commons/logo.png" alt="엔젤 플라워" width="290" height="90"/></h1>
				<p><img src="${pageContext.request.contextPath }/resources/images/text/txt_tel_01.png" alt="24시간 전화상담 1588-8282" width="240" height="100"/></p>
				<div>
					<div class="ad">
						<img src="${pageContext.request.contextPath }/resources/images/icon/ico_bump.png" width="60" height="60"/>
						<p><span>전국 전지역 어디나</span>당일 2~3시간 배송</p>
						<div>
							<a href="#"><img src="${pageContext.request.contextPath }/resources/images/bullet/bu_arrow_left.png" alt="이전" /></a>
							<a href="#"><img src="${pageContext.request.contextPath }/resources/images/bullet/bu_arrow_right.png" alt="다음" /></a>
						</div>
					</div>
					<div class="search">
						<p>결혼식화환&nbsp;&nbsp;|&nbsp;&nbsp;경조사화환&nbsp;&nbsp;|&nbsp;&nbsp;프러포즈꽃다발</p>
						<input type="text" name="search" />
						<a href="#">바로검색</a>
					</div>
				</div>
			</div>
		</div>
		<div class="gnb">
			<div>
				<ul>
					<li><a href="#">핫딜상품</a></li>
					<li><a href="#">근조화환</a></li>
					<li><a href="#">축하화환</a></li>
					<li><a href="#">승진&amp;취임</a></li>
					<li><a href="#">개업&amp;이전</a></li>
					<li><a href="#">전체상품</a></li>
					<li><a href="#">입점문의</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- header (E) -->
	
	<!-- container (S) -->
	<div id="container">
		<div class="category">
			<ul>
				<li>
					<img src="${pageContext.request.contextPath }/resources/images/item/sample_01.jpg" alt="추모.근조" width="100" height="160"/>
					<a href="#">추모.근조<span>애도의마음</span></a>
				</li>
				<li>
					<img src="${pageContext.request.contextPath }/resources/images/item/sample_02.jpg" alt="결혼.축하" width="100" height="160"/>
					<a href="#">결혼.축하<span>진심을담은 축하</span></a>
				</li>
				<li>
					<img src="${pageContext.request.contextPath }/resources/images/item/sample_01.jpg" alt="승진&취임" width="100" height="160"/>
					<a href="#">승진&amp;취임<span>축하의 마음</span></a>
				</li>
				<li>
					<img src="${pageContext.request.contextPath }/resources/images/item/sample_02.jpg" alt="개업&이전" width="100" height="160"/>
					<a href="#">개업&amp;이전<span>대박기원</span></a>
				</li>
				<li>
					<img src="${pageContext.request.contextPath }/resources/images/item/sample_01.jpg" alt="전체상품" width="100" height="160"/>
					<a href="#">전체상품<span>핫딜 특가</span></a>
				</li>
			</ul>
		</div>
		
		<div class="visual">
			
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
	
		<div class="sub">
			<div class="account">
				<img src="${pageContext.request.contextPath }/resources/images/text/txt_tel_02.png" alt="24시간 전화 상담 1588-8282" width="350" height="135"/>
				<div class="bank01">
					<div>
						<img src="${pageContext.request.contextPath }/resources/images/text/txt_bank_01.png" alt="KB국민은행" width="120" height="25"/>
						<p>084001-04-164228</p>
					</div>
					<img src="${pageContext.request.contextPath }/resources/images/text/txt_company.png" alt="예금주: 엔젤플라워" width="160" height="40"/>
				</div>
				<div class="bank02">
					<div>
						<img src="${pageContext.request.contextPath }/resources/images/text/txt_bank_02.png" alt="NH농협" width="80" height="15"/>
						<p>355-0022-0126-03</p>
					</div>
					<img src="${pageContext.request.contextPath }/resources/images/text/txt_company.png" alt="예금주: 엔젤플라워" width="160" height="40"/>
				</div>
				<div class="bank03">
					<div>
						<img src="${pageContext.request.contextPath }/resources/images/text/txt_bank_03.png" alt="신한은행" width="90" height="25"/>
						<p>140-009-926859</p>
					</div>
					<img src="${pageContext.request.contextPath }/resources/images/text/txt_company.png" alt="예금주: 엔젤플라워" width="160" height="40"/>
				</div>		
			</div>
			<div class="board">
				<div class="review">
					<h3><img src="${pageContext.request.contextPath }/resources/images/text/txt_review.png" alt="후기 게시판" width="100" height="40"/></h3>
					<p><a href="#"><img src="${pageContext.request.contextPath }/resources/images/text/txt_more.png" alt="더보기" width="66" height="32"/></a></p>
					<ul>
						<li><a href="#">엔젤플라워 배송후기 이벤트</a><span>2016-09-23</span></li>
						<li><a href="#">해외결제서비스 Paypal 이용안내</a><span>2012-03-12</span></li>
						<li><a href="#">11월 부분 무이자 할부이벤트를 제공합니다.</a><span> 2017-11-01</span></li>
						<li><a href="#">10월 부분 무이자 할부이벤트를 제공합니다.</a><span>2017-10-12</span></li>
					</ul>
				</div>
				<div class="notice">
					<h3><img src="${pageContext.request.contextPath }/resources/images/text/txt_notice.png" alt="공지사항" width="90" height="40"/></h3>
					<p><a href="#"><img src="${pageContext.request.contextPath }/resources/images/text/txt_more.png" alt="더보기" width="66" height="32"/></a></p>
					<ul>
						<li><a href="#">엔젤플라워 배송후기 이벤트</a><span>2016-09-23</span></li>
						<li><a href="#">해외결제서비스 Paypal 이용안내</a><span>2012-03-12</span></li>
						<li><a href="#">11월 부분 무이자 할부이벤트를 제공합니다.</a><span> 2017-11-01</span></li>
						<li><a href="#">10월 부분 무이자 할부이벤트를 제공합니다.</a><span>2017-10-12</span></li>
					</ul>
				</div>
			</div>
			<img src="${pageContext.request.contextPath }/resources/images/img/img_sub.jpg" width="311" height="323"/>
		</div>
	
	
	
	
	<!-- 
		<div class="content">
			<div class="visual_area">
				<div class="main_visual">
					<div class="info">
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
					<div class="category_area">
						<ul class="cate">
							<li><a href="#"><span class="tit">카테고리 1</span></a></li>
							<li><a href="#"><span class="tit">카테고리 2</span></a></li>
							<li><a href="#"><span class="tit">카테고리 3</span></a></li>
							<li><a href="#"><span class="tit">카테고리 4</span></a></li>
							<li><a href="#"><span class="tit">카테고리 5</span></a></li>
							<li><a href="#"><span class="tit">카테고리 6</span></a></li>
							<li><a href="#"><span class="tit">카테고리 7</span></a></li>
						</ul>
					</div>
				</div>		
			</div>
		</div>
		 -->
	</div>
	<!-- container (E) -->
	
	<div class="quick">
		<h2>빠른메뉴</h2>
		<div>
			<h3>최근본상품</h3>
			<ul>
				<li>
					<img src="${pageContext.request.contextPath }/resources/images/item/sample_01.jpg" alt="" width="70" height="80"/>
					<p>근조3단</p>
				</li>
				<li>
					<img src="${pageContext.request.contextPath }/resources/images/item/sample_01.jpg" alt="" width="70" height="80"/>
					<p>명품 근조3단</p>
				</li>
				<li>
					<img src="${pageContext.request.contextPath }/resources/images/item/sample_01.jpg" alt="" width="70" height="80"/>
					<p>NEW 근조화환 3단</p>
				</li>
			</ul>
		</div>
		<p class="cart"><a href="#"><img src="${pageContext.request.contextPath }/resources/images/icon/ico_cart.PNG" alt="장바구니" width="129" height="90"/></a></p>
		<p class="top"><a href="#">TOP</a></p>
		
		<script>
			var initPos = parseInt($('.quick').css('top')); 
			var addPos = 80;
			
		    $(window).scroll(function() { 
		            var scrollPos = $(window).scrollTop(); 
		            if(scrollPos <= 200) return;
		            
		            $('.quick').stop().animate({'top': scrollPos + addPos + 'px'},500); 
		    });
		    $('.quick .top a').click(function(){
		    	$('.quick').css('top', initPos + 'px');
		    });
		</script>
	</div>
	
	<!-- footer (S) -->
	<div id="footer">
		<div>
			<ul>
				<li><a href="#">회사소개</a></li>
				<li><a href="#">이용약관</a></li>
				<li><a href="#"><b>개인정보처리방침</b></a></li>
				<li><a href="#">오시는길</a></li>
				<li><a href="#">채용정보</a></li>
				<li><a href="#">제휴문의</a></li>
				<li><a href="#">고객센터</a></li>
				<li><a href="#">회원사 인트라넷</a></li>
			</ul>
			<select name="site_select" onchange="go_site(this)">
				<option value="#">제휴사이트</option>
				<option value="#">사이트명</option>
				<option value="#">사이트명</option>
				<option value="#">사이트명</option>
			</select>
		</div>
		<address class="clear">
			법인명 : (주)엔젤플라워 | 대표이사 : OOO <br />
			사업장 소재지 : 서울시 서초구 방배중앙로 31(방배동 977-19) 지호2빌딩 2층 엔젤플라워 <br />
			사업자등록번호 : 264-81-07135 | <b>사업자정보확인</b> | 통신판매업신고 : 제2013-서울서초-0521호 | 개인정보보호책임자 : OOO <br />
			고객센터 : 1544-1141 | 팩스 : 02-583-2008 | E-mail : OOOO@domain.com | Hosting by (주)코리아센터닷컴  
		</address>
	</div>
	<!-- footer (E) -->
</div>
<!-- wrapper (E) -->

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
	$('.category_area .cate a').hover(function(){
		$(this).addClass('on');
		$(this).closest('div').css('display', 'block');
	}, function(){
		$(this).removeClass('on');
		$(this).parent('div').css('display', 'none');
	});
	
	
</script>
</body>
</html>