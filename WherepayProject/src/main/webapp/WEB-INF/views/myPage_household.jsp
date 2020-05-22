<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage</title>
<script src="/wherepay/resources/jquery-3.2.1.min.js"></script>
<jsp:include page="/WEB-INF/views/leftMenu.jsp"></jsp:include>
<script type="text/javascript">
	
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

	<div style="position: fixed; top: 70px; left: 250px;">
		<h2>가계부</h2>
		<c:forEach items="${list }" var="userlist">
			<c:if test="${userlist.confirm eq '0'}">
				<h3>${userlist.name }세대주님의마이페이지</h3>
				<h4>${userlist.name }님의정부재난지원금사용 내역</h4>
				<c:set var="mas_num" value="${userlist.mas_num }" />
				<c:set var="mas_name" value="${userlist.name}" />
			</c:if>
		</c:forEach>

		<c:forEach items="${detaillist }" var="detaillist">
			<c:set var="familynum" value="${detaillist.familynum }" />
			<c:set var="howtoget" value="${detaillist.howtoget}" />
		</c:forEach>

		${mas_name }님의 가족은 ${familynum }입니다.<br> 지원금 사용 유형은 ${howtoget }입니다.

		<c:choose>
			<c:when test="${familynum eq '1인' }">
				<c:set var="totalMoney" value="400,000" />
			</c:when>
			<c:when test="${familynum eq '2인' }">
				<c:set var="totalMoney" value="600,000" />
			</c:when>
			<c:when test="${familynum eq '3인' }">
				<c:set var="totalMoney" value="800,000" />
			</c:when>
			<c:when test="${familynum eq '4인 이상' }">
				<c:set var="totalMoney" value="1,000,000" />
			</c:when>

		</c:choose>

		<h3>총 지원금 : ${totalMoney }원</h3>
		<h3>남은 지원금 : 원</h3>

		<div style="border: 1px solid pink;">
			<h3>지출 내역 입력</h3>
			<form action="/household/insertPayment?mas_num=${mas_num}" method="post">
				<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
				<script src="//code.jquery.com/jquery.min.js"></script>
				<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
		
				<script>
					$(function() {
						$("#datepicker1").datepicker({
							dateFormat : 'yy-mm-dd'
						});
					});
				</script>
		
				날짜 <input type="text" id="datepicker1" name="paydate"><br> 
				사용처 <input type="text" name="storeName"><br> 
				금액 <input type="text" name="money"> 원<br> 
				사용자 <input type="text" name="cid"><br> 
				<input type="submit" value="입력">
			</form>
		</div>

		


		<h3>지출 내역</h3>





	</div>

</body>
</html>