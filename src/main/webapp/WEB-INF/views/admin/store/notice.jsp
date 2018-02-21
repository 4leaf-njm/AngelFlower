<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/admin/include/header.jsp" %>

<!-- container (S) -->
<div id="container">
	<div class="content">
		<h3 class="title"><i class="fa fa-angle-right" aria-hidden="true"></i>공지사항</h3>
		<table class="tbl02">
			<tr>
				<th style="width:100px;">번호</th>
				<th style="width:320px;">제목</th>
				<th style="width:600px;">내용</th>
				<th style="width:120px;">작성일</th>
				<th style="width:120px;">비고</th>
			</tr>
			<c:choose>
			<c:when test="${empty noticeList }">
			<tr class="empty">
				<td colspan="5">작성된 공지사항이 없습니다.</td>
			</tr>
			</c:when>
			<c:otherwise>
			<c:forEach var="notice" items="${noticeList}">
			<tr>
				<td>${notice.noticeNo}</td>
				<td>${notice.noticeTitle}</td>
				<td style="text-align: left; padding: 0 15px;">${notice.noticeContent}</td>
				<td><fmt:formatDate value="${notice.noticeDate}" pattern="yyyy-MM-dd"/></td>
				<td>
					<a href="javascript:go_modifyNotice('${notice.noticeNo}')" class="btn btn01">수정</a>
					<a href="javascript:go_removeNotice('${m}', '${cri.page}', '${notice.noticeNo}')" class="btn btn01">삭제</a>
				</td>
			</tr>
			</c:forEach>
			</c:otherwise>
			</c:choose>
		</table>
		<ul class="paging">
		<c:if test="${pageMaker.prev}">
			<li><a href="notice.do?m=${m}&page=${pageMaker.startPage - 1}">&laquo;</a></li>
		</c:if>
		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
			<li
				<c:out value="${pageMaker.cri.page == idx?'class=on':''}"/>>
				<a href="notice.do?m=${m}&page=${idx}">${idx}</a>
			</li>
		</c:forEach>
		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			<li><a href="notice.do?m=${m}&page=${pageMaker.endPage +1}">&raquo;</a></li>
		</c:if>
		</ul>
		<div class="notice">
			<form method="post" name="frm_notice">
				<input type="hidden" name="noticeNo" value="0" />
				<input type="hidden" name="m" value="${m}" />
				<input type="hidden" name="page" value="${cri.page}" />
				<div class="row">
					<div class="tit"><label for="noticeTitle">제목</label></div>
					<div class="col"><input type="text" name="noticeTitle" id="noticeTitle"/></div>
				</div>
				<div class="row">
					<div class="tit"><label for="noticeContent">내용</label></div>
					<div class="col"><textarea name="noticeContent" id="noticeContent"></textarea></div>
				</div>
			</form>
		</div>
		<div class="btn_box">
			<a href="javascript:go_notice()" class="btn-big btn_notice">공지 등록</a>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/views/admin/include/sidebar7.jsp" %>
</div>
<!-- container (E) -->

<script src="${pageContext.request.contextPath }/resources/js/admin.js"></script>
<script>
	if('${msg}' != '')
		alert('${msg}');
	
	function go_notice() {
		if(!hasRole('RIGHT_STORE_NOTICE')) {
			alert('권한이 없습니다.');
			return;
		}
		if($('.notice').hasClass('on')) {
			var frm = document.frm_notice;
			if(frm.noticeTitle.value == '') {
				alert('제목을 입력해주세요.');
				frm.noticeTitle.focus();
				return;
			} else if (frm.noticeContent.value == '') {
				alert('내용을 입력해주세요.');
				frm.noticeContent.focus();
				return;
			} 
			if($('.btn_notice').text() == '공지 등록') {
				var result = confirm('등록하시겠습니까 ?');
				if(result) {
					frm.action = "insertNotice.do";
					frm.submit();
				}
			} else {
				var result = confirm('수정하시겠습니까 ?');
				if(result) {
					frm.action = "modifyNotice.do";
					frm.submit();
				}				
			}
		} else {
			$('.notice').addClass('on');
		}
	}
	
	function go_modifyNotice(no) {
		if(!hasRole('RIGHT_STORE_NOTICE')) {
			alert('권한이 없습니다.');
			return;
		}
		document.frm_notice.noticeNo.value = no;
		$.ajax({
			type: 'post',
			url: 'ajaxNotice.do',
			data: {'no': no},
			dataType: 'json',
			success: function(data) {
				$('#noticeTitle').val(data.noticeTitle);
				$('#noticeContent').val(data.noticeContent);
				$('.btn_notice').text('공지 수정');
				$('.notice').addClass('on');
			},
			error: function() {
				alert('error');
			}
		});
	}
	
	function go_removeNotice(m, page, no) {
		if(!hasRole('RIGHT_STORE_NOTICE')) {
			alert('권한이 없습니다.');
			return;
		}
		var result = confirm('삭제하시겠습니까 ?');
		if(result)
			location.href = "removeNotice.do?m=" + m + '&page=' + page + '&no=' + no;
	}
</script>