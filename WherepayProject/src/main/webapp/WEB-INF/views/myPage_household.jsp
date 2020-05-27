<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page isELIgnored="false" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Mypage</title>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>


<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<script type="text/javascript" src="<?php echo G5_PLUGIN_URL ?>/jquery-ui/jquery-ui.min.js"></script>
<link rel="stylesheet" href="<?php echo G5_PLUGIN_URL ?>/jquery-ui/jquery-ui.css">

<script type="text/javascript">
function cardPopup() { 
	var url = "/wherepay/searchMarket";
	window.open(url, "a", "width=800, height=400, left=100, top=50"); 
	}

function zeroPopup() { 
	var url = "/wherepay/searchMarket2";
	window.open(url, "b", "width=800, height=400, left=100, top=50"); 
	}


	$(function() {
		$("#paydate").datepicker({
			dateFormat : 'yy-mm-dd'
		});
	});
	
	

</script>

<style>
th{
font-size: large;
}
td{
font-size: medium;
}

.ui-datepicker { width: 270px; padding: 0; display: none; border: 0; margin-top: 10px;}
.ui-widget.ui-widget-content { border: 0; border-radius: 3px; overflow: hidden; background: #fff; box-shadow: 0 0 8px rgba(0,0,0,0.3) }
.ui-datepicker .ui-widget-header { position: relative; padding: 6px 0 6px 0; border: 0; background: #1e4356; color: #fff; border-radius: 0; }
</style>
</head>
<body>

 <c:forEach items="${userinfo }" var="userinfo">
  <c:set var = "username" value="${userinfo.name }"/>
 </c:forEach>
         

	<main id="main" style="margin-top: 0px;">


		<c:forEach items="${list }" var="userlist">
			<c:if test="${userlist.confirm eq '0'}">

				<section class="breadcrumbs"
					style="margin-top: 80px; height: 100px;">
					<div class="container">
						<div class="section-title">
							<div class="d-flex justify-content-between align-items-center">
								<h2 style="color:#000080; ">${username}님의 마이페이지</h2>
							</div>
						</div>
					</div>
				</section>
				
				
				
	<section class="skills aos-init aos-animate" data-aos="fade-up" style="padding-top: 30px;padding-bottom: 30px;">
		<div class="container">

				<div class="section-title">
					<h2>가계부</h2>
					<h3>${userlist.name }님 가족의  정부재난지원금  사용  내역을 조회할 수 있습니다.</h3>
					<h3>가족들과 함께 사용 내역을 공유해보세요.</h3>
					<h3>잔액 조회를 통해 남은 지원금을 확인하세요.</h3>
				</div>
		</div>
	</section> <!-- 가계부 -->
	
	
				<c:set var="mas_num" value="${userlist.mas_num }" />
				<c:set var="u_num" value="${userlist.u_num }" />
				<c:set var="mas_name" value="${userlist.name}" />
			</c:if>
		</c:forEach>


		<c:forEach items="${detaillist }" var="detaillist">
			<c:set var="familynum" value="${detaillist.familynum }" />
			<c:set var="howtoget" value="${detaillist.howtoget}" />
		</c:forEach>




	<section class="skills aos-init aos-animate" data-aos="fade-up" style="padding-top: 30px;padding-bottom: 30px;">
		<div class="container">

				<div class="section-title">
					<h2>지원금 사용 유형 " ${howtoget } "</h2>
				</div>


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
					
					
		<section class="team aos-init aos-animate" data-aos="fade-up" data-aos-easing="ease-in-out" data-aos-duration="500" style=" padding-top: 0px;padding-bottom: 0px;">
	      <div class="container">
	
	        <div class="row">
					
					<table class="table">
				
					<tr>
					<td style="width:600px; text-align:center;"> <h4>지원 받은 금액</h4></td>
					<td style="width:600px; text-align:center;"> <h4>${totalMoney }원</h4></td>
					</tr>
					
					<tr>
					<td style="width:600px; text-align:center;"><h4>현재까지 사용한 금액</h4></td>
					<td style="width:600px; text-align:center;"><h4>${useMoney}원</h4></td>
					</tr>
					
					<tr>
					<td style="width:600px; text-align:center;"><h4>사용 가능한 금액</h4></td>
					<td style="width:600px; text-align:center;">
					<script>
						var total = parseInt(${totalMoney});
						var use = parseInt(${useMoney});
										
						var money = total - use;
						document.write("<h4>" + money+"원</h4>");			
					</script>
					</td>
					</tr>
					
					<tr><td></td> <td></td></tr>
					
					</table>
					
			</div>
		</div>
	</section>
					
				</div>
		</section> <!-- 지원금 사용 유형 -->
		
		
		

	<section class="skills aos-init aos-animate" data-aos="fade-up" style="padding-top: 30px;padding-bottom: 30px;">
		<div class="container">

			<div class="section-title">
				<h2>지출 내역 입력</h2>
			</div>
												
		<section class="team aos-init aos-animate" data-aos="fade-up" data-aos-easing="ease-in-out" data-aos-duration="500" style="padding-left: 0px; padding-top: 0px;padding-bottom: 0px;">
	      <div class="container">
	
	        <div class="row">
	        
		<form action="/wherepay/household/insertPayment?mas_num=${mas_num}" class="form-inline" id="input" method="get">
			 
			  <div class="form-group">
				
			    <label for="exampleInputDate" style="font-size: medium;"> 날짜 &nbsp;</label>
				<input type="text" id="paydate" name="paydate"> &nbsp; &nbsp;		
			  </div>
			  <div class="form-group">
			    <label for="exampleInputMoney" style="font-size: medium;">금액 &nbsp;</label>
				<input type="text" id="money" name="money" > <label for="exampleInputMoney" style="font-size: medium;">원</label> &nbsp; &nbsp;
			  </div>
			   <div class="form-group">
			    <label for="exampleInputStore" style="font-size: medium;">가게명 &nbsp;</label>
				<input type="text" id="ppInput" name="store_name" placeholder="매장을 검색하세요" style="width:200px;">&nbsp;&nbsp;
				 <c:choose>
								<c:when test="${howtoget eq '신용카드/체크카드' }">
									<c:set var="sam_num" value="1" />
									<input type="hidden" id="pInput" name="sam_num">
									<input type="hidden" id="check_num" name="check_num" value='1'>
									<input type="button" value="매장 검색" class="btn btn-default" onclick="cardPopup();" style="background-color:#1e4356;color:#ffffff;padding-left: 7px;padding-right: 7px;padding-top: 3px;padding-bottom: 3px; font-size: medium;" />
								</c:when>
								<c:when test="${howtoget eq '선불카드' }">
									<c:set var="z_num" value="2" />
									<input type="hidden" id="pInput" name="z_num">
									<input type="hidden" id="check_num" name="check_num" value='2'>
									<input type="button" value="매장 검색" class="btn btn-default" onclick="zeroPopup();" style="background-color:#1e4356;color:#ffffff;padding-left: 7px;padding-right: 7px;padding-top: 3px;padding-bottom: 3px; font-size: medium;"/>
								</c:when>
								<c:when test="${howtoget eq '상품권' }">
									<c:set var="z_num" value="2" />
									<input type="hidden" id="pInput" name="z_num">
									<input type="hidden" id="check_num" name="check_num" value='2'>
									<input type="button" value="매장 검색" class="btn btn-default" onclick="zeroPopup();" style="background-color:#1e4356;color:#ffffff;padding-left: 7px;padding-right: 7px;padding-top: 3px;padding-bottom: 3px; font-size: medium;"/>
								</c:when>
							</c:choose>
				 </div>
				  <div class="form-group">
				    &nbsp;&nbsp;<label for="exampleInputStore"  style="font-size: medium;">메모 &nbsp;</label>
				     <input type="text" id="memo" name="memo"  style="width:200px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				  </div>
				  
				  <input type="hidden" id="mas_num" name="mas_num" value='${mas_num}'>	
				  <input type="hidden" id="u_num" name="u_num" value='<%=request.getParameter("u_num")%>'>		

				  <button type="submit" class="btn btn-primary" style="font-size: medium; background-color:#1e4356;color:#ffffff;padding-left: 15px;padding-right: 15px;padding-top: 3px;padding-bottom: 3px;">입력</button>
				
	              </form>
	              
				</div>
		       </div>
		       
		    </section>

			</div>
		</section> <!-- 지출내역 입력 끝 -->
		
		
		
		
	<section class="skills aos-init aos-animate" data-aos="fade-up" style="padding-top: 30px;padding-bottom: 30px;">
		<div class="container">

			<div class="section-title">
				<h2>지출 정보 조회</h2>
			</div>	
		
				<table class="table">
					<thead>
						<tr>
							<th>날짜</th>
							<th>금액</th>
							<th>사용 매장</th>
							<th>사용자</th>
							<th>메모</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${cardlist }" var="cardlist">
						
						<c:set var="u_num" value="${cardlist.u_num }" />
						<c:set var="u_num_session" value='<%=request.getParameter("u_num") %>' />
						
							<tr>
								<td>${cardlist.paydate }</td>
								<td>${cardlist.money }원</td>
								<td>${cardlist.sam_name }</td>
								<td>${cardlist.name }</td>
								<td>${cardlist.memo }</td>
								<td>
								<script>
								var unum= parseInt(${u_num});
								var sessionnum = parseInt(${u_num_session});
												
								if(unum == sessionnum){
									document.write("<button onclick =\"location.href='/wherepay/deletePayment?u_num=${cardlist.u_num }&pay_num=${cardlist.pay_num }'\" class=\"btn btn-primary\" style=\"font-size: medium; background-color:#1e4356;color:#ffffff;padding-left: 15px;padding-right: 15px;padding-top: 3px;padding-bottom: 3px;\">삭제</button>");
								}									
								</script>
								</td>
								
							
							</tr>
						</c:forEach>
						<c:forEach items="${zerolist }" var="zerolist">
						<c:set var="u_num" value="${zerolist.u_num }" />
						<c:set var="u_num_session" value='<%=request.getParameter("u_num") %>' />
						
							<tr>
								<td>${zerolist.paydate }</td>
								<td>${zerolist.money }원</td>
								<td>${zerolist.z_name }</td>
								<td>${zerolist.name }</td>
								<td>${zerolist.memo }</td>
								<td>
								<script>
								var unum= parseInt(${u_num});
								var sessionnum = parseInt(${u_num_session});
												
								if(unum == sessionnum){
									document.write("<button onclick =\"location.href='/wherepay/deletePayment?u_num=${zerolist.u_num }&pay_num=${zerolist.pay_num }'\" class=\"btn btn-primary\" style=\" font-size: medium; background-color:#1e4356;color:#ffffff;padding-left: 15px;padding-right: 15px;padding-top: 3px;padding-bottom: 3px;\">삭제</button>");
								}									
								</script>
								</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>

			</div>
			<!-- container -->
		</section>
		
		
		
		
		<section class="skills aos-init aos-animate" data-aos="fade-up" style="padding-top: 30px;padding-bottom: 30px;">
		<div class="container">

			<div class="section-title">
				<h2>구성원 별 정부재난지원금 사용 내역 조회</h2>
			</div>
												
		<section class="team aos-init aos-animate" data-aos="fade-up" data-aos-easing="ease-in-out" data-aos-duration="500" style="padding-left: 0px; padding-top: 0px;padding-bottom: 0px;">
	      <div class="container">
	
	        <div class="row">
	        
	        <jsp:include page="/WEB-INF/views/test.jsp"></jsp:include>
	        </div>
	       </div>
	      </section>
	      
	     </div>
	     </section>
	</main>


</body>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</html>