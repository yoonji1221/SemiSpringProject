<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<%@ page isELIgnored="false" contentType = "text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<script src="/wherepay/resources/jquery-3.2.1.min.js"></script>
<meta charset="UTF-8">
<title>WHERE PAY에 오신 걸 환영합니다!</title>

<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

</head>
<body>
<main id="main" style="margin-top: 40px;height: 100px;">
		<section class="breadcrumbs" style="margin-top: 80px;height: 100px;">
			<div class="container">
				<div class="section-title">
					<div class="d-flex justify-content-between align-items-center">
						<h2>내 주변 가맹점을 검색해보세요!</h2>
						<ol>
							<li><a href="/wherepay/home">Home</a></li>
							<li>내 주변 가맹점 찾기</li>
						</ol>
					</div>
</div>
				</div>
		</section>
		<div class="container">
<h1>검색 detail</h1>
<c:forEach items="${detailresult }" var="detaillist">
<tr><td >${detaillist.z_num }
</td><td>${detaillist.z_name }
</td><td>${detaillist.z_addr}
</td><td> ${detaillist.z_btheme}
</td><td> ${detaillist.z_stheme}
</td><td> ${detaillist.z_manager}
</td>
</tr>
<c:set var="sam_num" value="${detaillist.z_num }" />
<c:set var="sam_name" value="${detaillist.z_name }" />
<c:set var="sam_addr" value="${detaillist.z_addr}" />
</c:forEach>

		<div id="map" style="width: 700px; height: 500px;"></div></div></main>	
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=109901ab932f557de01522d4798dad18&libraries=services"></script>
<script>

		var geocoder = new kakao.maps.services.Geocoder(); // 주소-좌표 변환 객체를 생성합니다
		var bounds = new kakao.maps.LatLngBounds();  
		
		var coords = new Array();
		var content_list = new Array();
		
		var sam_numlist = new Array();
		var sam_namelist = new Array();
		var sam_addrlist = new Array();
		var sam_bthemelist = new Array();
		var sam_sthemelist = new Array();

		<c:forEach var="samvo" items="${detailresult}">
		sam_numlist.push("${samvo.z_num}");
		sam_namelist.push("${samvo.z_name}");
		sam_addrlist.push("${samvo.z_addr}");
		</c:forEach> 
		
		
sam_addrlist.forEach(function(addr, index) {
	content_list.push('<div style="width:150px;text-align:center;padding:6px 0;">'+sam_namelist[index]+'</div>');
	geocoder.addressSearch(addr, function(result, status) {
		if (status === kakao.maps.services.Status.OK) {
			coords[index] = new kakao.maps.LatLng(result[0].y,result[0].x);
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(result[0].y,result[0].x), // 지도의 중심좌표
		        level: 3// 지도의 확대 레벨
		    };  

				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			
			
			
			bounds.extend(coords[index]);
			
			var marker = new kakao.maps.Marker({
                map: map,
                position: coords[index]
            });

		   
			
			var infowindow = new kakao.maps.InfoWindow({
				content : content_list[index]
			});
			(function(marker, infowindow) {
				kakao.maps.event.addListener(marker, 'mouseover',function() {
							infowindow.open(map, marker);
						});

				kakao.maps.event.addListener(marker, 'mouseout',function() {
							infowindow.close();
						});
			})(marker, infowindow);

		} //if end   
		//map.setBounds(bounds);
	}); // geo end

	
	
});//foreach end



</script>	
			
</body>

<!-- footer add -->
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</html>