<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String path = request.getContextPath();%>
<% request.setCharacterEncoding("utf-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

<script src="/wherepay/resources/jquery-3.2.1.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- MATERIAL DESIGN ICONIC FONT -->
<link rel="stylesheet" href="/wherepay/resources/signup/fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
<!-- STYLE CSS -->
<link rel="stylesheet" href="/wherepay/resources/signup/css/style.css">

<script>
//세대주 검색하기
$(document).ready(function(){
	
	$('#button1').on("click",function(){
		var id =$("#id").val();
		
		console.log(id);
	

		$.ajax({
			type : 'get',
			url :'/wherepay/joinmember1/select?id='+id,
			success : function(data){			
				console.log("가져온 데이터"+data);
				if (data == 1){
					alert("등록된 세대주입니다");
					window.location.href = "/wherepay/joinmember2";
				}else{
					alert("세대주 회원가입을 먼저 해주세요");
					window.location.href = "/wherepay/joinmember1";
				}
			}, 
			error : function(e) {
                console.log(e);
             }	
		});	//ajax end
		
		
		
		
		
	});	//onclick end


});	//function end




	

	function confirmBtn_click(id){
		
	        alert("검색되었습니다");
	        location.href="/wherepay/joinmember1/select";
	      //  location.href="/wherepay/joinmember1/select?id="+id;
	  
	    }
		
	
</script>



</head>
<body>

<br><br><br>


<div class="wrapper" style="background-image: url('/wherepay/resources/signup/images/lightestBlue.JPG');">
			<div class="inner">
				<div class="image-holder">
					<img src="/wherepay/resources/signup/images/familyZone.png" alt="">
				</div>
				<form action="<%=path %>/joinmember1/select" name="masselect" method="get"  >
      
					<h3>가족 구성원 회원가입</h3>
					
					<!-- 아이디로 검색 -->
					<strong>id로 세대주 조회</strong> 
					<div class="form-wrapper">
					<input type="text" id="id"name="id" placeholder="id를 입력하세요" class="form-control">
                   
                   
					</div>
					
		
					<button type ="submit" id="button1">세대주 검색
						<i class="zmdi zmdi-arrow-right"></i>
					</button>
				</form>
			</div>
		</div>
		
	
		<!-- css끝 -->
 




</body>


<!-- footer add -->
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</html>