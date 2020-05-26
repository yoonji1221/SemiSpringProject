<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
function erchk() {
		
	   var flag =validation(); // 유효성 검사를 한 값
	   
	   if(flag){
	      document.sub1.submit();
	   }
		   
		 
	};



$(document).ready(function(){


//아이디 유효성 검사(1 = 중복 / 0 != 중복)
$("#id").keyup(function() {
   var id = $('#id').val();
   
   console.log(id+"       id값 제대로 받아왔는지??")
   
   $.ajax({
      url : '/wherepay/joinmaster2/user?id='+ id,
      type : 'get',
      success : function(data) {
         console.log("1 = 중복o / 0 = 중복x : "+ data);                     
         if (data == 1) {// 1 : 아이디가 중복되는 문구
               $("#idCheck").text("사용중인 아이디입니다");
               $("#idCheck").css("color", "red");
               $("#idCheck").css("font-size", "13px");
               $("#join").attr("disabled", true);
            } else {
                  $('#idCheck').text('사용가능한 아이디입니다.');
                  $('#idCheck').css('color', 'blue');
                  $("#idCheck").css("font-size", "13px");
                  $("#join").attr("disabled", false);            
            }
         }, error : function(e) {
            console.log(e);
         }
      });
   });

});	//function end

function  validation(){	//빈칸 없이 다썼는지 검사
    var flag = false;
   
    if($("#id").val() == "" ){
      console.log($("#id").val());
      alert("아이디를 입력해주세요");
   }else if($("#userPw").val() == "" ){
	    console.log($("#userPw").val());
      alert("비밀번호를 입력해주세요");
   }else if($("#phone").val() == "" ){
	    console.log($("#phone").val());
      alert("전화번호를 입력해주세요");
   }else if($("#addr").val() == "" ){
	    console.log($("#addr").val());
	      alert("주소를 입력해주세요");
	}else if($("#familynum option:selected").val() == "" ){
	    console.log($("#familynum").val());
		   alert("세대원 수를 선택해주세요");
	   } else if($("#howtoget option:selected").val() == "" ){
	    console.log($("#howtoget").val());
		   alert("지급 방식을 선택해주세요");
	}
   else{
      flag = true;
   }
    return flag;
}


	
</script>


<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>       
<br><br><br>
<div class="wrapper" style="background-image: url('/wherepay/resources/signup/images/lightestBlue.JPG');">
			<div class="inner">
				<div class="image-holder">
					<img src="/wherepay/resources/signup/images/familyZone.png" alt="">
				</div>
				<form action="<%=path %>/joinmaster2" name="sub1" method="post">
      
					<h3>세대주 회원가입</h3>
					
					<!-- 이름 -->
					<div class="form-wrapper">
					<input type="hidden" id="name" name="name" value = "<%= session.getAttribute("sname") %>">
					</div>
					
					<!-- 주민번호 -->
					<div class="form-wrapper">
					<input type="hidden" id="jumin" name="jumin" value = "<%= session.getAttribute("sjumin") %>">
					</div>
					
					<!-- id -->
					<div class="form-wrapper">
						<input type="text" id="id" name="id" placeholder="아이디를 입력하세요" class="form-control" style="margin-bottom: 0px;">
						<span id="idCheck"></span>		
					</div>

					<!-- 비밀번호 -->
					<div class="form-wrapper">
						<input type="password" id="userPw" name="pw"placeholder="비밀번호를 입력하세요" class="form-control" style="margin-top: 25px;">

						<i class="zmdi zmdi-lock"></i>
					</div>
					
					<!-- 전화번호 -->
					<div class="form-wrapper">
						<input type="text" name="phone" id="phone" placeholder="전화번호를 입력하세요" class="form-control">
					</div>
					
					<!-- 주소 -->
					<div class="form-wrapper">
						<input type="text" name="addr" id="addr"placeholder="주소를 입력하세요" class="form-control">
					</div>
					
					<!-- 가구원 수 -->
					<div class="form-wrapper">
						<select name ="familynum" id="familynum" class="form-control">
							<option value="" disabled="세대원 수" selected="세대원 수">세대원 수</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
						</select>
						<i class="zmdi zmdi-caret-down" style="font-size: 17px"></i>
						
					</div>
					
					<!-- 지급 방식 -->			
					<div class="form-wrapper">
						<select name ="howtoget" id="howtoget" class="form-control">
							<option value="" disabled="지급방식 선택" selected="지급방식 선택">지급방식 선택</option>
							<option value="신용/체크카드">신용/체크카드</option>
							<option value="선불카드">선불카드</option>
							<option value="상품권">상품권</option>
						</select>
						<i class="zmdi zmdi-caret-down" style="font-size: 17px"></i>
					</div>
				
					<button type ="button" onclick="erchk()" id="join" disabled="disabled" >가입하기
						<i class="zmdi zmdi-arrow-right"></i>
					</button>
				</form>
			</div>
		</div>
		
		<!-- css끝 -->

   


</body>
</html>