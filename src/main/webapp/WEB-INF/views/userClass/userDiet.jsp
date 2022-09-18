<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  #calendar{
    width: 100%; height:100%;
  }

  .div:hover{
    background-color:#696cff0c;
  }


  .mm{
    font-size: 20px; font-weight: bolder; text-align: center; margin-bottom:10px
  }

  table{
    width: 90%; height:90%; margin:auto; margin-radius:5px;
  }

  td{
    padding: 3px 3px; text-align: right; vertical-align: sub; 
  }

  .div{
    width:100%; height:100%; border:1px solid lightGray; border-radius:5px
  }

  .div>span{
    display: block; padding: 10px 10px;
    height: 30%;
  }

  .day{
    height: 70%;
    /* border: 1px solid red; */
    text-align: center;
    padding: 5px;
  }
</style>
</head>
<body>

<jsp:include page="userHeader.jsp" />


<div class="row">
    <div class="col-md-12">
    <div class="card mb-4">
		<!-- <h5 class="card-header"></h5> -->
		<div class="card-body row" style="height:790px">
		
		
		
      <div>
        <div id="calendar"></div>

          <script>
            var date = new Date();
            
            // 달력 연도
            var calendarYear = date.getFullYear();
            // 달력 월
            var calendarMonth = date.getMonth() + 1;
            // 달력 일
            var calendarToday = date.getDate();
            
            var monthLastDate = new Date(calendarYear, calendarMonth, 0);
            // 달력 월의 마지막 일
            var calendarMonthLastDate = monthLastDate.getDate();
            
            var monthStartDay = new Date(calendarYear, date.getMonth(), 1);
            // 달력 월의 시작 요일
            var calendarMonthStartDay = monthStartDay.getDay();
            
            // 주 카운트
            var calendarWeekCount = Math.ceil((calendarMonthStartDay + calendarMonthLastDate) / 7);
            
            var html = "";
                html += "<div align=\"center\">"
                html += "<a href=''><i class=\"tf-icon bx bx-chevron-left\"></i></a> &nbsp;&nbsp;&nbsp;"
                html += "<label class=\"mm\">" 
                      + calendarMonth + "월</label> &nbsp;&nbsp;&nbsp;";
                html += "<a href=''><i class=\"tf-icon bx bx-chevron-right\"></i></a>"
                html += "</div><br>"
                html += "<table>";
                html += "<thead>";
                html += "<tr align=\"center\">";
                html += "<th style=\"color:red\">SUN</th><th>MON</th><th>THU</th><th>WEN</th><th>THU</th><th>FRI</th><th>SAT</th>";
                html += "</tr>";
                html += "</thead>";
                html += "<tbody>";
                // 위치
                var calendarPos = 0;
                // 날짜
                var calendarDay = 0;
                for (var index1 = 0; index1 < calendarWeekCount; index1++) {
                  html += "<tr>";
                  for (var index2 = 0; index2 < 7; index2++) {
                    html += "<td>";
                    if (calendarMonthStartDay <= calendarPos && calendarDay < calendarMonthLastDate) {
                      calendarDay++;
                      html += "<div class=\"div\"><span >" + calendarDay + "</span>"
                           + "<div class='day'>"
                           +  ""
                           + "</div>"
                           + "</div>";
                    }
                    html += "</td>";
                    calendarPos++;
                  }
                  html += "</tr>";
                }
                html += "</tbody>";
                html += "</table>";
                $("#calendar").html(html);




                $(".div").click(function(){
                  let dd = $(this).children().text();
                  if(dd>0 && dd<10){
                    dd = "0" + dd;
                  }

                  let mm = $(".mm").text().replace("월", "");
                  if(mm>0 && mm<10){
                    mm = "0" + mm;
                  }

                  let yy = calendarYear.toString();
                  yy =yy.substring(2);

                  
                  let dietDate = yy + mm + dd;
                  console.log(dietDate);


                  location.href = 'userDiDetail.cl?dietDate=' + dietDate + '&userNo=${loginU.userNo}';

                })
          </script>
      </div>
		
		
		
          
		</div>
    </div>
    </div>
</div>


</body>
</html>