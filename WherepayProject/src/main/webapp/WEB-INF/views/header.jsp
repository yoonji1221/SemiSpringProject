<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ page session="false"%> --%>

<%@ page isELIgnored="false" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>WHERE PAY에 오신 걸 환영합니다!</title>

<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<meta content="" name="descriptison">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="${pageContext.request.contextPath}/resources/Moderna/assets/img/logo.png" rel="icon">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,700,700i&amp;display=swap"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="${pageContext.request.contextPath}/resources/Moderna/assets/vendor/bootstrap/css/bootstrap.min.css"	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/Moderna/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/Moderna/assets/vendor/icofont/icofont.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/Moderna/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/Moderna/assets/vendor/venobox/venobox.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/Moderna/assets/vendor/owl.carousel/assets/owl.carousel.min.css"	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/Moderna/assets/vendor/aos/aos.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="${pageContext.request.contextPath}/resources/Moderna/assets/css/style.css" rel="stylesheet">
</head>
<body>
<header id="header" class="fixed-top " style="padding-top: 10px;padding-bottom: 10px;height: 69.8105px;">
<!--     <div class="container"> -->
<a href="/wherepay/home"><img src="${pageContext.request.contextPath}/resources/Moderna/assets/img/wherepaylogo.png" alt="" class="img-fluid"
style="width: 260px;
    height: 90px;
    border-left-width: 50px;
    margin-left: 250px;
    margin-bottom: 20px;
    padding-bottom: 30px;"></a>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
      

      <div class="nav-menu float-right d-none d-lg-block" style="width: 1100px;">
        <ul>  <!-- 큰 <ul> 시작 -->
          <li><a href="/wherepay/home">Home</a></li>
          <li><a href="http://ncov.mohw.go.kr/" target="_blank">About covid-19</a></li>
          <li><a href="/wherepay/search">내 주변 가맹점 찾기</a></li>
          <li><a href="/wherepay/serviceinfo">코로나 관련 서비스</a></li>
          <% if(session.getAttribute("dbid")==null){
%>
          <li class="drop-down"><a href="" disabled="disabled">MyPage</a>
            <ul>
              <li><a href="/wherepay/login">로그인</a></li>
              <li class="drop-down"><a href="" disabled="disabled">회원가입</a>
                <ul>
                  <li><a href="/wherepay/joinmaster1">세대주 회원가입</a></li>
                  <li><a href="/wherepay/joinmember1">구성원 회원가입</a></li>
                </ul>
              </li>
            </ul>
          </li>
          
         <% } else
%>
          <li><a href="/wherepay/contact">Contact Us</a></li>
  <% if(session.getAttribute("dbid")==null){
%>			<!-- <a href="/wherepay/login">로그인</a> -->

<%} 		else if(session.getAttribute("dbid")!=null) { 
%>		
			<li><a href=""><%=session.getAttribute("dbid") %>님 환영합니다</a></li>
			<li class="drop-down"><a href="/wherepay/mypage?mas_num=<%=session.getAttribute("mas_num")%>">마이페이지</a>
				<ul>
                  <li><a href="/wherepay/mypage?mas_num=<%=session.getAttribute("mas_num")%>">나의 가족 관리</a></li>
                  <li><a href="/wherepay/household?mas_num=<%=session.getAttribute("mas_num")%>&u_num=<%=session.getAttribute("u_num")%>">지출관리</a></li>
                </ul>
			</li>
		    <li><a href="/wherepay/logout">로그아웃</a></li>
		          	
<%} 
%>      	
	     </ul>	<!-- 큰 <ul> 끝 -->

	
		</div>	

         
		
    
      
      
      
<!--     </div> div class="container"  end -->
    
<!--      -->
  </header>

 
  
</body>

</html>