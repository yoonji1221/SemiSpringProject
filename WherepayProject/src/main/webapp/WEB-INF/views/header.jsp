<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<%@ page isELIgnored="false" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>WHERE PAY에 오신 걸 환영합니다!</title>
<script src="/wherepay/resources/jquery-3.2.1.min.js"></script>
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
<header id="header" class="fixed-top ">
    <div class="container">

      <div class="logo float-left">
        <h1 class="text-light"><a href="/wherepay/home"><img src="${pageContext.request.contextPath}/resources/Moderna/assets/img/wherepaylogo.png" alt="" class="img-fluid"></a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
      </div>

      <nav class="nav-menu float-right d-none d-lg-block" style="width: 850px;">
        <ul>
          <li><a href="/wherepay/home">Home</a></li>
          <li><a href="http://ncov.mohw.go.kr/" target="_blank">About covid-19</a></li>
          <li><a href="/wherepay/search">내 주변 가맹점 찾기</a></li>
          <li><a href="/wherepay/serviceinfo">코로나 관련 서비스</a></li>
          <li class="drop-down"><a href="">MyPage</a>
            <ul>
              <li><a href="/wherepay/login">로그인</a></li>
              <li class="drop-down"><a href="/wherepay/join">회원가입</a>
                <ul>
                  <li><a href="/wherepay/joinmaster1">세대주 회원가입</a></li>
                  <li><a href="/wherepay/joinmember1">구성원 회원가입</a></li>
                </ul>
              </li>
            </ul>
          </li>
          <li><a href="contact.html">Contact Us</a></li>
        </ul>
      </nav><!-- .nav-menu -->

    </div>
  </header>
  
 
  
</body>

</html>