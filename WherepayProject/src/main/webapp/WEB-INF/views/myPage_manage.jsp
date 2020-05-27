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
<style type="text/css">
th{
font-size: large;
}
td{
font-size: medium;
}
</style>
</head>
<body>

 <c:forEach items="${userinfo }" var="userinfo">
  <c:set var = "username" value="${userinfo.name }"/>
 </c:forEach>
         

<%
if(Integer.parseInt(session.getAttribute("confirm").toString()) == 0){
%>

   <main id="main" style="margin-top: 0px;">
      
          <c:forEach items="${list }" var="userlist">
         <c:if test="${userlist.confirm eq '0'}">
         

           <section class="breadcrumbs" style="margin-top: 80px;height: 100px;">
               <div class="container">
                  <div class="section-title">
                     <div class="d-flex justify-content-between align-items-center">
                         <h2 style="color:#000080; ">${username}님의 마이페이지</h2>
                     </div>
               </div>         
                </div>
            </section>
   <section class="skills aos-init aos-animate" data-aos="fade-up" style="padding-top: 30px;padding-bottom: 30px;">
      <div class="container">

            <div class="section-title">
               <h2>구성원 관리</h2>
               <h3>${userlist.name }님의  가족 구성원 신청 현황입니다.</h3>
               <h3>가족들과 함께 지원금을 사용해보세요.</h3>
            </div>
      </div>
   </section> <!-- 구성원관리 -->

         
                    
          <div class="section-title" >
            <h2>${userlist.name }님의 가족 구성원 신청 현황</h2>
           </div>
           
            <c:set var = "mas_num" value="${userlist.mas_num }"/>
         </c:if>
      </c:forEach>
    
<section class="team aos-init aos-animate" data-aos="fade-up" data-aos-easing="ease-in-out" data-aos-duration="500" style="padding-left: 0px; padding-top: 0px;padding-bottom: 0px;">
	      <div class="container">
	
       <div class="row">
         <table class="table">
          <thead>
            <tr>
               <th style="width:600px; text-align:center;">이름</th>
               <th style="width:600px; text-align:center;">아이디</th>
               <th style="width:600px; text-align:center;">주소</th>
               <th style="width:600px; text-align:center;">신청 상태</th>
               <th style="width:600px; text-align:center;"></th>
            </tr>
            
            </thead>
            <tbody>
            <c:forEach items="${list }" var="userlist">
               <c:if test="${userlist.confirm eq '1'}">
                  <tr>
                     <td style="width:600px; text-align:center;">${userlist.name }</td>
                     <td style="width:600px; text-align:center;">${userlist.id }</td>
                     <td style="width:600px; text-align:center;">${userlist.addr }</td>
                     <td style="width:600px; text-align:center;">대기 중</td>
      
                     <td style="width:600px; text-align:center;"><button id = "confirmBtn" onclick="confirmBtn_click('${userlist.u_num }');">수락</button></td>
                  </tr>
               </c:if>
               
               <c:if test="${userlist.confirm eq '2'}">
                  <tr>
                     <td style="width:600px; text-align:center;">${userlist.name }</td>
                     <td style="width:600px; text-align:center;">${userlist.id }</td>
                     <td style="width:600px; text-align:center;">${userlist.addr }</td>
                     <td style="width:600px; text-align:center;">수락 완료</td>
                     <td style="width:600px; text-align:center;"></td>
                  </tr>
               </c:if>
      
            </c:forEach>
            </tbody>
         </table>
         </div> <!-- container -->
         </div>
          </section>
      </main>
      
      <%}else{ %>
      <main id="main" style="margin-top: 0px;">
      
       <c:forEach items="${list }" var="userlist">
         <c:if test="${userlist.confirm eq '0'}">
         
           <section class="breadcrumbs" style="margin-top: 80px;height: 100px;">
               <div class="container">
                  <div class="section-title">
                     <div class="d-flex justify-content-between align-items-center">
                         <h2 style="color:#000080; ">${username}님의 마이페이지</h2>
                     </div>
               </div>         
                </div>
            </section>
            
            <section class="skills aos-init aos-animate" data-aos="fade-up" style="padding-top: 30px;padding-bottom: 30px;">
		      <div class="container">
		
		            <div class="section-title">
		               <h2>구성원 정보</h2>
		               <h3>${userlist.name }이 세대주인  가족 구성원입니다.</h3>
		               <h3>가족들과 함께 지원금을 사용해보세요.</h3>
		            </div>
		      </div>
		   </section> <!-- 구성원관리 -->            
            <c:set var = "mas_num" value="${userlist.mas_num }"/>
         </c:if>
      </c:forEach>
    
		<section class="team aos-init aos-animate" data-aos="fade-up" data-aos-easing="ease-in-out" data-aos-duration="500" style="padding-left: 0px; padding-top: 0px;padding-bottom: 0px;">
	      <div class="container">
	
       <div class="row">
         <table class="table">
          <thead>
            <tr>
               <th style="width:600px; text-align:center;">이름</th>
               <th style="width:600px; text-align:center;">아이디</th>
               <th style="width:600px; text-align:center;">주소</th>
            </tr>
            
            </thead>
            <tbody>
            <c:forEach items="${list }" var="userlist">
              
                  <tr>
                     <td style="width:600px; text-align:center;">${userlist.name }</td>
                     <td style="width:600px; text-align:center;">${userlist.id }</td>
                     <td style="width:600px; text-align:center;">${userlist.addr }</td>
                  </tr>            
            </c:forEach>
            </tbody>
         </table>
         </div> <!-- container -->
         </div>
          </section>
            
      <h3> 구성원이얌 </h3>
      </main>
      <%} %>
</body>

<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</html>