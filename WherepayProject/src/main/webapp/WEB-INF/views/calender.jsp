<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);
	  
	  var count = 0;
	  var data;
	  var chart;
      var options;
	  
      function drawChart() {
	  data = new google.visualization.DataTable();
	  data.addColumn('string', 'Dialogue');
	  data.addColumn('number', 'Send');
	  data.addColumn('number', 'Resoponse');
	  data.addRow(['Dialogue 1', 1, 1]);
	  
        options = {
          chart: {
            title: 'Analysis of Dialogue System',
            subtitle: '',
          }
        };

        chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
      
      function addData(){
	    count++;
		data.addRow(['Dialogue ' + count, Number(document.getElementById('sendInput').value), Number(document.getElementById('responseInput').value)]);
		chart.draw(data, options)
      }
      function removeData(){
		data.removeRow(0);
		chart.draw(data, opstions)
      }
    </script>
  </head>
  <body>
    <div id="columnchart_material" style="width: 800px; height: 500px;"></div>
    send:<br>
    <input id="sendInput" type="text"><br>
    response:<br>
    <input id="responseInput" type="text"><br><br>
    <button onclick="addData();">add</button> <button onclick="removeData();">remove</button>
  </body>
</html>