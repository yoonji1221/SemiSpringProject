<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


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
<main id="main" style="margin-top: 40px;">
		<section class="breadcrumbs" style="margin-top: 80px;height: 100px;">
			<div class="container">
				<div class="section-title">
					<div class="d-flex justify-content-between align-items-center">
						<h2>검색 결과입니다.</h2>
						<ol>
							<li><a href="/wherepay/home">Home</a></li>
							<li>내 주변 가맹점 찾기</li>
						</ol>
					</div>
				</div>
			</div>
		</section>
<c:forEach items="${detailresult }" var="detaillist">
<%-- <tr><td >${detaillist.z_num }
</td><td>${detaillist.z_name }
</td><td>${detaillist.z_addr}
</td><td> ${detaillist.z_btheme}
</td><td> ${detaillist.z_stheme}
</td><td> ${detaillist.z_manager}
</td>
</tr> --%>
<c:set var="sam_num" value="${detaillist.z_num }" />
<c:set var="sam_name" value="${detaillist.z_name }" />
<c:set var="sam_addr" value="${detaillist.z_addr}" />
<c:set var="z_btheme" value="${detaillist.z_btheme}" />
<c:set var="z_stheme" value="${detaillist.z_stheme}" />
<c:set var="z_manager" value="${detaillist.z_manager}" />
</c:forEach>
<section class="features">
      <div class="container">

        <div class="section-title">
         <h2>${sam_name }</h2>
        </div>
        
        <div class="row aos-init aos-animate" data-aos="fade-up">
          <div class="col-md-5"><br><br>
 <table class="table table-bordered table-striped">
<thead>
  <tr>
    <th nowrap>가맹점명</th>
    <th>${sam_name }</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>주소</td>
    <td>${sam_addr }</td>
  </tr>
  <tr>
    <td>업종</td>
    <td>${z_btheme }</td>
  </tr>
  <tr>
    <td>상세분류</td>
    <td>${z_stheme }</td>
  </tr>
  <tr>
    <td>매장 관리자</td>
    <td>${z_manager }</td>
  </tr>
</tbody>
</table>
 <div style="padding-top: 30px;" align='right'><a id="button1" style="align:right;background-color:#1e4356;color:#ffffff;padding-left: 7px;padding-right: 7px;padding-top: 3px;padding-bottom: 3px;"  href="/wherepay/search">돌아가기</a>
      </div>
          </div>
          
          
<div class="col-md-7 pt-4">
<div id="map" style="width: 700px; height: 500px;"></div>
 </div>
        </div>

      </div>
    </section>

		</main>	
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