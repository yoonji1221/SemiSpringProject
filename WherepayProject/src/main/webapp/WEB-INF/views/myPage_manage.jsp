<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String path = request.getContextPath();%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage</title>
<script src="/wherepay/resources/jquery-3.2.1.min.js"></script>
<jsp:include page="/WEB-INF/views/leftMenu.jsp"></jsp:include>
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

<style type="text/css">
table {
	border: blue;
	border-collapse: collapse
}

td, tr, th {
	border: gray solid;
	text-align: center;
	vertical-align: baseline;
	width: 200px;
}
</style>


</head>
<body>

<div style="position:fixed; top:70px; left:250px;">
	<h2>나의 가구 관리</h2>
	<c:forEach items="${list }" var="userlist">
		<c:if test="${userlist.confirm eq '0'}">
			<h3>${userlist.name }세대주님의마이페이지</h3>
			<h4>${userlist.name }님의가족 구성원 신청 현황</h4>
			<c:set var = "mas_num" value="${userlist.mas_num }"/>
		</c:if>
	</c:forEach>
	세대주 번호 : ${mas_num}

	<table>
		<tr>
			<th>이름</th>
			<th>아이디</th>
			<th>주소</th>
			<th>신청 상태</th>
			<th></th>
		</tr>
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
					<td><button>정보 보기</button></td>
				</tr>
			</c:if>

		</c:forEach>
	</table>
	
</div>

</body>
</html>