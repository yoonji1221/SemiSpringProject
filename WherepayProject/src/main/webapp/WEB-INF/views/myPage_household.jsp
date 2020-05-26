<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<%@ page isELIgnored="false" contentType = "text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<script src="/wherepay/resources/jquery-3.2.1.min.js"></script>
<meta charset="UTF-8">
<title>Mypage</title>
 <meta content="" name="descriptison">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,700,700i&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
  <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
  
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

<script type="text/javascript">
function cardPopup() { 
	window.open("searchMarket", "a", "width=800, height=400, left=100, top=50"); 
	}

function zeroPopup() { 
	window.open("searchMarket2", "b", "width=800, height=400, left=100, top=50"); 
	}
</script>


<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>


</head>
<body>

  <main id="main" style="margin-top: 0px;">
  

		<c:forEach items="${list }" var="userlist">
			<c:if test="${userlist.confirm eq '0'}">
			
			<section class="breadcrumbs" style="margin-top: 80px;height: 100px;">
		         <div class="container">
		            <div class="section-title">
		               <div class="d-flex justify-content-between align-items-center">
		                   <h2 style="color:#000080; ">${userlist.name}세대주님의 마이페이지</h2>
		               </div>
					</div>			
		          </div>
     		 </section>
     		 
     		 <div class="section-title">
				<h3>가계부</h3>
				<h4>${userlist.name }님의 정부재난지원금 사용 내역</h4>				
			 </div>
			 
				<c:set var="mas_num" value="${userlist.mas_num }" />
				<c:set var="u_num" value="${userlist.u_num }" />
				<c:set var="mas_name" value="${userlist.name}" />
			</c:if>
		</c:forEach>
      

		<c:forEach items="${detaillist }" var="detaillist">
			<c:set var="familynum" value="${detaillist.familynum }" />
			<c:set var="howtoget" value="${detaillist.howtoget}" />
		</c:forEach>
		
	<section class="team aos-init aos-animate" data-aos="fade-up">
      <div class="container">
      
       
     <section class="skills aos-init aos-animate" data-aos="fade-up">
      <div class="container">

        <div class="section-title">
          <h2>지원금 사용 유형  " ${howtoget } "</h2>
        
         
         <c:choose>
			<c:when test="${familynum eq '1' }">
				<c:set var="totalMoney" value="400000" />
			</c:when>
			<c:when test="${familynum eq '2' }">
				<c:set var="totalMoney" value="600000" />
			</c:when>
			<c:when test="${familynum eq '3' }">
				<c:set var="totalMoney" value="800000" />
			</c:when>
			<c:when test="${familynum eq '4' }">
				<c:set var="totalMoney" value="1000000" />
			</c:when>
		</c:choose>

    
			<h3>총 지원금 : ${totalMoney }원</h3>
			<h3>사용한 지원금 : ${useMoney}원</h3>
	          <script>
				var total = parseInt(${totalMoney});
				var use = parseInt(${useMoney});
				var money = total - use;
				document.write("<h3>남은 지원금 : "+money+"원</h3>");			
				</script>
         </div>
          </div>
    </section>    
        
  <section class="skills aos-init aos-animate" data-aos="fade-up">
      <div class="container">

        <div class="section-title">
			<h2>지출 내역 입력</h2>
		</div>
			<form action="/wherepay/household/insertPayment?mas_num=${mas_num}" method="get">
				<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
				<script src="//code.jquery.com/jquery.min.js"></script>
				<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
		
				<script>
					$(function() {
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
    </section>    

	<h3>지출 내역</h3>
	<table class="table">
	<thead>
	<tr> <th>날짜</th> <th>금액</th> <th>사용 매장</th> <th>사용자</th> <th>메모</th></tr>
	</thead>
	<tbody>
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
	
	</tbody>
	</table>
	
	</div> <!-- container -->
	 </section>
  </main>


</body>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</html>