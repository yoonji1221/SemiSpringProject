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
<title>WHERE PAY에 오신 걸 환영합니다!</title>
<script>


//검색결과조회   
function button1_click() {
   var value = $("#money option:selected").val();

   if(value == 2 || value==3){ //선불카드, 상품권 선택 제로페이 데이터 조회
       $("#table2").remove();
      var sam_gu = $("#address option:selected").val();
       var sam_btheme = $("#category option:selected").val();
       console.log(sam_gu+":"+sam_btheme+"::"+value);
          
       $.ajax({
             url : '/wherepay/searchresult?sam_gu='+ sam_gu +'&sam_btheme='+sam_btheme+'&value='+value,
             type : 'get',
             success : function(resultlist) {
                //$("#outter").remove();
                var table = $("<table id=\"table2\" class=\"table table-bordered table-striped\">");
                $("#tab2").append(table);
                 for(var idx in resultlist){
                   var z_num= resultlist[idx]['z_num']
                   var z_name = resultlist[idx]['z_name']
                   var z_addr = resultlist[idx]['z_addr']
                   var z_giftcard = resultlist[idx]['z_giftcard']
                   var z_stheme = resultlist[idx]['z_stheme']
                   var z_btheme = resultlist[idx]['z_btheme']
                   var z_manager = resultlist[idx]['z_manager']
                   
                   var all = $("<tr><td>"+z_num+"</td><td><a href='/wherepay/search/detail2?z_num="+z_num+"'>"+z_name+"</a></td><td>"+z_addr+"&nbsp;"+z_btheme+"&nbsp;"+z_stheme+"</td><td>"+z_manager+"</td>");                   
               $("#table2").append(all);
                }
                 
                }, error : function(e) {
                   console.log(e);
                }
             });   
   }
   
} 

</script>


</head>
<body>
<h1>검색</h1>
지원 형태 
<select name="money" id="money">
            <option value="2" id="money">선불카드</option>
            <option value="3" id="cash">모바일상품권</option>
</select><br><br>
지역 선택 : 서울특별시&nbsp;&nbsp;
<select name="address" id="address">
            <option value="전체">&nbsp;전체&nbsp;</option>
            <c:forEach items="${gulist}" var="gulist">
               <option value="${gulist.sam_gu}" name="sam_gu">${gulist.sam_gu}</option>
            </c:forEach>
         </select><br><br>
업종 선택<select name="category" id="category">
<option value="전체">&nbsp;전체</option>
            <c:forEach items="${category}" var="category">
               <option value="${category.sam_btheme}" name="sam_btheme">${category.sam_btheme}</option>
            </c:forEach></select>
<input id="button1" type=button value="검색" class="btn" onclick="button1_click();">   

매장명 : <input type="text" id="checkname"/> <br>      
          
  
  <div id="tab2"></div>            
  
      
</body>
</html>