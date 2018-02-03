<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/admin/include/header.jsp" %>

<!-- container (S) -->
<div id="container">
	<div class="content">
		<h3 class="title"><i class="fa fa-angle-right" aria-hidden="true"></i>배송후기 수정</h3>
		<form method="post" name="frm_rev" enctype="multipart/form-data">
			<input type="hidden" name="reviewNo" value="${review.reviewNo }" />
			<table class="tbl04">
				<tr>
					<th>주문자</th>
					<td>
						<input type="text" name="revTitle" class="input01" value="${review.revTitle }" />
					</td>
					<td rowspan="5" style="width: 200px;">
						<div class="image">
							<img src="${pageContext.request.contextPath }/resources/upload/review/${review.revImage}" id="prod_image" alt='' /> 
						</div>
						<div class="file_box">
							<input type="hidden" name="revImage" value="${review.revImage }" />
							<label for="mfile" class="btn btn02">사진 등록</label>
							<input type="file" id="mfile" name="mfile" value="파일 첨부" onchange="javascript:readURL(this, '#prod_image');">
						</div>
					</td>
				</tr>
				<tr>
					<th>배송 상품명</th>
					<td><input type="text" name="revProd" class="input01" value="${review.revProd }" /></td>
				</tr>
				<tr>
					<th>구매 가격</th>
					<td><input type="text" name="revPrice" class="input01" 
					     value="<fmt:formatNumber value="${review.revPrice }" pattern="#,##0" />" /> 원</td>
				</tr>
				<tr>
					<th>분류</th>
					<td>
						<div>
							<label class="lblradio on"><span></span><input type="radio" name="category" value="1" class="radio" 
								<c:if test="${review.category eq 1 }">checked="checked"</c:if>/>근조화환</label>
							<label class="lblradio"><span></span><input type="radio" name="category" value="2" class="radio" 
								<c:if test="${review.category eq 2 }">checked="checked"</c:if>/>근조바구니</label>
							<label class="lblradio"><span></span><input type="radio" name="category" value="3" class="radio" 
								<c:if test="${review.category eq 3 }">checked="checked"</c:if>/>축하화환</label>
							<label class="lblradio"><span></span><input type="radio" name="category" value="4" class="radio" 
								<c:if test="${review.category eq 4 }">checked="checked"</c:if>/>꽃다발</label>
						</div>
						<div>
							<label class="lblradio"><span></span><input type="radio" name="category" value="5" class="radio" 
								<c:if test="${review.category eq 5 }">checked="checked"</c:if>/>꽃바구니</label>
							<label class="lblradio"><span></span><input type="radio" name="category" value="6" class="radio" 
								<c:if test="${review.category eq 6 }">checked="checked"</c:if>/>동·서양란</label>
							<label class="lblradio"><span></span><input type="radio" name="category" value="7" class="radio" 
								<c:if test="${review.category eq 7 }">checked="checked"</c:if>/>★ 플라워</label>
						</div>
					</td>
				</tr>
				<tr>
					<th>배송 지역</th>
					<td>
						<input type="hidden" name="revRegion" />
						<select name="sido" id="sido">
							<option value="">1차 주소</option>
							<c:forEach var="sido" items="${sidoList }">
							<option value="${sido }">${sido }</option>
							</c:forEach>
						</select>
						<select name="gugun" id="gugun">
							<option value="">2차 주소</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>후기 내용</th>
					<td colspan="2"><textarea rows="12" name="revContent">${review.revContent }</textarea></td>
				</tr>
			</table>
		</form>
		
		<div class="btn_box">
			<a href="#" class="btn-big btn04" id="btn_submit">수 정</a>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/views/admin/include/sidebar6.jsp" %>
</div>
<!-- container (E) -->

<script>
	$('.tbl04 td .lblradio').click(function(){
		$(this).parents('td').find('.lblradio').removeClass('on');
		$(this).addClass('on');
	});
	
	function selectGugun(gugun) {
		var val = $('#sido option:selected').val();
		
		if(val != '') {
			$.ajax({
				type: 'post',
				url: 'ajaxGugun.do',
				dataType: 'json',
				data: {'sido': val},
				success: function(data) {
					var html = '';
					html += '<option value="">2차 주소</option>';
					
					$.each(data, function(index, value) {
						if(gugun != value.trim()) 
							html += '<option value="' + value.trim() + '">' + value.trim() + '</option>';
						else
							html += '<option value="' + value.trim() + '" selected="selected">' + value.trim() + '</option>';
					});
					$('#gugun').html(html);
				}, 
				error: function() {
					alert('error');
				}
			});
		}
	}
	$('#sido').change(function(){
		selectGugun();
	})
	
	$('#btn_submit').click(function(event) {
		event.preventDefault();
		var frm = document.frm_rev;
		
		if(frm.revTitle.value == '') {
			alert('주문자를 입력해주세요.');
			return;
		} 
		var addr1 = $('#sido option:selected').val();
		var addr2 = $('#gugun option:selected').val();
		frm.revRegion.value = addr1 + ' ' + addr2;
		frm.revPrice.value = frm.revPrice.value.replace(',', '');
		
		frm.submit();
	});
</script>

<script>
	$('.lblradio').removeClass('on');
	$('.radio:checked').parent('.lblradio').addClass('on');
	
	var region = '${review.revRegion}';
	var regarr = region.split(' ');

	$('#sido').val(regarr[0]);
	selectGugun(regarr[1].trim());
</script>
