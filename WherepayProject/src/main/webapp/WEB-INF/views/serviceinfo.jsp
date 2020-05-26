<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
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
<div class="container">
<br><br>
 <table id="table1" class="table table-bordered table-striped";> 
<thead>
  <tr class="filters">
  <th>글번호</th>
    <th>서비스명</th>
    <th>지원형태</th>
    <th>접수기간</th></tr>
</thead>
<c:forEach items="${infolist }" var="infolist">
<tr><td >${infolist.info_num }
</td><td ><a href='/wherepay/serviceinfo/detail?info_num=${infolist.info_num}'>${infolist.info_name }</a>
</td><td>${infolist.info_how }
</td><td> ${infolist.info_when}
</td></tr>
</c:forEach>
</table>

     <div style="display: block; text-align: center;" items="${paging}" var="paging" id="pagingbtn">
         <c:if test="${paging.startPage != 1 }">
            <a
               href="<%=Path %>/serviceinfo?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
         </c:if>
         <c:forEach begin="${paging.startPage }" end="${paging.endPage }"
            var="p">
            <c:choose>
               <c:when test="${p == paging.nowPage }">
                  <b><font size="3em" >${p }</font></b>
               </c:when>
               <c:when test="${p != paging.nowPage }">
                  <a href="<%=Path %>/serviceinfo?nowPage=${p }&cntPerPage=${paging.cntPerPage}"><font size="3em" >${p }</font></a>
               </c:when>
            </c:choose>
         </c:forEach>
         <c:if test="${paging.endPage != paging.lastPage}">
            <a
               href="<%=Path %>/serviceinfo?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
         </c:if>
      </div>
</div>
<br><br>
</main>
</body>

<!-- footer add -->
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</html>
