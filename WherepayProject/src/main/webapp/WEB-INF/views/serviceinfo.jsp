<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page isELIgnored="false" contentType = "text/html; charset=UTF-8" %>
<% String Path = request.getContextPath(); %>
<html>
<head>
<script src="/wherepay/resources/jquery-3.2.1.min.js"></script>
<title>WHERE PAY에 오신 걸 환영합니다!</title>
</head>
<body>
<h1>코로나 관련 서비스 목록입니다.</h1>

 <table id="table1" class="table table-bordered table-striped"> 
<thead>
  <tr><th>글번호</th>
    <th>서비스명</th>
    <th>접수기관</th>
    <th>접수기간</th></tr>
</thead>
<c:forEach items="${infolist }" var="infolist">
<tr><td >${infolist.info_num }
</td><td >${infolist.info_name }
</td><td>${infolist.info_center }
</td><td> ${infolist.info_when}
</td><td> <input type="button" value="상세보기" onclick="location.href='/wherepay/serviceinfo/detail?info_num=${infolist.info_num}'">
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
                  <b>${p }</b>
               </c:when>
               <c:when test="${p != paging.nowPage }">
                  <a href="<%=Path %>/serviceinfo?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
               </c:when>
            </c:choose>
         </c:forEach>
         <c:if test="${paging.endPage != paging.lastPage}">
            <a
               href="<%=Path %>/serviceinfo?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
         </c:if>
      </div>

</body>
</html>
