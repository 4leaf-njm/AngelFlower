<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/admin/include/header.jsp" %>

<!-- container (S) -->
<div id="container">
	<div class="content">
		<h3 class="title"><i class="fa fa-angle-right" aria-hidden="true"></i>권한 목록</h3>
		<table class="tbl02">
			<tr>
				<th style="width: 100px;">번호</th>
				<th>권한명</th>
				<th style="width: 150px;">비고</th>
			</tr>
			<c:choose>
			<c:when test="${empty roleList}">
			<tr class="empty">
				<td colspan="4">생성된 권한이 없습니다.</td>
			</tr>
			</c:when>
			<c:otherwise>
			<c:forEach var="role" items="${roleList}" varStatus="status">
			<tr>
				<td>${status.count }</td>
				<td>
					<span style="position: relative;">
					<c:if test="${role.adminyn eq 'y'.charAt(0)}">
						<img src="${pageContext.request.contextPath }/resources/images/icon/ico_admin.jpg" style="width: 18px; height: 17px; position: absolute; left: -19px; bottom: -2px;"/>
					</c:if>${role.roleName}
					</span>
				</td>
				<td>
					<a href="javascript:ajaxAuth('${role.roleNo}', '${role.roleName}')" class="btn btn01">편집</a>
					<a href="javascript:go_authRemove('${m}', '${s}', '${pageMaker.cri.page}', '${role.roleNo}', '${role.roleName}')" class="btn btn01">삭제</a>
				</td>
			</tr>
			</c:forEach>
			</c:otherwise>
			</c:choose>
		</table>	
		<ul class="paging">
		<c:if test="${pageMaker.prev}">
			<li><a href="auth.do?m=${m}&s=${s}&page=${pageMaker.startPage - 1}">&laquo;</a></li>
		</c:if>
		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
			<li
				<c:out value="${pageMaker.cri.page == idx?'class=on':''}"/>>
				<a href="auth.do?m=${m}&s=${s}&page=${idx}">${idx}</a>
			</li>
		</c:forEach>
		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			<li><a href="auth.do?m=${m}&s=${s}&page=${pageMaker.endPage +1}">&raquo;</a></li>
		</c:if>
		</ul>
		
		<form action="authInsert.do" method="post" name="frm_auth">
			<input type="hidden" name="roleNo" value="0" />
			<input type="hidden" name="authList" />
			<input type="hidden" name="m" value="${m}" />
			<input type="hidden" name="s" value="${s}" />
			<input type="hidden" name="page" value="${pageMaker.cri.page}" />
			<div class="auth">
				<div class="row">
					<div class="tit"><label for="roleName">권한명</label></div>
					<div class="col"><input type="text" name="roleName" id="roleName"/></div>
					<div class="col" style="width: 150px; margin: 0 0 0 108px;">
						<label style="font-weight: bold; font-size: 12px;">
							<input type="checkbox" name="adminyn" id="adminyn" style="display: inline-block; margin: 0 4px 2px 0;"/>최고 관리자일시 체크
						</label>
					</div>
				</div>
				<div class="row">
					<div class="tit">
						<label>회원관리<input type="checkbox" class="all"/></label>
					</div>
					<div class="col">
						<label>보기<input type="checkbox" name="auth" value="RIGHT_MB_VIEW"/></label>
					</div>
					<div class="col">
						<label>회원탈퇴<input type="checkbox" name="auth" value="RIGHT_MB_DELETE"/></label>
					</div>
					<div class="col">
						<label>권한생성<input type="checkbox" name="auth" value="RIGHT_MB_AUTH_INSERT"/></label>
					</div>
					<div class="col">
						<label>권한부여<input type="checkbox" name="auth" value="RIGHT_MB_AUTH_GIVE"/></label>
					</div>
					<div class="col">
						<label>가입승인<input type="checkbox" name="auth" value="RIGHT_MB_PERMIT"/></label>
					</div>
				</div>
				<div class="row">
					<div class="tit">
						<label>상품관리<input type="checkbox" class="all"/></label>
					</div>
					<div class="col">
						<label>보기<input type="checkbox" name="auth" value="RIGHT_PRD_VIEW"/></label>
					</div>
					<div class="col">
						<label>상품등록<input type="checkbox" name="auth" value="RIGHT_PRD_INSERT"/></label>
					</div>
					<div class="col">
						<label>상품변경<input type="checkbox" name="auth" value="RIGHT_PRD_UPDATE"/></label>
					</div>
					<div class="col">
						<label>상품삭제<input type="checkbox" name="auth" value="RIGHT_PRD_DELETE"/></label>
					</div>
				</div>
				<div class="row">
					<div class="tit">
						<label>주문관리<input type="checkbox" class="all"/></label>
					</div>
					<div class="col">
						<label>보기<input type="checkbox" name="auth" value="RIGHT_ORD_VIEW"/></label>
					</div>
					<div class="col">
						<label>주문취소<input type="checkbox" name="auth" value="RIGHT_ORD_DELETE"/></label>
					</div>
				</div>
				<div class="row">
					<div class="tit">
						<label>발주관리<input type="checkbox" class="all"/></label>
					</div>
					<div class="col">
						<label>보기<input type="checkbox" name="auth" value="RIGHT_BJ_VIEW"/></label>
					</div>
					<div class="col">
						<label>발주신청<input type="checkbox" name="auth" value="RIGHT_BJ_INSERT"/></label>
					</div>
				</div>
				<div class="row">
					<div class="tit">
						<label>정산관리<input type="checkbox" class="all"/></label>
					</div>
					<div class="col">
						<label>발주정산 보기<input type="checkbox" name="auth" value="RIGHT_PAY_BJ_VIEW"/></label>
					</div>
					<div class="col">
						<label>총매출정산 보기<input type="checkbox" name="auth" value="RIGHT_PAY_SALE_VIEW"/></label>
					</div>
					<div class="col">
						<label>총발주현황 보기<input type="checkbox" name="auth" value="RIGHT_PAY_TOTBJ_VIEW"/></label>
					</div>
				</div>
				<div class="row">
					<div class="tit">
						<label>후기관리<input type="checkbox" class="all"/></label>
					</div>
					<div class="col">
						<label>보기<input type="checkbox" name="auth" value="RIGHT_REV_VIEW"/></label>
					</div>
					<div class="col">
						<label>배송후기 등록<input type="checkbox" name="auth" value="RIGHT_REV_SHIP_INSERT"/></label>
					</div>
					<div class="col">
						<label>배송후기 수정<input type="checkbox" name="auth" value="RIGHT_REV_SHIP_UPDATE"/></label>
					</div>
					<div class="col">
						<label>배송후기 삭제<input type="checkbox" name="auth" value="RIGHT_REV_SHIP_DELETE"/></label>
					</div>
					<div class="col">
						<label>상품후기 답변<input type="checkbox" name="auth" value="RIGHT_REV_PRD_REPLY"/></label>
					</div>
					<div class="col">
						<label>상품후기 삭제<input type="checkbox" name="auth" value="RIGHT_REV_PRD_DELETE"/></label>
					</div>
				</div>
				<div class="row">
					<div class="tit">
						<label>홈피관리<input type="checkbox" class="all"/></label>
					</div>
					<div class="col">
						<label>보기<input type="checkbox" name="auth" value="RIGHT_STORE_VIEW"/></label>
					</div>
					<div class="col">
						<label>공지 등록<input type="checkbox" name="auth" value="RIGHT_STORE_NOTICE"/></label>
					</div>
					<div class="col">
						<label>계좌 등록<input type="checkbox" name="auth" value="RIGHT_STORE_ACCOUNT"/></label>
					</div>
					<div class="col">
						<label>배너 등록<input type="checkbox" name="auth" value="RIGHT_STORE_BANNER"/></label>
					</div>
				</div>
			</div>
		</form>
		<div class="btn_box">
			<a href="javascript:go_authreg()" class="btn-big" id="btnAuth">권한 생성</a>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/admin/include/sidebar1.jsp" %>
	
</div>
<!-- container (E) -->
<script src="${pageContext.request.contextPath }/resources/js/admin.js"></script>
<script>
	if('${msg}' != '')
		alert('${msg}');
	
	$('.all').change(function(){
		if($(this).is(':checked')) {
			$(this).parents('.tit').siblings('.col').find('input').prop('checked', true);
		} else {
			$(this).parents('.tit').siblings('.col').find('input').prop('checked', false);
		}
	});
	
	$('#adminyn').change(function(){
		if($(this).is(':checked')) {
			$('#adminyn').val('y')
			$('#roleName').val('관리자');
			$('input:checkbox[name=auth]').prop('checked', true);
		} else {
			$('#roleName').val('');
			$('#adminyn').val('n')
			$('input:checkbox[name=auth]').prop('checked', false);
		}
	})
</script>