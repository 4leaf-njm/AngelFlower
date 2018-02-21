<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="lnb">
	<h2>정산관리</h2>
	<ul>
		<li><a href="bjsale.do?m=${m}&s=1&y=<fmt:formatDate value="${now}" pattern="yyyy"/>">발주 정산
			<i class="fa fa-caret-right" aria-hidden="true"></i>
		</a></li>
		<li><a href="totsale.do?m=${m}&s=2&y=<fmt:formatDate value="${now}" pattern="yyyy"/>">총 매출 정산
			<i class="fa fa-caret-right" aria-hidden="true"></i>
		</a></li>
		<li><a href="totbj.do?m=${m}&s=3">총 발주 현황
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