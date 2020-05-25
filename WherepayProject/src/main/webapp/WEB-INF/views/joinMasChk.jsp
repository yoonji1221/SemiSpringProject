<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String path = request.getContextPath();%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="/wherepay/resources/jquery-3.2.1.min.js"></script>

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
					alert("사용가능한 세대주임><");
					//redirect로 이동하도록
					window.location.href = "/wherepay/joinmaster2";
			//		saveSessionStorage();
				}else{
					alert("사용가능한 세대주 아님><");
				}
			}, 
			error : function(e) {
                console.log(e);
             }	
		});	//ajax end
		
		
		
		
		
	});	//onclick end


});	//function end

	
	
</script>



<title>Insert title here</title>
</head>
<body>



 <h5>세대주 확인</h5>
 
 	 <form action="<%=path %>/joinmaster1/check" name="mascheck" method="get" >
 	 <table class="table">
  		<tbody>
  		
                 <tr>
                  <td>
                      <strong>이름</strong> 
                  </td>
                  <td>
                
                       <input type="text" id="name"name="name" 
                    placeholder="이름을 입력하세요" >
                    
                    
                  </td>
                 </tr>
                 
                 <tr>
                  <td>
                      <strong>주민등록번호</strong>
                  </td>
                  <td>
                    <input type="text" id="jumin"name="jumin" placeholder="주민번호를 입력하세요">
                  </td>
                 </tr>
                 
 		</tbody>
 	</table>
 	
 	 <input id="button1" type=button value="세대주 여부 확인" >
 	 
 	 
 	 
	</form>






</body>
</html>