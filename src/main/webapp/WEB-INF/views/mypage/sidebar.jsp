<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="lnb">
	<h2>마이페이지</h2>
	<div><span>${memName}</span>님의<p>쇼핑정보입니다.</p></div>
	<ul>
		<li><a href="myorder.do?s=1">주문 조회
			<i class="fa fa-caret-right" aria-hidden="true"></i>
		</a></li>
		<li><a href="myinfo.do?s=2">회원정보 수정
			<i class="fa fa-caret-right" aria-hidden="true"></i>
		</a></li>
		<li><a href="myexit.do?s=3">회원탈퇴
			<i class="fa fa-caret-right" aria-hidden="true"></i>
		</a></li>
	</ul>
	
	<script>
		$('.lnb li').click(function(){
			$('.lnb li').removeClass('active');
			$(this).addClass('active');
		});
		$('.lnb li').hover(function(){
			$(this).addClass('on');
		}, function(){
			$(this).removeClass('on');
		});
		
		var s = '${s}';
		if(!s) {
			$('.lnb li').removeClass('active');
			$('.lnb li').eq(0).addClass('active');
		} else {
			$('.lnb li').removeClass('active');
			$('.lnb li').eq(s-1).addClass('active');					
		}
	</script>
</div>