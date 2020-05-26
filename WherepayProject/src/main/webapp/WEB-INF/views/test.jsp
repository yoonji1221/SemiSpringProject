@@ -1,5 +1,5 @@
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta charset="UTF-8">
<title>Mypage</title>

<script type="text/javascript">
	
function cardPopup() { 
	window.open("searchMarket", "a", "width=500, height=500, left=100, top=50"); 
	}

function zeroPopup() { 
	window.open("searchMarket2", "b", "width=500, height=500, left=100, top=50"); 
	}
</script>

<style type="text/css">
 td, tr, th {
	border: gray solid;
	text-align: center;
	vertical-align: baseline;
	width: 200px;
	width: 300px;
}
</style>

</head>
<body>

	<div style="position: fixed; top: 70px; left: 250px;">
	<%-- <div style="position: fixed; top: 70px; left: 250px;">--%>
		<h2>가계부</h2>
		<c:forEach items="${list }" var="userlist">
			<c:if test="${userlist.confirm eq '0'}">
				<h3>${userlist.name }세대주님의마이페이지</h3>
				<h4>${userlist.name }님의정부재난지원금사용 내역</h4>
				<c:set var="mas_num" value="${userlist.mas_num }" />
				<c:set var="u_num" value="${userlist.u_num }" />
				<c:set var="mas_name" value="${userlist.name}" />
			</c:if>
		</c:forEach>
		
		<c:forEach items="${detaillist }" var="detaillist">
			<c:set var="howtoget" value="${detaillist.howtoget}" />
		</c:forEach>

		${mas_name }님의 가족은 ${familynum }입니다.<br> 지원금 사용 유형은 ${howtoget }입니다.

		<c:choose>
			<c:when test="${familynum eq '1' }">
				<c:set var="totalMoney" value="400,000" />
				<c:set var="totalMoney" value="400000" />
			</c:when>
			<c:when test="${familynum eq '2' }">
				<c:set var="totalMoney" value="600,000" />
				<c:set var="totalMoney" value="600000" />
			</c:when>
			<c:when test="${familynum eq '3' }">
				<c:set var="totalMoney" value="800,000" />
				<c:set var="totalMoney" value="800000" />
			</c:when>
			<c:when test="${familynum eq '4' }">
				<c:set var="totalMoney" value="1,000,000" />
				<c:set var="totalMoney" value="1000000" />
			</c:when>

		</c:choose>

		

		<div style="border: 1px solid pink;">
			<h3>지출 내역 입력</h3>
			<form action="/wherepay/household/insertPayment?mas_num=${mas_num}" method="get">
				<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
				<script src="//code.jquery.com/jquery.min.js"></script>
				<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
		
				<script>
					$(function() {
						$("#datepicker1").datepicker({
						$("#paydate").datepicker({
							dateFormat : 'yy-mm-dd'
						});
					});
				</script>
		
				날짜 <input type="text" id="paydate" name="paydate"><br>
				금액<input type="text" id = "money" name="money">원<br> 
				가게명 <input type="text" id="ppInput" name="store_name" placeholder="매장을 검색하세요">
				<%-- 사용자<input type="text" id = "u_num" name="u_num"><br>	--%>
				
				<c:choose>
					<c:when test="${howtoget eq '신용카드/체크카드' }">
						<c:set var="sam_num" value="1" />
						<input type="hidden" id="pInput" name="sam_num">
						<input type="hidden" id="check_num" name="check_num" value='1'>
						<input type="button" value="매장 검색" onclick="cardPopup();" />
					</c:when>
					<c:when test="${howtoget eq '선불카드' }">
						<c:set var="z_num" value="2" />
						<input type="hidden" id="pInput" name="z_num">
						<input type="hidden" id="check_num" name="check_num" value='2'>
						<input type="button" value="매장 검색" onclick="zeroPopup();" />
					</c:when>
					<c:when test="${howtoget eq '서울사랑상품권' }">
						<c:set var="z_num" value="1" />
						<input type="hidden" id="pInput" name="z_num">
						<input type="hidden" id="check_num" name="check_num" value='2'>
						<input type="button" value="매장 검색" onclick="zeroPopup();" />
					</c:when>
				</c:choose>
				
				<br>메모 <input type="text" id="memo" name="memo">
				
				 		
				<input type="hidden" id="mas_num" name="mas_num" value='${mas_num}'>	
				<input type="hidden" id="u_num" name="u_num" value='<%=request.getParameter("u_num")%>'>				
				<br> <input type="submit" value="입력">
			</form>
		</div>

		


		<h3>지출 내역</h3>

	<h3>지출 내역</h3>
	<table>
	<tr> <th>날짜</th> <th>금액</th> <th>사용 매장</th> <th>사용자</th> <th>메모</th></tr>
	<c:forEach items="${cardlist }" var="cardlist">
		<tr>
		<td>${cardlist.paydate }</td>
		<td>${cardlist.money }원</td>
		<td>${cardlist.sam_name }</td>
		<td>${cardlist.name }</td>
		<td>${cardlist.memo }</td>
		</tr>
	</c:forEach>
	
	<c:forEach items="${zerolist }" var="zerolist">
		<tr>
		<td>${zerolist.paydate }</td>
		<td>${zerolist.money }원</td>
		<td>${zerolist.z_name }</td>
		<td>${zerolist.name }</td>
		<td>${zerolist.memo }</td>
		</tr>
	</c:forEach>
	</table>




	</div>
	<%--</div>--%>

</body>
</html>