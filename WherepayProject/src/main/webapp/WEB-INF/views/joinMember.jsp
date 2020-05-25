<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String path = request.getContextPath();%>
<% request.setCharacterEncoding("utf-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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


	
</script>



</head>
<body>

   <form action="<%=path %>/joinmember2" name="sub1" method="post" >
          <table class="table">
       
         <tbody>
         	<tr>
                  <td>
                       <strong>이름</strong> 
                  </td>
                  <td>                   
                   <input type="text" id="name" name="name" 
                   placeholder="이름을 입력하세요" style="width:300px;">
           
                  </td>
                </tr>
         
         
      <!--   	<tr>
                  <td>
                      <strong>주민등록번호</strong> 
                  </td>
                  <td>                   
                   <input type="hidden" id="jumin" name="jumin" value = "<%= session.getAttribute("sjumin") %>"style="width:300px;">
           
                  </td>
                </tr>
         --> 
         
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
                 
                
      <%--           <tr>
                  <td>
                      <strong>주소</strong>
                  </td>
                  <td>
                    <input type="text" name="addr" placeholder="주소를 입력하세요" style="width:300px;" >
               <button type="button" onclick="openZipSearch()">주소찾기</button> 
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
                 
             --%>
          	
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
                
           
             </form>
             

</body>
</html>