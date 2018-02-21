<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<!-- footer (S) -->
	<footer>
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
				<!--
				<div class="revi">
					<h3><img src="${pageContext.request.contextPath }/resources/images/text/txt_review.png" alt="후기 게시판" width="100" height="40"/></h3>
					<p><a href="#"><img src="${pageContext.request.contextPath }/resources/images/text/txt_more.png" alt="더보기" width="66" height="32"/></a></p>
					<ul>
						<li><a href="#">엔젤플라워 배송후기 이벤트</a><span>2016-09-23</span></li>
						<li><a href="#">해외결제서비스 Paypal 이용안내</a><span>2012-03-12</span></li>
						<li><a href="#">11월 부분 무이자 할부이벤트를 제공합니다.</a><span> 2017-11-01</span></li>
						<li><a href="#">10월 부분 무이자 할부이벤트를 제공합니다.</a><span>2017-10-12</span></li>
					</ul>
				</div> 
				-->
				<div class="notice">
					<h3><img src="${pageContext.request.contextPath }/resources/images/text/txt_notice.png" alt="공지사항" width="90" height="40"/></h3>
					<!-- <p><a href="#"><img src="${pageContext.request.contextPath }/resources/images/text/txt_more.png" alt="더보기" width="66" height="32"/></a></p> -->
					<ul>
						<li><a href="#">엔젤플라워 배송후기 이벤트</a><span>2016-09-23</span></li>
						<li><a href="#">해외결제서비스 Paypal 이용안내</a><span>2012-03-12</span></li>
						<li><a href="#">11월 부분 무이자 할부이벤트를 제공합니다.</a><span> 2017-11-01</span></li>
						<li><a href="#">10월 부분 무이자 할부이벤트를 제공합니다.</a><span>2017-10-12</span></li>
						<li><a href="#">엔젤플라워 배송후기 이벤트</a><span>2016-09-23</span></li>
						<li><a href="#">해외결제서비스 Paypal 이용안내</a><span>2012-03-12</span></li>
						<li><a href="#">11월 부분 무이자 할부이벤트를 제공합니다.</a><span> 2017-11-01</span></li>
						<li><a href="#">10월 부분 무이자 할부이벤트를 제공합니다.</a><span>2017-10-12</span></li>
						<li><a href="#">엔젤플라워 배송후기 이벤트</a><span>2016-09-23</span></li>
						<li><a href="#">해외결제서비스 Paypal 이용안내</a><span>2012-03-12</span></li>
					</ul>
				</div>
			</div>
			<img src="${pageContext.request.contextPath }/resources/images/img/img_sub.jpg" width="311" height="323"/>
		</div>
		<div id="footer">
			<div>
				<ul>
					<li><a href='<c:url value="/etc/company.do" />'>회사소개</a></li>
					<li><a href='<c:url value="/etc/agreement.do" />'>이용약관</a></li>
					<li><a href='<c:url value="/etc/policy.do" />'><b>개인정보처리방침</b></a></li>
					<li><a href='<c:url value="/etc/location.do" />'>오시는길</a></li>
					<li><a href="javascript:go_email()">이메일무단수집거부</a></li>
					<li><a href="javascript:go_raw()">이미지책임법적고지</a></li>
				</ul>
				<script>
					function go_email() {
						window.open($('#ctx').text() + "/etc/email.do", "이메일무단수집거부", "width=490, height=400, toolbar=no, menubar=no, scrollbar=yes, resizable=yes" );
					}
					function go_raw() {
						window.open($('#ctx').text() + "/etc/raw.do", "이미지책임법적고지", "width=490, height=260, toolbar=no, menubar=no, scrollbar=yes, resizable=yes" );
					}
				</script>
			</div>
			<address class="clear">
				법인명 : (주)엔젤플라워 | 대표이사 : OOO <br />
				사업장 소재지 : 서울시 서초구 방배중앙로 31(방배동 977-19) 지호2빌딩 2층 엔젤플라워 <br />
				사업자등록번호 : 264-81-07135 | <b>사업자정보확인</b> | 통신판매업신고 : 제2013-서울서초-0521호 | 개인정보보호책임자 : OOO <br />
				고객센터 : 1544-1141 | 팩스 : 02-583-2008 | E-mail : OOOO@domain.com | Hosting by (주)코리아센터닷컴  
			</address>
		</div>
	</footer>
	<!-- footer (E) -->
</div>
<!-- wrapper (E) -->
</body>
</html>