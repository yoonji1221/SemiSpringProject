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
					alert("등록된 세대주임>< 연결해드림~!");
					window.location.href = "/wherepay/joinmember2";
				}else{
					alert("세대주 회원가입부터 해야지~!~!");
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

<h5>세대주 검색</h5>
 
 	 <form action="<%=path %>/joinmember1/select" name="masselect" method="get" >
 	 <table class="table">
  		<tbody>
  		
                 <tr>
                  <td>
                      <strong>id로 조회하기</strong> 
                  </td>
                  <td>
                       <input type="text" id="id"name="id" 
                    placeholder="id를 입력하세요" >

                  </td>
                 </tr>
                 

 		</tbody>
 	</table>
 	
 	 <input id="button1" type="button" value="세대주 검색하기" >
 	 
 	
	</form> 
	



</body>
</html>