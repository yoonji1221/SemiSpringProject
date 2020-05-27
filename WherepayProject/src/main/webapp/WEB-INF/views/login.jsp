<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="/wherepay/resources/Login_v10/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/wherepay/resources/Login_v10/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/wherepay/resources/Login_v10/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/wherepay/resources/Login_v10/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/wherepay/resources/Login_v10/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/wherepay/resources/Login_v10/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/wherepay/wherepay/resources/Login_v10/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/wherepay/resources/Login_v10/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/wherepay/resources/Login_v10/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/wherepay/resources/Login_v10/css/util.css">
	<link rel="stylesheet" type="text/css" href="/wherepay/resources/Login_v10/css/main.css">
<!--===============================================================================================-->


<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>


<script src="/wherepay/resources/jquery-3.2.1.min.js"></script>


</head>
<body>



<section class="portfolio">
  
<div class="container">


<div class="container-login100">
			<div class="wrap-login100 p-t-50 p-b-90">
				<form class="login100-form validate-form flex-sb flex-w"
				action="/wherepay/login" method="post">
				
					<span class="login100-form-title p-b-51" style="color: #1E4356;">
						Login
					</span>

					
					<div class="wrap-input100 validate-input m-b-16" data-validate="Username is required">
						
						<input class="input100" type="text" name="id"  placeholder="아이디를 입력하세요">
						
						<span class="focus-input100"></span>
					</div>
					
					
					<div class="wrap-input100 validate-input m-b-16" data-validate="Password is required">
						
						<input class="input100" type="password" name="pw"  placeholder="비밀번호를 입력하세요" >	
						
						<span class="focus-input100"></span>
					</div>
					
					<div class="flex-sb-m w-full p-t-3 p-b-24">
						<div class="contact100-form-checkbox">
							
						</div>

						<div>
							<a href="#" class="txt1" style="color: #1E4356;">
								sign up now
							</a>
						</div>
					</div>

					<div class="container-login100-form-btn m-t-17">
						<button class="login100-form-btn" type ="submit" style="background-color: #1E4356;">
							Login
						</button>
						
					<!-- 	<input type="submit"  value="Login"> -->
						
					</div>

				</form>
			</div>
		</div>

	</div>
</section>



<script src="/resources/Login_v10/vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="/resources/Login_v10/vendor/animsition/js/animsition.min.js"></script>
<script src="/resources/Login_v10/vendor/bootstrap/js/popper.js"></script>
<script src="/resources/Login_v10/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/Login_v10/vendor/select2/select2.min.js"></script>
<script src="/resources/Login_v10/vendor/daterangepicker/moment.min.js"></script>
<script src="/resources/Login_v10/vendor/daterangepicker/daterangepicker.js"></script>
<script src="/resources/Login_v10/vendor/countdowntime/countdowntime.js"></script>
<script src="/resources/Login_v10/js/main.js"></script>

</body>
<!-- footer add -->
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</html>