<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/admin/include/header.jsp" %>

<!-- container (S) -->
<div id="container">
	<div class="content">
		<table class="tbl01">
			<tr class="title">
				<th colspan="7">발주현황</th>
			</tr>
			<tr class="title2">
				<th>발주 신청건수</th>
				<th>총 발주금</th>
				<th>총 가진금액</th>
				<th>발주 받은건수</th>
				<th>총 받은금액</th>
				<th>총 정산금액</th>
			</tr>
			<tr>
				<td><span>${sendCount }</span>건</td>
				<td><span><fmt:formatNumber value="${totalSendMoney }" type="currency" /></span></td>
				<td><span><fmt:formatNumber value="${sendMoney}" type="currency" /></span></td>
				<td><span>${recCount }</span>건</td>
				<td><span><fmt:formatNumber value="${totalRecMoney }" type="currency" /></span></td>
				<td><span><fmt:formatNumber value="${totalBaljuMoney }" type="currency" /></span></td>
			</tr>
		</table>
		
		<div>
			<h3 class="title" style="float: left;"><i class="fa fa-angle-right" aria-hidden="true"></i>정산내역</h3>
			<select name="year" id="year" style="float: right; height: 30px; margin: 10px 0 0; font-size: 13px;"></select>		
		</div>
		<table class="tbl02">
			<tr>
				<th>월</th>
				<th>발주 신청건수</th>
				<th>총 발주금</th>
				<th>총 가진금액</th>
				<th>발주 받은건수</th>
				<th>총 받은금액</th>
				<th>총 정산금액</th>
				<th style="width: 130px;">상세내역</th>
			</tr>
			
			<c:choose>
			<c:when test="${empty payList}">
			<tr class="empty">
				<td colspan="8">정산할 내역이 없습니다.</td>
			</tr>
			</c:when>
			<c:otherwise>
			<c:forEach var="pay" items="${payList }" varStatus="status">
			<tr>
				<td><fmt:formatNumber value="${status.count}" pattern="00" /> 월</td>
				<td>${pay.sendCount } 건</td>
				<td><fmt:formatNumber value="${pay.totalSendMoney }" pattern="#,##0" /> 원</td>
				<td><fmt:formatNumber value="${pay.sendMoney }" pattern="#,##0" /> 원</td>
				<td>${pay.recCount } 건</td>
				<td><fmt:formatNumber value="${pay.totalRecMoney }" pattern="#,##0" /> 원</td>
				<td><fmt:formatNumber value="${pay.totalBaljuMoney }" pattern="#,##0" /> 원</td>
				<td><a href="javascript:go_detailBalju('${status.count}')" class="btn btn01">보기</a></td>
			</tr>
			</c:forEach>
			</c:otherwise>
			</c:choose>
		</table>
	</div>
	
	<div id="payDialog" class="regmodal" title="발주 목록">
		<table></table>
		
		<ul class="paging"></ul>
	</div>
	
	<%@ include file="/WEB-INF/views/admin/include/sidebar5.jsp" %>
</div>
<!-- container (E) -->
<script>
	if('${msg}' != '')
		alert('${msg}');
</script>
<script>
	$('#payDialog').dialog({
		autoOpen: false,
		width: 1020,
		modal: false,
	});
	
	var year = '';
	var month = '';
	function go_detailBalju(m) {
		year = $('#year option:selected').val();
		month = m;
		
		ajaxBaljuDetailList(year, month);
		
		$('#payDialog').dialog('open');
	}
	$('.btn_search').click(function(event) {
		event.preventDefault();
		
		ajaxBaljuDetailList(year, month);
	});
	
	function ajaxBaljuDetailList(year, month, page) {
		 $.ajax({
			type: 'post',
			url: 'ajaxBaljuDetailList.do',
			dataType: 'json',
			data: {'page': page, 'year': year, 'month': month},
			success: function(data) {
				var html = '';
				
				html += '<tr><th>발주일자</th><th>고객명</th><th>발주자</th><th>발주금</th><th>가진금액</th><th>받는자</th><th>받은금액</th></tr>';
				$.each(data.payList, function(index, value) {
					var date = new Date(value.baljuDate);
					var m = (date.getMonth()+1+'').length == 1 ? ('0' + (date.getMonth()+1)) : (date.getMonth()+1);
					var d = (date.getDate()+'').length == 1 ? ('0' + date.getDate()) : date.getDate();
					var baljuDate = date.getFullYear() + '-' + m + '-' + d;
					html += '<tr>';
					html += '<td>' + baljuDate + '</td>';
					html += '<td>' + value.baljuMemName + '</td>';
					html += '<td>' + value.baljuSendName + '(' + value.baljuSendCompany + ')</td>';
					html += '<td>' + comma(value.baljuPrice) + ' 원</td>';
					html += '<td>' + comma(value.baljuSendPrice) + ' 원</td>';
					html += '<td>' + value.baljuRecName + '(' + value.baljuRecCompany + ')</td>';
					html += '<td>' + comma(value.baljuRecPrice) + ' 원</td>';
					html += '</tr>';
				});
				
				$('#payDialog table').html(html);
				html = '';
				
				var pageMaker = data.pageMaker;
				
				if(pageMaker.prev)
					html += '<li><a href="javascript:ajaxBaljuDetailList(\'' + year + '\', \'' + month + '\', ' + (pageMaker.startPage-1) + ')">&laquo;</a></li>'
				for(var idx=pageMaker.startPage; idx<=pageMaker.endPage; idx++) {
					html += '<li ' + (pageMaker.cri.page == idx ? 'class=on' : '') + '>';
					html += '<a href="javascript:ajaxBaljuDetailList(\'' + year + '\', \'' + month + '\', ' + idx + ')">' + idx + '</a></li>';
				}	
				if(pageMaker.next && pageMaker.endPage > 0) 
					html += '<li><a href="javascript:ajaxBaljuDetailList(\'' + year + '\', \'' + month + '\', ' + (pageMaker.endPage + 1) + ')">&raquo;</a></li>';
				
				$('#payDialog .paging').html(html);
			},
			error: function() {
				alert('error');
			}
		}); 
	}

	var now = new Date();
	var html = '';
	var param = '${param.y}';
	for(var i=2018; i<=now.getFullYear(); i++) {
		html += '<option value="' + i + '" ' + ((i == param) ? 'selected="selected"' : '') + '>' + i + '년</option>';
	}
	$('#year').html(html);
	$('#year').change(function(){
		var year = $('#year option:selected').val();
		location.href = "bjsale.do?m=${m}&s=${s}&year=" + year;
	});
	
</script>