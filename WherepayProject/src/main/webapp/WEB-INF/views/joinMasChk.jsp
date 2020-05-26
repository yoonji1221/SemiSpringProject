<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String path = request.getContextPath();%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

<script src="/wherepay/resources/jquery-3.2.1.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- MATERIAL DESIGN ICONIC FONT -->
<link rel="stylesheet" href="/wherepay/resources/signup/fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
<!-- STYLE CSS -->
<link rel="stylesheet" href="/wherepay/resources/signup/css/style.css">

<script>

//세대주 확인
$(document).ready(function(){
	
	$('#button1').on("click",function(){
		var jumin =$("#jumin").val();
		var name =$("#name").val();
	//	console.log(jumin);
	

		$.ajax({
			type : 'get',
			url :'/wherepay/joinmaster1/check?jumin='+jumin+'&name='+name,
			success : function(data){			
				console.log("가져온 데이터"+data);
				if (data == 1){
					alert("사용가능한 세대주입니다");
					//redirect로 이동하도록
					window.location.href = "/wherepay/joinmaster2";
			//		saveSessionStorage();
				}/* else{
					alert("이름과 주민등록번호를 다시 확인해주세요");
					window.location.href = "/wherepay/joinmaster1";
				} */
			}, 
			error : function(e) {
                console.log(e);
             }	
		});	//ajax end
		
		
		
		
		
	});	//onclick end


});	//function end

	
	
</script>



<title>회원가입</title>
</head>
<body>
<br><br><br>
<div class="wrapper" style="background-image: url('/wherepay/resources/signup/images/lightestBlue.JPG');">
			<div class="inner">
				<div class="image-holder">
					<img src="/wherepay/resources/signup/images/familyZone.png" alt="">
				</div>
				<form action="<%=path %>/joinmaster1/check" name="mascheck" method="get" >
      
					<h3>세대주  회원가입</h3>
					
					<!-- 아이디로 검색 -->
					<strong>세대주 확인을 위한 절차입니다</strong> 
					<div class="form-wrapper">
					<input type="text" id="name"name="name" placeholder="이름을 입력하세요" class="form-control">
					</div>
					
					<div class="form-wrapper">
					<input type="text" id="jumin"name="jumin" placeholder="주민번호를 입력하세요" class="form-control">
					</div>
					
		
					<button type ="submit" id="button1">세대주 검색
						<i class="zmdi zmdi-arrow-right"></i>
					</button>
				</form>
			</div>
		</div>
		
		<!-- css끝 -->





</body>
</html>