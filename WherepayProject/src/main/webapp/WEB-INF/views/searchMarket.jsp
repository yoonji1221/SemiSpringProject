<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page isELIgnored="false" contentType = "text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<script src="/wherepay/resources/jquery-3.2.1.min.js"></script>
<meta charset="UTF-8">
<title>매장 검색</title>

<jsp:include page="/WEB-INF/views/header_pop.jsp"></jsp:include>
<script>


//검색결과조회   
function button1_click() {
   var value = $("#money option:selected").val();
   
   if(value == 1){ //신용카드 선택 - 삼성카드 데이터 조회
       $("#table2").remove();
      var sam_gu = $("#address option:selected").val();
       var sam_btheme = $("#category option:selected").val();
       console.log(sam_gu+":"+sam_btheme+"::"+value);
          
       $.ajax({
             url : '/wherepay/searchresult?sam_gu='+ sam_gu +'&sam_btheme='+sam_btheme+'&value='+value,
             type : 'get',
             success : function(resultlist) {
                //$("#outter").remove();
                var table = $("<table id=\"table2\" class=\"table table-bordered table-striped\">");
                $("#tab2").append(table);
                 for(var idx in resultlist){
                   var sam_num= resultlist[idx]['sam_num']
                   var sam_gu = resultlist[idx]['sam_gu']
                   var sam_dong = resultlist[idx]['sam_dong']
                   var sam_name = resultlist[idx]['sam_name']
                   var sam_addr = resultlist[idx]['sam_addr']
                   var sam_btheme = resultlist[idx]['sam_btheme']
                   var sam_stheme = resultlist[idx]['sam_stheme']
                   var sam_phone = resultlist[idx]['sam_phone']

        			//http://192.168.0.100:8080
                   var all = $("<tr><td>"+sam_num+"</td><td><a href='/wherepay/search/detailcard?sam_num="+sam_num+"'>"+sam_name+"</a></td><td>"+sam_gu+"&nbsp;"+sam_dong+"&nbsp;"+sam_addr+"</td><td>"+sam_btheme+"</td><td>"+sam_stheme+"</td></tr>");                   
               $("#table2").append(all);
                }   
                }, error : function(e) {
                   console.log(e);
                }
             });   
   }
   
} 

</script>




</head>
<body>
	<main id="main" style="margin-top: 0px;">
		<section class="breadcrumbs" style="margin-top: 80px;height: 100px;">
			<div class="container">
				<div class="section-title">
					<div class="d-flex justify-content-between align-items-center">
						<h2>지원금 사용 매장 검색</h2>
					</div>
				</div>
			</div>
		</section>
		
				<section class="team aos-init aos-animate" data-aos="fade-up">
		<div class="container">
		 <div class="section-title">
			지원 형태 <select name="money" id="money">
				<option value="1" id="card">신용/체크카드</option>
			</select><br>
			<br> 지역 선택 : 서울특별시&nbsp;&nbsp; <select name="address"
				id="address">
				<option value="전체">&nbsp;전체&nbsp;</option>
				<c:forEach items="${gulist}" var="gulist">
					<option value="${gulist.sam_gu}" name="sam_gu">${gulist.sam_gu}</option>
				</c:forEach>
			</select><br>
			<br> 업종 선택&nbsp;&nbsp;<select name="category" id="category">
				<option value="전체">&nbsp;전체</option>
				<c:forEach items="${category}" var="category">
					<option value="${category.sam_btheme}" name="sam_btheme">${category.sam_btheme}</option>
				</c:forEach>
			</select> 
	<input id="button1" style="background-color:#1e4356;color:#ffffff;padding-left: 7px;padding-right: 7px;padding-top: 3px;padding-bottom: 3px;" type="button" value="검색" class="btn" onclick="button1_click();">
<br><br>
			<div id="tab2"></div>
</div></div>
		</section>
	</main>

</body>
           
  
      
</body>
</html>