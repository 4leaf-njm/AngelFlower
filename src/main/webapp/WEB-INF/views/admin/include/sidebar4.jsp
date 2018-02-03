<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="lnb">
	<h2>발주관리</h2>
	<ul>
		<li><a href="reclist.do?m=${m}&s=1">받은발주 관리
			<i class="fa fa-caret-right" aria-hidden="true"></i>
		</a></li>
		<li><a href="sendlist.do?m=${m}&s=2">보낸발주 관리
			<i class="fa fa-caret-right" aria-hidden="true"></i>
		</a></li>
		<li><a href="reg.do?m=${m}&s=3">발주 신청
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