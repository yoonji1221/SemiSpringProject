<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page isELIgnored="false" contentType = "text/html; charset=UTF-8" %>
<html>
<head>
<script src="/wherepay/resources/jquery-3.2.1.min.js"></script>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${test}. </P>

<c:forEach items="${zerolist }" var="userlist"> 
<tr><td>${userlist.z_num }
</td><td>${userlist.z_name }
</td><td>${userlist.z_addr }
</td><td> ${userlist.z_stheme}
</td></tr>
</c:forEach>

</body>
</html>
