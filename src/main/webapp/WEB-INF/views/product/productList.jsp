<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
	<title>근조화환 | 엔젤 플라워</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/product/product.css" />
</head>

<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!-- container (S) -->
<div id="container">
	<div class="item" style="border: none; margin-top: 15px;">
		<div class="top" style="border: none;">
			<h2>추모 &amp; 근조</h2>
			<span>총 121개의 상품이 검색되었습니다.</span>
			<ul>
				<li class="on"><a href="#">인기순</a></li>
				<li><a href="#">상품후기많은순</a></li>
				<li><a href="#">높은가격순</a></li>
				<li><a href="#">낮은가격순</a></li>
			</ul>
			<table class="tbl_prod">
			<tr>
				<td rowspan="2" width="350" class="one">
					<img src="${pageContext.request.contextPath }/resources/images/item/sample_06.jpg" alt="특별한 고품격 검정리본 화환" width="210" height="340" />
					<h3>특별한 고품격 [검정리본] 화환</h3>
					<p class="price"><del>150,000</del>145,500 원</p>
					<p class="save"><span>적립금</span>10,500</p>
				</td>
				<td width="400">
					<img src="${pageContext.request.contextPath }/resources/images/item/sample_07.jpg" alt="근조화환 3단" width="150" height="210"/>
					<div>
						<h3>근조화환3단 &lt;애...</h3>
						<p class="price"><del>100,000</del>97,000원</p>
						<p class="save"><span>적립금</span>7,000</p>
					</div>
				</td>
				<td width="400">
					<img src="${pageContext.request.contextPath }/resources/images/item/sample_07.jpg" alt="근조화환 3단" width="150" height="210"/>
					<div>
						<h3>근조화환3단 &lt;애...</h3>
						<p class="price"><del>100,000</del>97,000원</p>
						<p class="save"><span>적립금</span>7,000</p>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<img src="${pageContext.request.contextPath }/resources/images/item/sample_08.jpg" alt="근조화환 3단" width="150" height="210"/>
					<div>
						<h3>근조화환3단 (분...</h3>
						<p class="price"><del>99,000</del>96,000원</p>
						<p class="save"><span>적립금</span>6,900</p>
					</div>
				</td>
				<td>
					<img src="${pageContext.request.contextPath }/resources/images/item/sample_08.jpg" alt="근조화환 3단" width="150" height="210"/>
					<div>
						<h3>근조화환3단 (분...</h3>
						<p class="price"><del>99,000</del>96,000원</p>
						<p class="save"><span>적립금</span>6,900</p>
					</div>
				</td>
			</tr>
			</table>
			<script>
				$('.tbl_prod td').click(function(){
					location.href='<c:url value="productDetail.do" />';
				})
			</script>
		</div>
	</div>
	
	<div class="slider">
		<img src="${pageContext.request.contextPath }/resources/images/item/sample_06.jpg" width="340" height="500"/>
		<ul>
			<li><img src="${pageContext.request.contextPath }/resources/images/item/slide01.jpg" /></li>
			<li><img src="${pageContext.request.contextPath }/resources/images/item/slide02.jpg" /></li>
			<li><img src="${pageContext.request.contextPath }/resources/images/item/slide03.jpg" /></li>
			<li><img src="${pageContext.request.contextPath }/resources/images/item/slide04.jpg" /></li>
			<li><img src="${pageContext.request.contextPath }/resources/images/item/slide05.jpg" /></li>
		</ul>
	</div>
	<%@ include file="/WEB-INF/views/include/quick.jsp" %>
</div>
<!-- container (E) -->

<%@ include file="/WEB-INF/views/include/footer.jsp" %>