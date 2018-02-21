<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/commons/etc.css" />
</head>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!-- container (S) -->
<div id="container">
	<div class="content">
		<div class="location">
			<h3>LOCATION</h3>
			<p>서울시 서초구 방배중앙로 31(방배동 977-19) 지호2빌딩 2층</p>
			<div id="map" style="width:100%;height:400px; margin: 30px auto 60px"></div>
			<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=6baPitkz0OLLxphbiJ3v&submodules=geocoder"></script>
			<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps-geocoder.js"></script>
			<script>
				var mapOptions = {
						center: new naver.maps.LatLng(37.4826105, 126.9917659),
						size: new naver.maps.Size(800, 500),
						zoom: 11,
						scaleControl: false,
						logoControl: false,
						mapDataControl: false,
						zoomControl: true,
						minZoom: 1
				};
				var map = new naver.maps.Map('map', mapOptions);
				var marker = new naver.maps.Marker({
					position: new naver.maps.LatLng(37.482618, 126.9918064),
					map: map,
					size: new naver.maps.Size(32, 42)
				});
				var contentString = [
					'<div style="padding: 5px 10px">',
						'<h3 style="font-size: 14px; font-weight: bold;">엔젤플라워</h3>',
					'</div>'
				].join('');
				var infowindow = new naver.maps.InfoWindow({
					content: contentString
				});
				infowindow.open(map, marker);
			</script>
		</div>
		
	</div>
	<%@ include file="/WEB-INF/views/include/quick.jsp" %>
</div>
<!-- container (E) -->

<%@ include file="/WEB-INF/views/include/footer.jsp" %>