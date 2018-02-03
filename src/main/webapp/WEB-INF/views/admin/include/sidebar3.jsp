<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="lnb">
	<h2>주문관리</h2>
	<ul>
		<li><a href="list.do?m=${m}&s=1">전체주문 조회
			<i class="fa fa-caret-right" aria-hidden="true"></i>
		</a></li>
		<li><a href="depwait.do?m=${m}&s=2">입금대기 관리
			<i class="fa fa-caret-right" aria-hidden="true"></i>
		</a></li>
		<li><a href="shipwait.do?m=${m}&s=3">배송상태 관리
			<i class="fa fa-caret-right" aria-hidden="true"></i>
		</a></li>
		<li><a href="cancel.do?m=${m}&s=4">주문취소 관리
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