<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page isELIgnored="false" contentType = "text/html; charset=UTF-8" %>
<% String Path = request.getContextPath(); %>
<html>
<head>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="/wherepay/resources/jquery-3.2.1.min.js"></script>

<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>


</head>

<body>
<main id="main">
		<section class="breadcrumbs" style="margin-top: 80px;height: 100px;">
			<div class="container">
				<div class="section-title">
					<div class="d-flex justify-content-between align-items-center">
						<h2>코로나19 관련 정부지원 맞춤형 서비스 정보</h2>
						<ol>
							<li><a href="/wherepay/home"><font size="3px" >Home</font></a></li>
							<li><font size="3px" >코로나 관련 서비스</font></li>
						</ol>
					</div>
</div>
				</div>
		</section>
<section class="features">
<div class="container">


<c:forEach items="${detaillist }" var="detaillist">

<c:set var="info_name" value="${detaillist.info_name }" />
<c:set var="info_center" value="${detaillist.info_center }" />
<c:set var="info_goal" value="${detaillist.info_goal }" />
<c:set var="info_how" value="${detaillist.info_how }" />
<c:set var="info_detail" value="${detaillist.info_detail }" />
<c:set var="info_select" value="${detaillist.info_select }" />
<c:set var="info_who" value="${detaillist.info_who }" />
<c:set var="info_when" value="${detaillist.info_when }" />
<c:set var="info_step" value="${detaillist.info_step }" />
<c:set var="info_paper" value="${detaillist.info_paper }" />
<c:set var="info_phone" value="${detaillist.info_phone }" />
<c:set var="info_url" value="${detaillist.info_url }" />
</c:forEach>
<br>
<h1><${info_name}></h1>
<table class="table table-bordered table-striped">

<thead>
  <tr>
    <td class="tg-0pky"style=" width: 96px;" nowrap>서비스명</td>
    <td class="tg-0pky">${info_name}</td>
    <td class="tg-0pky" style=" width: 96px;" nowrap>소관기관</td>
    <td class="tg-0pky">${info_center}</td>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-0pky" rowspan="3">서비스목적</td>
    <td class="tg-0pky" rowspan="3">${info_goal}</td>
    <td class="tg-0pky">지원형태</td>
    <td class="tg-0pky">${info_how}</td>
  </tr>
  <tr>
    <td class="tg-0pky">신청기한</td>
    <td class="tg-0pky">${info_when}</td>
  </tr>
  <tr>
    <td class="tg-0pky">문의처 전화번호</td>
    <td class="tg-0pky">${info_phone}</td>
  </tr>
  <tr>
    <td class="tg-0pky" rowspan="2">구비서류</td>
    <td class="tg-0pky" rowspan="2">${info_paper}</td>
    <td class="tg-0pky">서비스 상세주소</td>
    <td class="tg-0pky"><a href="${info_url}" target="_blank" >${info_url}</a></td>
  </tr>
  <tr>
    <td class="tg-0pky">신청절차</td>
    <td class="tg-0pky">${info_step}</td>
  </tr>
  <tr>
    <td class="tg-0pky">선정기준</td>
    <td class="tg-0pky">${info_select}</td>
    <td class="tg-0pky">지원대상</td>
    <td class="tg-0pky">${info_who}</td>
  </tr>
  <tr>
    <td class="tg-0pky">지원내용</td>
    <td class="tg-0pky" colspan="3">${info_detail}</td>
  </tr><br>
</tbody>
</table>
<div style="padding-top: 30px;" align='right'><a id="button1" style="align:right;background-color:#1e4356;color:#ffffff;padding-left: 7px;padding-right: 7px;padding-top: 8px;padding-bottom: 5px;"  href="/wherepay/serviceinfo">
<font size="2px" color="#ffffff" >목록보기</font></a>
      </div>
        

</div></section></main>
</body>

<!-- footer add -->
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</html>