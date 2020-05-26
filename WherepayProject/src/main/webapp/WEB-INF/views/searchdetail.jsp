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


</head>
<body>
<h1>검색 detail</h1>
<c:forEach items="${detailresult }" var="detaillist">
<tr><td >${detaillist.sam_num }
</td><td>${detaillist.sam_name }
</td><td>${detaillist.sam_gu} ${detaillist.sam_dong} ${detaillist.sam_addr}
</td><td> ${detaillist.sam_btheme}
</td><td> ${detaillist.sam_stheme}
</td><td> ${detaillist.sam_phone}
</td>
</tr>
<c:set var="sam_num" value="${detaillist.sam_num }" />
<c:set var="sam_name" value="${detaillist.sam_name }" />
<c:set var="sam_addr" value="${detaillist.sam_gu} ${detaillist.sam_dong} ${detaillist.sam_addr}" />
</c:forEach>

      <div id="map" style="width: 700px; height: 500px;"></div>
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
      sam_numlist.push("${samvo.sam_num}");
      sam_namelist.push("${samvo.sam_name}");
      sam_addrlist.push("${samvo.sam_addr}");
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
         
         var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
          imageSize = new kakao.maps.Size(30, 40), // 마커이미지의 크기입니다
          imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
          var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
          markerPosition = coords[index]

          var marker = new kakao.maps.Marker({
                  map: map,
                  position: markerPosition,
                  image: markerImage
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
</html>