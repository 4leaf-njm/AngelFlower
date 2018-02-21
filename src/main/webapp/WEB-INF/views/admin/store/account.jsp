<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/admin/include/header.jsp" %>

<!-- container (S) -->
<div id="container">
	<div class="content">
		<h3 class="title"><i class="fa fa-angle-right" aria-hidden="true"></i>등록 계좌</h3>
		<table class="tbl02">
			<tr>
				<th style="width:100px;">번호</th>
				<th>은행명</th>
				<th>계좌번호</th>
				<th>예금주</th>
				<th style="width:120px;">비고</th>
			</tr>
			<c:choose>
			<c:when test="${empty accountList }">
			<tr class="empty">
				<td colspan="5">등록된 계좌가 없습니다.</td>
			</tr>
			</c:when>
			<c:otherwise>
			<c:forEach var="account" items="${accountList }" varStatus="status">
			<tr>
				<td>${status.count}</td>
				<td>${account.accBank}</td>
				<td>${account.accNumber}</td>
				<td>${account.accName}</td>
				<td>
					<a href="javascript:go_modifyAcc('${account.accNo}')" class="btn btn01">수정</a>
					<a href="javascript:go_removeAcc('${m}', '${s}', '${account.accNo}')" class="btn btn01">삭제</a>
				</td>
			</tr>
			</c:forEach>
			</c:otherwise>
			</c:choose>
		</table>
		<div class="account">
			<form method="post" name="frm_acc">
				<input type="hidden" name="accNo" value="0" />
				<input type="hidden" name="m" value="${m}" />
				<input type="hidden" name="s" value="${s}" />
				<div class="row">
					<div class="tit"><label for="accBank">은행명</label></div>
					<div class="col"><input type="text" name="accBank" id="accBank"/></div>
				</div>
				<div class="row">
					<div class="tit"><label for="accNumber">계좌번호</label></div>
					<div class="col"><input type="text" name="accNumber" id="accNumber"/></div>
				</div>
				<div class="row">
					<div class="tit"><label for="accName">예금주</label></div>
					<div class="col"><input type="text" name="accName" id="accName"/></div>
				</div>
			</form>
		</div>
		<div class="btn_box">
			<a href="javascript:go_account()" class="btn-big btn_acc">계좌 등록</a>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/views/admin/include/sidebar7.jsp" %>
</div>
<!-- container (E) -->

<script src="${pageContext.request.contextPath }/resources/js/admin.js"></script>
<script>
	if('${msg}' != '')
		alert('${msg}');
	
	function go_account() {
		if(!hasRole('RIGHT_STORE_ACCOUNT')) {
			alert('권한이 없습니다.');
			return;
		}
		if($('.account').hasClass('on')) {
			var frm = document.frm_acc;
			if(frm.accBank.value == '') {
				alert('은행명을 입력해주세요.');
				frm.accBank.focus();
				return;
			} else if (frm.accNumber.value == '') {
				alert('계좌번호를 입력해주세요.');
				frm.accNumber.focus();
				return;
			} else if (frm.accName.value == '') {
				alert('예금주를 입력해주세요.');
				frm.accName.focus();
				return;
			}
			if($('.btn_acc').text() == '계좌 등록') {
				var result = confirm('등록하시겠습니까 ?');
				if(result) {
					frm.action = "insertAccount.do";
					frm.submit();
				}
			} else {
				var result = confirm('수정하시겠습니까 ?');
				if(result) {
					frm.action = "modifyAccount.do";
					frm.submit();
				}				
			}
		} else {
			$('.account').addClass('on');
		}
	}
	
	function go_modifyAcc(no) {
		if(!hasRole('RIGHT_STORE_ACCOUNT')) {
			alert('권한이 없습니다.');
			return;
		}
		document.frm_acc.accNo.value = no;
		$.ajax({
			type: 'post',
			url: 'ajaxAccount.do',
			data: {'no': no},
			dataType: 'json',
			success: function(data) {
				$('#accBank').val(data.accBank);
				$('#accNumber').val(data.accNumber);
				$('#accName').val(data.accName);
				$('.btn_acc').text('계좌 수정');
				$('.account').addClass('on');
			},
			error: function() {
				alert('error');
			}
		});
	}
	
	function go_removeAcc(m, s, no) {
		if(!hasRole('RIGHT_STORE_ACCOUNT')) {
			alert('권한이 없습니다.');
			return;
		}
		var result = confirm('삭제하시겠습니까 ?');
		if(result)
			location.href = "removeAccount.do?m=" + m + '&s=' + s + '&no=' + no;
	}
</script>