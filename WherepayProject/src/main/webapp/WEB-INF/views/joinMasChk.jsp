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
			url :'/wherepay/join2/check?jumin='+jumin+'&name='+name,
			success : function(data){			
				console.log("가져온 데이터"+data);
				if (data == 1){
					alert("사용가능한 세대주임><");
					//redirect로 이동하도록
					window.location.href = "/wherepay/join";
					saveSessionStorage();
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



<title>Insert title here</title>
</head>
<body>



 <h5>세대주 확인</h5>
 
 	 <form action="<%=path %>/join2/check" name="mascheck" method="get" >
 	 <table class="table">
  		<tbody>
  		
                 <tr>
                  <td>
                      <strong>이름</strong>
                  </td>
                  <td>
                
                    <input type="text" id="key"name="name" 
                    placeholder="이름을 입력하세요" >
                    
                    <input type="text" id="value"name="name" 
                    placeholder="이름을 입력하세요" >
                    
                     <input type="button" value="session저장" onClick="saveSessionStorage();"/>
  					  <input type="button" value="session출력" onClick="printSessionStorage();"/>
                    
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
 	 
 	 <div id="output">
        <!-- 저장된 내용을 출력할 DIV 엘리먼트 -->
    </div>
 	 
 	 
	</form>








</body>
</html>