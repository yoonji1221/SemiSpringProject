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
<body  data-aos-easing="ease-in-out-back" data-aos-duration="1000" data-aos-delay="0">

<section id="hero" class="d-flex justify-cntent-center align-items-center" style="height: 600px;">
    <div id="heroCarousel" class="container carousel carousel-fade" data-ride="carousel">
 <!-- Slide 2 -->
      <div class="carousel-item active">
        <div class="carousel-container">
           <h2 class="animated fadeInDown">Welcome to <span>WHEREPAY</span></h2>
					<p class="dot" style="    margin-left: 150px;   margin-right: 150px;  width: 750px;">
						<strong>코로나19</strong>의 <strong>글로벌 대유행</strong>(pandemic)에 따라,
				 <strong>소비심리 위축</strong> 등으로 경제적 타격을 입은 국민들을 지원하기 위해 정부에서 시행하는 현금 지원 대책이다.
				  당초 정부는 소득 하위 70%에 4인가구 기준으로 100만 원의 긴급재난지원금을 지급한다고 밝혔으나, 이후 당정 협의 등을 통해 전 국민 지급 방안을 결정했다. 
				  그리고 4월 29일 국회에서 긴급재난지원금 지급을 위한 2차 추경안이 통과되면서 긴급재난지원금은 선불카드, 신용카드 포인트, 지역상품권 등의 형태로 2020년 5월부터 전 국민에게 지급된다.	</p>
	<a href="https://www.xn--jj0bb2kr6h965bxcbp8g.kr/sub_02.jsp" class="btn-get-started animated fadeInUp" target="blank">신청방법 알아보기</a>
        </div>
      </div>
 </div>
  </section>
  <main id="main" style="margin-top: 0px;">
  
  <section class="skills aos-init aos-animate" data-aos="fade-up">
      <div class="container">

        <div class="section-title">
          <h2>전 세계 '코로나바이러스감염증-19' 발생 현황</h2>
          <p><i class="icofont-check"></i>국가별 확진자,사망자 수는 <중앙재난안전대책본부> '국외 발생현황'의 국가별 '환자발생 수(사망)'정보.[대륙(러시아 등)의 구분 정보는 일부 다를 수 있음].
          <br><i class="icofont-check"></i>인구 출처: IMF (2020년 3월 19일 기준) 등</p>
        </div>

        <div class="skills-content">

          <div class="progress">
            <div class="progress-bar bg-success" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%;">
              <span class="skill">미국 <i class="val">1,680,310명</i></span>
            </div>
          </div>

          <div class="progress">
            <div class="progress-bar bg-info" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100" style="width: 90%;">
              <span class="skill">브라질 <i class="val">391,222명</i></span>
            </div>
          </div>

          <div class="progress">
            <div class="progress-bar bg-warning" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%;">
              <span class="skill">러시아 <i class="val">362,342명</i></span>
            </div>
          </div>

          <div class="progress">
            <div class="progress-bar bg-danger" role="progressbar" aria-valuenow="55" aria-valuemin="0" aria-valuemax="100" style="width: 55%;">
              <span class="skill">영국 <i class="val">265,227명</i></span>
            </div>
          </div>

        </div>

      </div>
    </section>
  
    <!-- ======= Features Section ======= -->
    <section class="features" style="margin-top: 0px;padding-top: 0px;">
      <div class="container">

        <div class="section-title">
          <h2>내 주변 가맹점 한 눈에 보기</h2>
          <p>지급 유형에 따른 내 주변 가맹점, 한 눈에 확인하세요!</p>
        </div>

        <div class="row aos-init aos-animate" data-aos="fade-up" style="width: 1000px;padding-right: 100px;">
          <div class="col-md-5"style="  padding-top: 30px;" align='right'>
			<ul>
				<li><input type="radio" name="radiovalue" value="1"
					onclick="check();">신용/체크카드&nbsp; <img src="${pageContext.request.contextPath}/resources/Moderna/assets/img/marker_red.png" 
					style="width: 23px; height:28px;"></li>
				<li><input type="radio" name="radiovalue" value="2"
					onclick="check1();">선불카드&nbsp;<img src="${pageContext.request.contextPath}/resources/Moderna/assets/img/marker.png" 
					style="width: 20px; height:25px;"> </li>
				<li><input type="radio" name="radiovalue" value="2"
					onclick="check1();">서울사랑상품권&nbsp;<img src="${pageContext.request.contextPath}/resources/Moderna/assets/img/marker.png" 
					style="width: 20px; height:25px;"> </li>
			</ul>
				 <div class="entry-content">
        		 <div class="read-more">
                <ul>
                  <li><a id="button1" style="background-color:#1e4356;color:#ffffff;padding-left: 7px;padding-right: 7px;padding-top: 3px;padding-bottom: 3px;"  href="/wherepay/search">내 지역 조회하러 가기</a></li>
                </ul>
			</div>
              </div>
          </div>
          <div class="col-md-7 pt-4">
         <div id="map" style="width: 700px; height: 500px;"></div>
          </div>
        </div>

      </div>
    </section><!-- End Features Section -->

  </main>

		
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=109901ab932f557de01522d4798dad18&libraries=services"></script>
	<script>
	
	function check(){
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.486726, 126.897225), // 지도의 중심좌표
	        level: 5// 지도의 확대 레벨
	    };  

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			var geocoder = new kakao.maps.services.Geocoder(); // 주소-좌표 변환 객체를 생성합니다
			var bounds = new kakao.maps.LatLngBounds();  
			
			var coords = new Array();
			var content_list = new Array();
			 
		
			var sam_numlist = new Array();
			var sam_namelist = new Array();
			var sam_addrlist = new Array();
			var sam_bthemelist = new Array();
			var sam_sthemelist = new Array();

			<c:forEach var="samvo" items="${samlist}">
			sam_numlist.push("${samvo.sam_num}");
			sam_namelist.push("${samvo.sam_name}");
			sam_addrlist.push("${samvo.sam_addr}");
			sam_bthemelist.push("${samvo.sam_btheme}");
			sam_sthemelist.push("${samvo.sam_stheme}"); 
			</c:forEach>
			
			sam_addrlist.forEach(function(addr, index) {
				content_list.push("<div style='width:150px;text-align:center;padding:6px 0;'>"+sam_namelist[index]+"</div>");
				geocoder.addressSearch(addr, function(result, status) {
					if (status === kakao.maps.services.Status.OK) {
						coords[index] = new kakao.maps.LatLng(result[0].y,result[0].x);
						bounds.extend(coords[index]);
						
						var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
					    imageSize = new kakao.maps.Size(30, 40), // 마커이미지의 크기입니다
					    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
					    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
					    markerPosition = coords[index]

					    var marker = new kakao.maps.Marker({
		                      map: map,
		                      position: markerPosition,
		                      image: markerImage,
		                      clickable: false
		                  });
					    var iwContent = '<div style="padding:5px;"><a href =\'/wherepay/home\'>Hello World!</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
					    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

					   
						
						var infowindow = new kakao.maps.InfoWindow({
							content : content_list[index],
							//content : iwContent,
						    removable : iwRemoveable
						});
					    
					    
						(function(marker, infowindow) {
							kakao.maps.event.addListener(marker, 'click', function() {
							      // 마커 위에 인포윈도우를 표시합니다
							      infowindow.open(map, marker);  
							      
							});
							
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
		
		
	}; //check() 끝
 	function check1(){
 		
 		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
 	    mapOption = {
 	        center: new kakao.maps.LatLng(37.486726, 126.897225), // 지도의 중심좌표
 	        level: 5// 지도의 확대 레벨
 	    };  
 		
 		var map = new kakao.maps.Map(mapContainer, mapOption); 
		var geocoder = new kakao.maps.services.Geocoder(); // 주소-좌표 변환 객체를 생성합니다
		var bounds = new kakao.maps.LatLngBounds();  
		
		var coords = new Array();
		var content_list = new Array();
		 
		var z_numlist = new Array();
		var z_namelist = new Array();
		var z_addrlist = new Array();
		var z_bthemelist = new Array();
		var z_sthemelist = new Array();
		
		<c:forEach var="zerovo" items="${zerolist}">
		z_numlist.push("${zerovo.z_num}");
		z_namelist.push("${zerovo.z_name}");
		z_addrlist.push("${zerovo.z_addr}");
 		z_bthemelist.push("${zerovo.z_btheme}");
		z_sthemelist.push("${zerovo.z_stheme}"); 
		</c:forEach> 
		
		
		
		z_addrlist.forEach(function(addr, index) {
			content_list.push('<div style="width:150px;text-align:center;padding:6px 0;">'+z_namelist[index]+'</div>');
	         
			geocoder.addressSearch(addr, function(result, status) {
				if (status === kakao.maps.services.Status.OK) {
					coords[index] = new kakao.maps.LatLng(result[0].y,result[0].x);
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
		
	}; //check1()끝
	
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.486726, 126.897225), // 지도의 중심좌표
        level: 5// 지도의 확대 레벨
    };  

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		var geocoder = new kakao.maps.services.Geocoder(); // 주소-좌표 변환 객체를 생성합니다
		var bounds = new kakao.maps.LatLngBounds();  
		
		var coords = new Array();
		var content_list = new Array();
		 
		var z_numlist = new Array();
		var z_namelist = new Array();
		var z_addrlist = new Array();
		var z_bthemelist = new Array();
		var z_sthemelist = new Array();
		
		var sam_numlist = new Array();
		var sam_namelist = new Array();
		var sam_addrlist = new Array();
		var sam_bthemelist = new Array();
		var sam_sthemelist = new Array();

		<c:forEach var="zerovo" items="${zerolist}">
		z_numlist.push("${zerovo.z_num}");
		z_namelist.push("${zerovo.z_name}");
		z_addrlist.push("${zerovo.z_addr}");
 		z_bthemelist.push("${zerovo.z_btheme}");
		z_sthemelist.push("${zerovo.z_stheme}"); 
		</c:forEach> 
		
		
		
		z_addrlist.forEach(function(addr, index) {
			content_list.push('<div style="width:150px;text-align:center;padding:6px 0;">'+z_namelist[index]+'</div>');
	         
			geocoder.addressSearch(addr, function(result, status) {
				if (status === kakao.maps.services.Status.OK) {
					coords[index] = new kakao.maps.LatLng(result[0].y,result[0].x);
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
		
		
		<c:forEach var="samvo" items="${samlist}">
		sam_numlist.push("${samvo.sam_num}");
		sam_namelist.push("${samvo.sam_name}");
		sam_addrlist.push("${samvo.sam_addr}");
		sam_bthemelist.push("${samvo.sam_btheme}");
		sam_sthemelist.push("${samvo.sam_stheme}"); 
		</c:forEach>
		
		sam_addrlist.forEach(function(addr, index) {
			content_list.push('<div style="width:150px;text-align:center;padding:6px 0;">'+sam_namelist[index]+'</div>');
			geocoder.addressSearch(addr, function(result, status) {
				if (status === kakao.maps.services.Status.OK) {
					coords[index] = new kakao.maps.LatLng(result[0].y,result[0].x);
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
	
		
		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);
	</script>

</body>


<!-- footer add -->
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>


</html>