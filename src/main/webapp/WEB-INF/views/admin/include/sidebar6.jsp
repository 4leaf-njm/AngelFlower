<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="lnb">
	<h2>후기관리</h2>
	<ul>
		<li><a href="shiplist.do?m=${m}&s=1">전체 배송후기
			<i class="fa fa-caret-right" aria-hidden="true"></i>
		</a></li>
		<li><a href="shipreg.do?m=${m}&s=2">배송후기 작성
			<i class="fa fa-caret-right" aria-hidden="true"></i>
		</a></li>
		<li><a href="prdlist.do?m=${m}&s=3">전체 상품후기
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