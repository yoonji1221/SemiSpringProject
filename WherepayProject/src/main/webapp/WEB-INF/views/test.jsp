<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page isELIgnored="false" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
   
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    
      var u_numlist = new Array();
      var namelist = new Array();
      var totallist = new Array();
      
      <c:forEach items="${grouplist }" var="grouplist">
      u_numlist.push("${grouplist.u_num }");
      namelist.push("${grouplist.name }");      
      </c:forEach>
      
      <c:forEach items="${paylist }" var="paylist">
      totallist.push("${paylist.total }");  
      </c:forEach>
      
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['이름', '사용 금액'],
          [namelist[0], totallist[0]],
          [namelist[1], totallist[1]],
          [namelist[2], totallist[2]],
          [namelist[3], totallist[3]]
        ]);

        var options = {
        		vAxis : {title : '액수'},
        		hAxis : {title : '이'},
        		seriesType : 'bars',
        		series : {5 : {type : 'line'}}
        };

        var chart = new google.charts.Bar(document.getElementById('top_x_div'));
        // Convert the Classic options to Material options.
        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
    </script>
  </head>
  <body>
     <div id="top_x_div" style="width: 800px; height: 600px;"></div>
  </body>
</html>