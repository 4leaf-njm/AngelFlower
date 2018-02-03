<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/admin/include/header.jsp" %>

<!-- container (S) -->
<div id="container">
	<div class="content">
		<h3 class="title"><i class="fa fa-angle-right" aria-hidden="true"></i>전체 상품후기</h3>
		<table class="tbl02">
			<tr>
				<th style="width:120px;">분류</th>
				<th style="width:120px;">만족도</th>
				<th style="width:70px;">후기사진</th>
				<th style="width:120px;">작성자</th>
				<th style="width:180px;">상품명</th>
				<th style="width:120px;">작성일</th>
				<th style="width:300px;">후기내용</th>
				<th style="width:120px;">상태</th>
				<th style="width:100px;">비고</th>
			</tr>
			<c:choose>
			<c:when test="${empty reviewList}">
			<tr class="empty">
				<td colspan="8">작성된 상품후기가 없습니다.</td>
			</tr>
			</c:when>
			<c:otherwise>
			<c:forEach var="review" items="${reviewList}" varStatus="status">
			<tr data-no="${review.reviewNo}" data-idx="${status.index}">
				<td>
				<c:choose>
				<c:when test="${review.category eq 1 }">근조 화환</c:when>
				<c:when test="${review.category eq 2 }">근조 바구니</c:when>
				<c:when test="${review.category eq 3 }">축하 화환</c:when>
				<c:when test="${review.category eq 4 }">꽃다발</c:when>
				<c:when test="${review.category eq 5 }">꽃바구니</c:when>
				<c:when test="${review.category eq 6 }">동·서양란</c:when>
				<c:when test="${review.category eq 7 }">★ 플라워</c:when>
				</c:choose>
				</td>
				<td>
				<c:forEach begin="1" end="${review.comStar}">
					<img src="${pageContext.request.contextPath }/resources/images/icon/ico_star.gif" width="12" height="12"/>
				</c:forEach>
				</td>
				<td style="padding: 5px 0;"><img src="${pageContext.request.contextPath }/resources/upload/review/${review.comImage }" width="45" height="50"/></td>
				<td>
				<c:choose>
				<c:when test="${review.memId eq null}">비회원</c:when>
				<c:otherwise>${review.memId }</c:otherwise>
				</c:choose>
				</td>
				<td>${review.prodName }</td>
				<td><fmt:formatDate value="${review.comRegdate }" pattern="yyyy-MM-dd" /></td>
				<td style="vertical-align: top; text-align: left; padding: 10px; line-height: 150%;">${review.comContent }</td>
				<td>
				<c:choose>
				<c:when test="${review.comReply eq null }"><span class="red">답변 미작성</span></c:when>
				<c:otherwise>답변 작성</c:otherwise>
				</c:choose>
				</td>
				<td>
				<c:choose>
				<c:when test="${review.comReply eq null }">
					<a href="#" class="btn btn01 btn_reply">답변</a>
				</c:when>
				<c:otherwise>
					<a href="#" class="btn btn01 btn_reply">보기</a>
				</c:otherwise>
				</c:choose>
					<a href="javascript:go_removePrd('${m}', '${s}', '${review.reviewNo}', '${pageMaker.cri.page}')" class="btn btn01">삭제</a>
				</td>
			</tr>
			<c:choose>
			<c:when test="${review.comReply ne null }">
			<tr class="reply <c:out value="r${status.index}" />" style="display: none;">
				<th>답변</th>
				<td colspan="8">${review.comReply}</td>
			</tr>
			</c:when>
			</c:choose>
			</c:forEach>
			</c:otherwise>
			</c:choose>
		</table>
		
		<form action="prdreply.do" method="post" name="frm_reply">
			<input type="hidden" name="reviewNo" />
			<input type="hidden" name="comReply" />
		</form>
		
		<ul class="paging">
		<c:if test="${pageMaker.prev}">
			<li><a href="prdlistdo?m=${m}&s=${s}&page=${pageMaker.startPage - 1}">&laquo;</a></li>
		</c:if>
		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
			<li
				<c:out value="${pageMaker.cri.page == idx?'class=on':''}"/>>
				<a href="prdlist.do?m=${m}&s=${s}&page=${idx}">${idx}</a>
			</li>
		</c:forEach>
		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			<li><a href="prdlist.do?m=${m}&s=${s}&page=${pageMaker.endPage +1}">&raquo;</a></li>
		</c:if>
		</ul>
	</div>
	
	<%@ include file="/WEB-INF/views/admin/include/sidebar6.jsp" %>
</div>
<!-- container (E) -->

<script src="${pageContext.request.contextPath }/resources/js/admin.js"></script>
<script>
	if('${msg}' != '')
		alert('${msg}');
</script>
<script>
	$('.btn_reply').click(function(event) {
		event.preventDefault();
		var no = $(this).parents('tr').data('no');
		var idx = $(this).parents('tr').data('idx');
		var text = $(this).text();
		var html = '';
		
		if(text == '답변') {
			$(this).toggleClass('on');
			if($(this).hasClass('on')) {
				html += '<tr class="reply r' + idx + '">';
				html += '<th>답변</th>';
				html += '<td colspan="7"><textarea class="com_reply"></textarea></td>';
				html += '<td style="text-align:center; vertical-align: middle;">';
				html += '<a href="javascript:go_replyPrd(\'' + no + '\', \'' + idx + '\')" class="btn btn05">답변달기</a>';
				html += '</td></tr>';
				$(this).parents('tr').after(html);
			} else {
				$(this).parents('tr').siblings('tr.reply.r' + idx).remove();
			}	
		} else if (text == '보기') {
			$(this).text('숨김');
			$(this).parents('tr').siblings('tr.reply.r' + idx).show();
		} else if (text == '숨김') {
			$(this).text('보기');
			$(this).parents('tr').siblings('tr.reply.r' + idx).hide();
		}
	});
</script>