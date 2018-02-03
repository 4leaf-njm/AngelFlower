<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/admin/include/header.jsp" %>

<!-- container (S) -->
<div id="container">
	<div class="content">
		<table class="tbl01">
			<tr class="title">
				<th colspan="7">매출현황</th>
			</tr>
			<tr class="title2">
				<th>주문건</th>
				<th>주문금액</th>
				<th>구매확정건 </th>
				<th>총 매출</th>
			</tr>
			<tr>
				<td><span>${orderCount }</span>건</td>
				<td><span><fmt:formatNumber value="${orderMoney }" type="currency" /></span></td>
				<td><span>${compleCount }</span>건</td>
				<td><span><fmt:formatNumber value="${totalMoney }" type="currency" /></span></td>
			</tr>
		</table>
		
		<div>
			<h3 class="title" style="float: left;"><i class="fa fa-angle-right" aria-hidden="true"></i>정산내역</h3>
			<select name="year" id="year" style="float: right; height: 30px; margin: 10px 0 0; font-size: 13px;"></select>		
		</div>
		<table class="tbl02">
			<tr>
				<th>판매월</th>
				<th>주문건</th>
				<th>주문금액</th>
				<th>구매확정건</th>
				<th>총정산금액</th>
				<th style="width: 130px;">상세내역</th>
			</tr>
			
			<c:choose>
			<c:when test="${empty payList}">
			<tr class="empty">
				<td colspan="6">정산할 내역이 없습니다.</td>
			</tr>
			</c:when>
			<c:otherwise>
			<c:forEach var="pay" items="${payList }" varStatus="status">
			<tr>
				<td><fmt:formatNumber value="${status.count}" pattern="00" /> 월</td>
				<td>${pay.orderCount } 건</td>
				<td><fmt:formatNumber value="${pay.orderMoney }" pattern="#,##0" /> 원</td>
				<td>${pay.compleCount } 건</td>
				<td><fmt:formatNumber value="${pay.totalMoney }" pattern="#,##0" /> 원</td>
				<td><a href="javascript:go_detailPay('${status.count}')" class="btn btn01">보기</a></td>
			</tr>
			</c:forEach>
			</c:otherwise>
			</c:choose>
		</table>
	</div>
	
	<div id="payDialog" class="regmodal" title="주문 목록">
		<div class="search">
			<select name="searchType" id="searchType">
				<option value="name">주문자명</option>
				<option value="no">주문번호</option>
			</select>
			<input type="text" name="keyword" id="keyword" />
			<a href="#" class="btn_search"><i class="fa fa-search" aria-hidden="true"></i></a>
		</div>
		<table></table>
		
		<ul class="paging"></ul>
	</div>
	
	<%@ include file="/WEB-INF/views/admin/include/sidebar5.jsp" %>
</div>
<!-- container (E) -->
<script>
	$('#payDialog').dialog({
		autoOpen: false,
		width: 800,
		modal: false,
	});
	
	var type = '';
	var key = '';
	var year = '';
	var month = '';
	function go_detailPay(m) {
		type = '';
		key = '';
		year = $('#year option:selected').val();
		month = m;
		$('#searchType option').eq(0).prop('selected', true);
		$('#keyword').val('');
		
		ajaxPayDetailList(year, month);
		
		$('#payDialog').dialog('open');
	}
	$('.btn_search').click(function(event) {
		event.preventDefault();
		
		type = $('#searchType option:selected').val();
		key = $('#keyword').val();
		
		ajaxPayDetailList(year, month, type, key);
	});
	
	function ajaxPayDetailList(year, month, searchType, keyword, page) {
		 $.ajax({
			type: 'post',
			url: 'ajaxPayDetailList.do',
			dataType: 'json',
			data: {'searchType': searchType, 'keyword': keyword, 'page': page, 'year': year, 'month': month},
			success: function(data) {
				var html = '';
				
				html += '<tr><th>주문번호</th><th>주문일자</th><th>주문자</th><th>주문상품</th><th>구매가격</th><th>상태</th></tr>';
				$.each(data.payList, function(index, value) {
					var date = new Date(value.orderDate);
					var m = (date.getMonth()+1+'').length == 1 ? ('0' + (date.getMonth()+1)) : (date.getMonth()+1);
					var d = (date.getDate()+'').length == 1 ? ('0' + date.getDate()) : date.getDate();
					var orderDate = date.getFullYear() + '-' + m + '-' + d;
					html += '<tr>';
					html += '<td>' + value.orderSerial + '</td>';
					html += '<td>' + orderDate + '</td>';
					html += '<td>' + value.memName + '</td>';
					html += '<td>' + value.prodName + '</td>';
					html += '<td>' + comma(value.realPrice) + ' 원</td>';
					if(value.cancelyn == 'y') html += '<td>주문취소</td>';
					else if(value.orderState == 1) html += '<td>입금대기</td>';
					else if(value.orderState == 2) html += '<td>상품준비</td>';
					else if(value.orderState == 3) html += '<td>배송중</td>';
					else if(value.orderState == 4) html += '<td>배송완료</td>';
					html += '</tr>';
				});
				
				$('#payDialog table').html(html);
				html = '';
				
				var pageMaker = data.pageMaker;
				
				if(pageMaker.prev)
					html += '<li><a href="javascript:ajaxPayDetailList(\'' + year + '\', \'' + month + '\', \'' + type + '\', \'' + key + '\' ' + (pageMaker.startPage-1) + ')">&laquo;</a></li>'
				for(var idx=pageMaker.startPage; idx<=pageMaker.endPage; idx++) {
					html += '<li ' + (pageMaker.cri.page == idx ? 'class=on' : '') + '>';
					html += '<a href="javascript:ajaxPayDetailList(\'' + year + '\', \'' + month + '\', \'' + type + '\', \'' + key + '\', ' + idx + ')">' + idx + '</a></li>';
				}	
				if(pageMaker.next && pageMaker.endPage > 0) 
					html += '<li><a href="javascript:ajaxPayDetailList(\'' + year + '\', \'' + month + '\', \'' + type + '\', \'' + key + '\', ' + (pageMaker.endPage + 1) + ')">&raquo;</a></li>';
				
				$('#payDialog .paging').html(html);
			},
			error: function(a, b, c) {
				alert(a + b + c);
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
		location.href = "totsale.do?m=${m}&year=" + year;
	});
	
</script>