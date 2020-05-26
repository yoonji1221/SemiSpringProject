<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page isELIgnored="false" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="/wherepay/resources/jquery-3.2.1.min.js"></script>
<meta charset="UTF-8">
<title>Mypage</title>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

<script type="text/javascript">
function confirmBtn_click(u_num){
	var mas_num = ${param.mas_num};
	if(confirm("가족 구성원으로 승인하시겠습니까?") == true){
        alert("등록되었습니다");
        location.href="/wherepay/confirm?mas_num="+mas_num+"&u_num=" + u_num;
    }
    else{
        return ;
    }
}
</script>

<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

</head>
<body>

   <main id="main" style="margin-top: 0px;">


               
          <c:forEach items="${list }" var="userlist">
			<c:if test="${userlist.confirm eq '0'}">
			
			  <section class="breadcrumbs" style="margin-top: 80px;height: 100px;">
		         <div class="container">
		            <div class="section-title">
		               <div class="d-flex justify-content-between align-items-center">
		                   <h2 style="color:#000080; ">${userlist.name}세대주님의 마이페이지</h2>
		               </div>
					</div>			
		          </div>
     		 </section>
			 			 
			 <div class="section-title" >
				<h3>가족 구성원 관리</h3>
				<h4>${userlist.name }님의 가족 구성원 신청 현황</h4>
			  </div>
			  
				<c:set var = "mas_num" value="${userlist.mas_num }"/>
			</c:if>
		</c:forEach>
    
 <section class="team aos-init aos-animate" data-aos="fade-up">
      <div class="container">
       <div class="section-title">
			<table class="table">
			 <thead>
				<tr>
					<th>이름</th>
					<th>아이디</th>
					<th>주소</th>
					<th>신청 상태</th>
					<th></th>
				</tr>
				
				</thead>
				<tbody>
				<c:forEach items="${list }" var="userlist">
					<c:if test="${userlist.confirm eq '1'}">
						<tr>
							<td>${userlist.name }</td>
							<td>${userlist.id }</td>
							<td>${userlist.addr }</td>
							<td>대기 중</td>
		
							<td><button id = "confirmBtn" onclick="confirmBtn_click('${userlist.u_num }');">수락</button></td>
						</tr>
					</c:if>
					
					<c:if test="${userlist.confirm eq '2'}">
						<tr>
							<td>${userlist.name }</td>
							<td>${userlist.id }</td>
							<td>${userlist.addr }</td>
							<td>수락 완료</td>
							<td></td>
						</tr>
					</c:if>
		
				</c:forEach>
				</tbody>
			</table>
			</div> <!-- container -->
			</div>
			 </section>
		</main>
</body>

<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</html>