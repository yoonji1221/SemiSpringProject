<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String path = request.getContextPath();%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="/wherepay/resources/jquery-3.2.1.min.js"></script>

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
      url : '/wherepay/join/user?id='+ id,
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
      alert("아이디칸이 비었습니다");
   }else if($("#userPw").val() == "" ){
      alert("비밀번호칸이 비었습니다");
   }else if($("#name").val() == "" ){
      console.log($("#name").val());
      alert("이름칸이 비었습니다");
   }else if($("#phone").val() == "" ){
      alert("전화번호칸이 비었습니다");
   }else if($("#addr").val() == "" ){
      alert("주소칸이 비었습니다");
   }
   else{
      flag = true;
   } return flag;
}

//session출력
function printSessionStorage() {

       var output = "";

       // div 태그에 로컬 저장소의 내용을 출력한다.
       for(var key in window.sessionStorage) {
           output += "<p>";
           // getItem( ) 메서드를 이용하여 key 값의 value 값을 찾는다.
           output += key + " : " + sessionStorage.getItem(key);
           output += "</p>";
       }
       
       document.getElementById("output").innerHTML = output;
   }
//session에 저장하는 함수
function saveSessionStorage(){
	
	
	var key = document.getElementByID("key").value;
	var value = document.getElementByID("value").value;
	
	sessionStorage.setItem(key, value);
	
	printSessionStorage();
	
}
	
</script>


<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<body>       


                  
         <form action="<%=path %>/join" name="sub1" method="post" style="height: 600px;
    width: 700px; margin-left: 350px;">
          <table class="table">
       
         <tbody>
         	<tr>
                  <td>
                      <strong>이름</strong>
                  </td>
                  <td>
                   	<input type="text" id="key" value=""/>
    				<input type="text" id="value" value=""/>
                   
                  <%--  <input type="text" id="name" name="name" style="width:300px;">--%>
                  </td>
                </tr>
         
         
            	<tr>
                  <td>
                      <strong>아이디</strong>
                  </td>
                  <td>
                    <input type="text" id="id" name="id" placeholder="아이디를 입력하세요" style="width:300px;"><span id="idCheck"></span>
                  </td>
                </tr>
            	
            	<tr>
                  <td>
                      <strong>비밀번호</strong>
                  </td>
                  <td>
                    <input type="password" id="userPw" name="pw" placeholder="비밀번호를 입력하세요" style="width:300px;">
                  </td>
                 </tr>
                 
  <%--           
                 <tr>
                  <td>
                      <strong>비밀번호 확인</strong>
                  </td>
                  <td>
                    <input type="password" id="userPwChk" placeholder="비밀번호를 한 번 더 입력하세요" style="width:300px;">&nbsp; 
               <span id="chkNotice"></span>
                  </td>
                 </tr>
 --%>

          
            
                 <tr>
                  <td>
                      <strong>전화번호</strong>
                  </td>
                  <td>
                    <input type="text" name="phone" id="to" class="form-control" placeholder="전화번호를 입력하세요" style="width:300px;">
            <%--        <input type="button" id="phonecheck" value="인증번호 받기" class="btn"> <br>
                    <input type="text" id="userNum" placeholder="인증번호를 입력해주세요" class="form-control" style="width:300px;"> --%> 
                  </td>
                 </tr>
                 
                
                 <tr>
                  <td>
                      <strong>주소</strong>
                  </td>
                  <td>
                    <input type="text" name="addr" placeholder="주소를 입력하세요" style="width:300px;" >
             <%--  <button type="button" onclick="openZipSearch()">주소찾기</button> --%>
                  </td>
                 </tr>
                
                
                 <tr>
                  <td>
                      <strong>가구원 수</strong>
                  </td>
                  <td>
                    <input type="text" name="familynum" placeholder="ex)4" style="width:300px;" >명
                  </td>
                 </tr>
                
                
                <tr>
                  <td>
                      <strong>지급방식</strong>
                  </td>
                  <td>
                   <select name ="howtoget" id="howtoget">
                   	<option>선택안함</option>
                   	<option value = "신용/체크카드">신용/체크카드</option>
                   	<option value = "선불카드">선불카드</option>
                   	<option value = "상품권">상품권</option>
                   </select>
                  </td>
                 </tr>
                 
             
          	
                 </tbody>
                 </table>
                 
                 
                 
            <div style="float:left;">
            <input onclick="erchk()" type="button" id="join" value="회원가입" disabled="disabled"  
            style="
                margin-left: 80px;
                width: 174px;
                height: 48px;">
            </div>
            
            <div style="float: center;">
            <input type="button" value="돌아가기" 
            onclick="location.href='/wherepay/home'"  style="width: 174px;
                height: 48px;
                margin-left: 50px;">
                </div>
                
                
              <div style="float: right;">
            <input type="button" value="session에 저장된 값 불러오기" 
            onclick="saveSessionStorage();"  >
                </div>   
             </form>
             
    <div id="output">
        <!-- 저장된 내용을 출력할 DIV 엘리먼트 -->
    </div>




</body>
</html>