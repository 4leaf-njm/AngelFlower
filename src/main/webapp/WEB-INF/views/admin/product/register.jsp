<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/admin/include/header.jsp" %>

<!-- container (S) -->
<div id="container">
	<div class="content">
		<h3 class="title"><i class="fa fa-angle-right" aria-hidden="true"></i>상품 등록</h3>
		<form method="post" enctype="multipart/form-data" name="frm_reg">
			<table class="tbl03">
				<tr>
					<th colspan="2">표시 설정</th>
				</tr>
				<tr>
					<th>판매상태</th>
					<td>
						<label class="lblradio"><span></span><input type="radio" name="useyn" value="y" class="radio"/>판매함</label>
						<label class="lblradio on"><span></span><input type="radio" name="useyn" value="n" class="radio" checked="checked"/>판매안함</label>
					</td>
				</tr>
				<tr>
					<th>상품분류 선택</th>
					<td>
						<div>
							<label class="lblradio on"><span></span><input type="radio" name="category" value="1" class="radio ca" checked="checked"/>근조화환</label>
							<label class="lblradio"><span></span><input type="radio" name="category" value="2" class="radio ca"/>근조바구니</label>
							<label class="lblradio"><span></span><input type="radio" name="category" value="3" class="radio ca"/>축하화환</label>
							<label class="lblradio"><span></span><input type="radio" name="category" value="4" class="radio ca"/>꽃다발</label>
						</div>
						<div>
							<label class="lblradio"><span></span><input type="radio" name="category" value="5" class="radio ca"/>꽃바구니</label>
							<label class="lblradio"><span></span><input type="radio" name="category" value="6" class="radio ca"/>동·서양란</label>
							<label class="lblradio"><span></span><input type="radio" name="category" value="7" class="radio ca"/>★ 플라워</label>
						</div>
					</td>
				</tr>
				<tr>
					<th>베스트 상품 진열<span>분류별 최대 6개</span></th>
					<td>
						<label class="lblradio"><span></span><input type="radio" name="bestyn" value="y" class="radio" id="bestYes"/>진열함</label>
						<label class="lblradio on"><span></span><input type="radio" name="bestyn" value="n" class="radio" checked="checked" id="bestNo"/>진열안함</label>
					</td>
				</tr>
			</table>
		
			<table class="tbl03">
				<tr>
					<th colspan="2">기본 정보</th>
				</tr>
				<tr>
					<th>상품명</th>
					<td><input type="text" name="name" class="input02" /></td>
				</tr>
				<tr>
					<th>상품 간략설명</th>
					<td><input type="text" name="info" class="input02" /></td>
				</tr>
				<tr>
					<th>이미지 등록</th>
					<td>
						<div class="image">
							<img src="${pageContext.request.contextPath }/resources/images/item/default.jpg" id="prod_image" alt='' /> 
						</div>
						<div class="file_box">
							<label for="mfile" class="btn btn02">이미지 등록</label>
							<input type="file" id="mfile" name="mfile" value="파일 첨부" onchange="javascript:readURL(this, '#prod_image');">
						</div> 
					</td>
				</tr>
			</table>
			
			<table class="tbl03">
				<tr>
					<th colspan="2">판매 정보</th>
				</tr>
				<tr>
					<th>원가</th>
					<td><input type="text" name="realPrice" class="input01"/> 원</td>
				</tr>
				<tr>
					<th>판매가 계산</th>
					<td>
						<table class="inner">
							<tr>
								<th>마진율</th>
								<th>추가금액</th>
								<th>판매가적용</th>
							</tr>
							<tr>
								<td><input type="text" name="margin" class="input03"/> %</td>
								<td><input type="text" name="over" class="input03" value="0"/> 원</td>
								<td><a href="javascript:getPrice1()" class="btn btn02">판매가적용</a></td>
							</tr>
						</table>
						<p>- 판매가 계산방식은 [원가 + (원가 * 마진율) + 추가금액] 입니다.</p>
						<p>- [판매가적용] 버튼을 누르면 하단 [판매가] 정보에 판매가가 자동계산되어 적용됩니다.</p>
					</td>
				</tr>
				<tr>
					<th>판매가</th>
					<td>
						<table class="inner" style="width: 194px;">
							<tr>
								<th>판매가</th>
							</tr>
							<tr>
								<td><input type="text" name="price1" readonly="readonly" class="input03" /> 원</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<th>회원가</th>
					<td>
						<table class="inner">
							<tr>
								<th>회원가</th>
								<th style="width:260px;">할인율</th>
								<th>회원가적용</th>
							</tr>
							<tr>
								<td><input type="text" name="price2" class="input03" readonly="readonly"/> 원</td>
								<td style="text-align: left;">
									<div>
										<label><input type="radio" name="radioPrice2" value="1" checked="checked" class="radioSel"/>
										판매가의<input type="text" name="percentPrice2" class="input03 disable" value="0"/>% 할인</label>
									</div>
									<div>
										<label><input type="radio" name="radioPrice2" value="2" class="radioSel"/>직접입력
											<input type="text" name="myPrice2" class="input03 disable" disabled="disabled"/> 원</label>
									</div>
								</td>
								<td><a href="javascript:getPrice2()" class="btn btn02">회원가적용</a></td>
							</tr>
						</table>
						<p>- 회원가 계산방식은 [판매가 - (판매가 * 할인율)] 입니다.</p>
						<p>- 직접입력을 하시면 회원가를 원하는 가격으로 설정할 수 있습니다.</p>
						<p>- [회원가적용] 버튼을 누르면 회원가가 자동계산되어 적용됩니다.</p>
					</td>
				</tr>
				<tr>
					<th>적립금</th>
					<td>
						<table class="inner">
							<tr>
								<th>적립금</th>
								<th style="width:260px;">적립율</th>
								<th>적립금적용</th>
							</tr>
							<tr>
								<td><input type="text" name="save" class="input03" readonly="readonly"/> 원</td>
								<td style="text-align: left;">
									<div>
										<label><input type="radio" name="radioSave" value="1" checked="checked" class="radioSel"/>회원가의 
											<input type="text" name="percentSave" class="input03 disable" value="0"/> % 적립</label>
									</div>
									<div>
										<label><input type="radio" name="radioSave" value="2" class="radioSel"/>직접입력
											<input type="text" name="mySave" class="input03 disable" disabled="disabled" class="radioSel"/> 원</label>
									</div>
								</td>
								<td><a href="javascript:getSave()" class="btn btn02">적립금적용</a></td>
							</tr>
						</table>
						<p>- 적립금 계산방식은 [회원가 * 적립율] 입니다.</p>
						<p>- 직접입력을 하시면 적립금을 원하는 가격으로 설정할 수 있습니다.</p>
						<p>- [적립금적용] 버튼을 누르면 적립금이 자동계산되어 적용됩니다.</p>
					</td>
				</tr>
			</table>
			<div class="btn_box">
				<a href="javascript:go_addProduct()" class="btn btn03">상품 등록</a>
			</div>
		</form>
	</div>
	<script>
		$('.tbl03 td .lblradio').click(function(){
			$(this).parents('td').find('.lblradio').removeClass('on');
			$(this).addClass('on');
		});
		
		$('.radioSel').click(function(){
			$(this).parents('td').find('.disable').prop('disabled', true);
			$(this).parent('label').find('.disable').prop('disabled', false);
		});
		
		$('.radio.ca').click(function(){
			$('#bestYes').parent('.lblradio').removeClass('on');
			$('#bestNo').parent('.lblradio').addClass('on');
			$('#bestNo').prop('checked', true);
		});
		
		$('#bestYes').click(function(){
			var category = document.frm_reg.category.value;
			
			$.ajax({
				type: 'post',
				url: 'ajaxBestCount.do',
				dataType: 'json',
				data: {'category': category},
				success: function(data) {
					if(data.count > 6) {
						alert('[' + data.category + '] 은(는) 베스트 상품수가 6개 최대치입니다.')
						$('#bestYes').parent('.lblradio').removeClass('on');
						$('#bestNo').parent('.lblradio').addClass('on');
						$('#bestNo').prop('checked', true);
					}
				},
				error: function(){ 
					alert('error');
				}
			});
		});
	</script>
	<%@ include file="/WEB-INF/views/admin/include/sidebar2.jsp" %>
</div>
<!-- container (E) -->
<script src="${pageContext.request.contextPath }/resources/js/admin.js"></script>