<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/admin/include/header.jsp" %>

<!-- container (S) -->
<div id="container">
	<div class="content">
		<table class="tbl01">
			<tr class="title">
				<th colspan="5">회원현황</th>
			</tr>
			<tr class="title2">
				<th>일반회원 수</th>
				<th>기업회원 수</th>
				<th>총 주문 건수</th>
				<th>총 발주 건수</th>
				<th>총 탈퇴 회원수</th>
			</tr>
			<tr>
				<td><span>${memCount}</span>명</td>
				<td><span>${adminCount}</span>명</td>
				<td><span>${orderCount}</span>건</td>
				<td><span>${totalBaljuCount}</span>건</td>
				<td><span>${leaveCount}</span>명</td>
			</tr>
		</table>
		
		<h3 class="title"><i class="fa fa-angle-right" aria-hidden="true"></i>일반 회원</h3>
		<table class="tbl02" id="ajaxMember"></table>
		
		<ul class="paging" id="memberPaging"></ul>
		
		<h3 class="title"><i class="fa fa-angle-right" aria-hidden="true"></i>기업 회원</h3>
		<table class="tbl02" id="ajaxAdmin"></table>
		
		<ul class="paging" id="adminPaging"></ul>
	</div>
	
	<%@ include file="/WEB-INF/views/admin/include/sidebar1.jsp" %>
	
	<div id="dialog" class="regmodal" title="권한 목록">
		<table style="margin-top: 12px; border-top: 2px solid #959393;"></table>
		<ul class="paging"></ul>
	</div>
</div>
<!-- container (E) -->
<script src="${pageContext.request.contextPath }/resources/js/admin.js"></script>
<script>
	ajaxMemberPaging(1);
	ajaxAdminPaging(1);
	
	$('#dialog').dialog({
		autoOpen: false,
		width: 450,
		modal: false,
	});
	
	function go_authDialog(id, page){
		if(hasRole('RIGHT_MB_AUTH_GIVE') == false) {
			alert('권한이 없습니다.');
			return;
		}
		$.ajax({
			type: 'post',
			url: 'ajaxRoleList.do',
			dataType: 'json',
			success: function(data) {
				var html = '';
				html += '<tr><th style="width:100px;">번호</th><th>권한명</th><th style="width:100px;">비고</th>';
				$.each(data, function(index, value) {
					html += '<tr data-no=' + value.roleNo + ' data-name=' + value.roleName + '>';
					html += '<td>' + (index+1) + '</td>';
					html += '<td>' + value.roleName + '</td>';
					html += '<td><a href="#" class="btn btn01 btn_sel">선택</a></td>';
					html += '</tr>';
				});
				$('#dialog table').html(html);
				$('#dialog').dialog('open');
				auth_click(id, page);
			},
			error: function() {
				alert('error');
			}
		});
	}
	
	function auth_click(id, page) {
		$('.btn_sel').click(function(event){
			event.preventDefault();
			var no = $(this).parents('tr').data('no');
			var name = $(this).parents('tr').data('name');
			var result = confirm('[' + name + '] 권한을 부여하시겠습니까 ?');
			if(result) {
				$.ajax({
					type: 'post',
					url: 'giveAdminRole.do',
					data: {'id': id, 'no': no},
					success: function() {
						ajaxAdminPaging(page);
						$('#dialog').dialog('close');
					},
					error: function() {
						alert('error');
					}
				});
			}
		});
	}
</script>
