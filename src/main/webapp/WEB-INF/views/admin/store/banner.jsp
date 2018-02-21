<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/admin/include/header.jsp" %>

<!-- container (S) -->
<div id="container">
	<div class="content">
		<div class="visual">
			<c:forEach var="banner" items="${bannerList}" varStatus="status">
			<div class="info <c:out value="${status.count eq 1 ? 'on' : ''}" />">
				<img src="${pageContext.request.contextPath }/resources/upload/banner/${banner.bannerImage}"/>
			</div>
			</c:forEach>
			<div class="cate">
				<ul>
					<c:forEach var="banner" items="${bannerList}" varStatus="status">
					<li class="<c:out value="${status.count eq 1 ? 'on' : ''}" />" data-no="${status.index}">
						<a href="#">${banner.bannerTitle}</a>
					</li>
					</c:forEach>
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
		<div class="btn_visual">
			<c:forEach var="banner" items="${bannerList}" varStatus="status">
			<a href="#" class="btn btn01" data-no="${banner.bannerNo}">수정</a>
			</c:forEach>
		</div>
		<div class="mod_box" style="display: none;">
			<form action="modifyBanner.do" method="post" name="frm_banner" enctype="multipart/form-data">
				<input type="hidden" name="bannerNo" />
				<input type="hidden" name="bannerImage" />
				<input type="hidden" name="rank" />
				<input type="hidden" name="m" value="${m}" />
				<input type="hidden" name="m" value="${s}" />
				<div class="mod_visual">
					<div class="info">
						<img src="" alt="" id="visual_image"/>
					</div>
					<div class="file_box">
						<label for="mfile" class="btn_file">이미지 등록 (1000x350권장)</label>
						<input type="file" id="mfile" name="mfile" value="파일 첨부" onchange="javascript:readURL(this, '#visual_image');">
					</div>
					<label class="lbltit">제 목<input type="text" name="bannerTitle" id="bannerTitle"/></label>
				</div>
				<div class="btn_box">
					<a href="javascript:go_modify()" class="btn-big" style="margin: 0 0 20px">수정하기</a>
				</div>
			</form>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/views/admin/include/sidebar7.jsp" %>
</div>
<!-- container (E) -->

<script src="${pageContext.request.contextPath }/resources/js/admin.js"></script>
<script>
	if('${msg}' != '')
		alert('${msg}');
	
	$('.btn_visual .btn').click(function(event){
		event.preventDefault();
		if(!hasRole('RIGHT_STORE_BANNER')) {
			alert('권한이 없습니다.');
			return;
		}
		var frm = document.frm_banner;
		var no = $(this).data('no');
		
		$.ajax({
			type: 'post',
			url: 'ajaxBanner.do',
			data: {'no': no},
			dataType: 'json',
			success: function(data) {
				$('#visual_image').attr('src', $('#ctx').text() + '/resources/upload/banner/' + data.bannerImage);
				$('#bannerTitle').val(data.bannerTitle);
				$('.mod_box').show();
				frm.bannerNo.value = no;
				frm.bannerImage.value = data.bannerImage;
				frm.rank.value = no;
			},
			error: function() {
				alert('error');
			}
		});
	});
	
	function go_modify() {
		if($('#bannerTitle').val() == '') {
			alert('제목을 입력해주세요.');
			$('#bannerTitle').focus();
			return;
		}
		var result = confirm('수정하시겠습니까 ?');
		if(result) 
			document.frm_banner.submit();
	}
</script>