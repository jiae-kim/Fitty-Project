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
			</div>
		
		
		<script>
		
		var date = new Date();
		var today = new Date();
		
		$(function(){
			
		  calrendarMaker();
		
           $(document).on("click", ".pre", function() { // 이전달
                today = new Date ( today.getFullYear(), today.getMonth()-1, today.getDate());
           		console.log(today);
           		
           		calrendarMaker();
            })
		
           $(document).on("click", ".next", function() { // 이전달
                today = new Date ( today.getFullYear(), today.getMonth()+1, today.getDate());
           		console.log(today);
           		
           		calrendarMaker();
            })
		
			
		  })
		  
		  
		  
		  function calrendarMaker(){
					
            // 달력 연도
            var calendarYear = today.getFullYear();
            // 달력 월
            var calendarMonth = today.getMonth() + 1;
            // 달력 일
            var calendarToday = today.getDate();
            
            // 달력 월의 마지막 일
            var monthLastDate = new Date(calendarYear, calendarMonth, 0);
            var calendarMonthLastDate = monthLastDate.getDate();
            
            // 달력 월의 시작 요일
            var monthStartDay = new Date(calendarYear, today.getMonth(), 1);
            var calendarMonthStartDay = monthStartDay.getDay();
            
            // 주 카운트
            var calendarWeekCount = Math.ceil((calendarMonthStartDay + calendarMonthLastDate) / 7);
            
            
            console.log(today);
            console.log('해당 년월일 : ', calendarYear, calendarMonth, calendarToday); // 해당 년월일
            console.log('해당 달의 마지막일 : ', calendarMonthLastDate);
            console.log('해당 달의 시작요일 : ', calendarMonthStartDay);
            console.log('주 카운트 : ', calendarWeekCount);
            
            
            
            var html = "";
                html += "<div align='center' class='calMove'>";
                
                html += "<button type='button' class='pre'><i class='tf-icon bx bx-chevron-left'></i></button> &nbsp;&nbsp;&nbsp;";
                html += "<label class='mm'>" + calendarMonth + "월</label> &nbsp;&nbsp;&nbsp;";
                html += "<button type='button' class='next'><i class='tf-icon bx bx-chevron-right'></i></button>";
                
                html += "</div><br>";
                
                html += "<table class='calrendar'>";
                html += "<thead>";
                html += "<tr align='center'>";
                html += "<th style='color:red'>SUN</th><th>MON</th><th>THU</th><th>WEN</th><th>THU</th><th>FRI</th><th>SAT</th>";
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
                      
                      	if(calendarDay == calendarToday){
                      		html += "<div class='div' style='background-color:lavender'><span>" + calendarDay + "</span>";
                      	}else{
	                      	html += "<div class='div'><span>" + calendarDay + "</span>";
                      	}
	                      
                      	html += "<div class='day'>"
                             +  ""
                             + "</div>"
                             + "</div></div>";
                    }
                    
                    html += "</td>";
                    calendarPos++;
                  }
                  html += "</tr>";
                }
                html += "</tbody>";
                html += "</table></div>";
                
                $("#calendar").html(html);

                
                $(".div").click(function(){
                  let dd = $(this).children().text();
                  if(dd>0 && dd<10){
                    dd = "0" + dd;
                  }

                  let month = $(".mm").text().replace("월", "");
                  let mm = "";
                  if(month>0 && month<10){
                    mm = "0" + month;
                  }

                  let yy = calendarYear.toString();
                  yy =yy.substring(2);

                  let dietDate = yy + "/" + mm + "/" + dd;
                  
                  
                  let t = new Date(); // 오늘 날짜
                  let clickDate = new Date(calendarYear, month-1, dd);
                  
                  if(clickDate < t){
	                  location.href = 'userDiDetail.cl?dietDate=' + dietDate + '&classNo=${loginU.classNo}';                	  
                  }else{
                	  alert("선택 불가능한 날짜입니다.");
                  }
                  
                }) 
			}
          </script>
		
          
		</div>
    </div>
    </div>
</div>


</body>
</html>