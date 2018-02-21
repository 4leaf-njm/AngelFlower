<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="lnb">
	<h2>홈피관리</h2>
	<ul>
		<li><a href="notice.do?m=${m}&s=1">공지사항 등록
			<i class="fa fa-caret-right" aria-hidden="true"></i>
		</a></li>
		<li><a href="account.do?m=${m}&s=2">계좌 등록
			<i class="fa fa-caret-right" aria-hidden="true"></i>
		</a></li>
		<li><a href="banner.do?m=${m}&s=3">이벤트배너 등록
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