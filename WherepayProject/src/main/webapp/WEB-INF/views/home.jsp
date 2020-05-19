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
<h3><tr><td>${userlist.z_num }
</td><td>${userlist.z_name }
</td><td>${userlist.z_addr }
</td><td> ${userlist.z_stheme}

</h3>
</c:forEach>
</body>
</html>
