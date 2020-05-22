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
<h1>서비스 detail</h1>

<table> 
<thead>
  <tr>
    <th>서비스명</th>
    <th>소관기관</th>
    <th>서비스목적</th>
    <th>지원형태</th>
    <th>지원내용</th>
    <th>선정기준</th>
    <th>지원대상</th>
    <th>신청기한</th>
    <th>신청절차</th>
    <th>구비서류</th>
    <th>문의처 전화번호</th>
    <th>서비스 상세주소</th>
    </tr>
</thead>
<c:forEach items="${detaillist }" var="detaillist">
<tr><td >${detaillist.info_name }
</td><td>${detaillist.info_center }
</td><td> ${detaillist.info_goal}
</td><td> ${detaillist.info_how}
</td><td> ${detaillist.info_detail}
</td><td> ${detaillist.info_select}
</td><td> ${detaillist.info_who}
</td><td> ${detaillist.info_when}
</td><td> ${detaillist.info_step}
</td><td> ${detaillist.info_paper}
</td><td> ${detaillist.info_phone}
</td><td><a href="${detaillist.info_url}" target="_blank" > ${detaillist.info_url}</a>
</td>
</tr>
</c:forEach>
</table>

</body>
</html>