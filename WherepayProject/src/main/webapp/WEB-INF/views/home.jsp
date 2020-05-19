<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<c:forEach items="${list }" var="userlist"> 
<h3><tr><td>${userlist.stu_no }
</td><td>${userlist.stu_name }
</td><td>${userlist.stu_dept }
</td><td> ${userlist.stu_grade}
</td><td> ${userlist.stu_class}
</td><td> ${userlist.stu_gender}
</td><td> ${userlist.stu_height}
</td><td> ${userlist.stu_weight}

</h3>
</c:forEach>
</body>
</html>
