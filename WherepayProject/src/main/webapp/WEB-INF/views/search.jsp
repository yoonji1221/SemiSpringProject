<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%@ page isELIgnored="false" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="/wherepay/resources/jquery-3.2.1.min.js"></script>
<meta charset="UTF-8">
<title>WHERE PAY에 오신 걸 환영합니다!</title>

<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<script>
//검색결과조회   
function button1_click() {
	var value = $("#money option:selected").val();
	console.log(value+"몇번 선택~?")
	
	if(value == 1){ //신용카드 선택 - 삼성카드 데이터 조회
		 $("#table2").remove();
		var sam_gu = $("#address option:selected").val();
	    var sam_btheme = $("#category option:selected").val();
	    console.log(sam_gu+":"+sam_btheme+"::"+value);
	       
	    $.ajax({
	          url : '/wherepay/searchresult?sam_gu='+ sam_gu +'&sam_btheme='+sam_btheme+'&value='+value,
	          type : 'get',
	          success : function(resultlist) {
	        	  $("#htag").remove();
	             $("#table2").remove();
	             var table = $("<h4 id='htag'>신용/체크카드 검색 결과입니다.</h4><table id=\"table2\" class=\"table table-bordered table-striped\"><thead><tr><th nowrap>번호</th><th nowrap>가맹점명</th><th>주소</th><th nowrap>업종분류</th><th nowrap>상세분류</th><th nowrap>전화번호</th></tr></thead>");
	    
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
	     
	                var all = $("<tr><td>"+sam_num+"</td><td><a href='/wherepay/search/detail1?sam_num="+sam_num+"'>"+sam_name+"</a></td><td>"+sam_gu+"&nbsp;"+sam_dong+"&nbsp;"+sam_addr+"</td><td>"+sam_btheme+"</td><td>"+sam_stheme+"</td><td nowrap>"+sam_phone+"</td>");                   
					$("#table2").append(all);
	             }   
	             }, error : function(e) {
	                console.log(e);
	             }
	          });   
	}
	
	if(value == 2 || value==3){ //선불카드, 상품권 선택 제로페이 데이터 조회
		 $("#table2").remove();
		var sam_gu = $("#address option:selected").val();
	    var sam_btheme = $("#category option:selected").val();
	    console.log(sam_gu+":"+sam_btheme+"::"+value);
	       
	    $.ajax({
	          url : '/wherepay/searchresult?sam_gu='+ sam_gu +'&sam_btheme='+sam_btheme+'&value='+value,
	          type : 'get',
	          success : function(resultlist) {
	        	  $("#table2").remove();
	        	  $("#htag").remove();
	             var table = $("<h4 id='htag'>선불카드&모바일상품권 검색 결과입니다.</h4><table id=\"table2\" class=\"table table-bordered table-striped\"><thead><tr><th nowrap>번호</th><th nowrap>가맹점명</th><th>주소</th><th nowrap>업종분류</th><th nowrap>상세분류</th><th nowrap>관리자 이름</th></tr></thead>");
	             $("#tab2").append(table);
	              for(var idx in resultlist){
	                var z_num= resultlist[idx]['z_num']
	                var z_name = resultlist[idx]['z_name']
	                var z_addr = resultlist[idx]['z_addr']
	                var z_giftcard = resultlist[idx]['z_giftcard']
	                var z_stheme = resultlist[idx]['z_stheme']
	                var z_btheme = resultlist[idx]['z_btheme']
	                var z_manager = resultlist[idx]['z_manager']
	                
	                var all = $("<tr><td>"+z_num+"</td><td><a href='/wherepay/search/detail2?z_num="+z_num+"'>"+z_name+"</a></td><td>"+z_addr+"</td><td>"+z_btheme+"</td><td>"+z_stheme+"</td><td>"+z_manager+"</td>");                   
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
						<h2>내 주변 가맹점을 검색해보세요!</h2>
						<ol>
							<li><a href="/wherepay/home">Home</a></li>
							<li>내 주변 가맹점 찾기</li>
						</ol>
					</div>
				</div>
			</div>
		</section>
		<section class="team aos-init aos-animate" data-aos="fade-up">
		<div class="container">
		 <div class="section-title">
			지원 형태 <select name="money" id="money">
				<option value="1" id="card">신용/체크카드</option>
				<option value="2" id="money">선불카드</option>
				<option value="3" id="cash">모바일상품권</option>
			</select><br>
			<br> 지역 선택 : 서울특별시&nbsp;&nbsp; <select name="address"id="address">
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
		<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	</main>

</body>


<!-- footer add -->


</html>