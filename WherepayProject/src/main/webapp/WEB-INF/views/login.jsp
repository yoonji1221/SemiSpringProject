<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="/wherepay/login" method="post">
					
						
						<input type="text" name="id"  placeholder="아이디를 입력하세요" required="required">
					
				
					
						<input type="password" name="pw"  placeholder="비밀번호를 입력하세요" required="required">					
					
				
						<input type="submit"  value="Login">
						<input onclick="location.href='/wherepay/home'" type="button"  value="돌아가기">
				
				</form>		

</body>
</html>