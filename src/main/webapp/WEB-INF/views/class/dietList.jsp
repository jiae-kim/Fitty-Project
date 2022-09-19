<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	 #helloMan, #about-time {
	     color:rgb(50, 50, 50);
	     font-size: 11px;
	     margin : 5px;
	 }
	
	 #navbar-collapse {
	     margin : 0px;
	 }
	
	 #init-btn, #out-btn {
	     margin : 5px;
	 }
	
	 .bx-envelope, .bx-message-rounded-dots, .bx-bell {
	     font-size:25px;
	     color: #696CFF;
	     margin : 2px;
	 }
	
	 .big-menu-label{
	     color:rgb(50, 50, 50);
	     font-size: 14px;
	 }
	
	 .small-menu-label{
	     font-size: 12px;
	 }
	
	
	 
	 
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
    width: 90%; height:100%; margin:auto; margin-radius:5px;
  }

  tr{
  	height:15%
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
    text-align: center;
    padding: 5px;
  }
  
  .calMove{
  	height:5%
  }
  
  .cal{
  	height:90%
  }
	
</style>
</head>
<body>

<jsp:include page="../common/header.jsp" />


<!-- 내용 감싸는 전체 wrap -->
<div class="content-wrapper" style="margin-top: -20px;">
<div class="container-xxl flex-grow-1 container-p-y">
<div class="row">
<div class="col-xl-12">
<div class="nav-align-top mb-4"><br>
	
<div class="row">
	
	
	<!-- 1. 회원카드 -->
	<div class="col-md-2 col-12 mb-md-0 mb-4" style="height:700px">
	<div class="card" align="center">
		<div class="card-header">회원정보</div>
        <div class="card-body">내용</div>
	</div>
	</div>
	<!-- /회원카드 -->
	
	
	
	<!-- 2. 내용카드 -->
	<div class="col-md-10">
	<div class="nav-align-top mb-4">
	
		<!-- 내용위에 분류버튼 (* 수정해도 되는 부분) -->
		<ul class="nav nav-pills mb-3 nav-fill" role="tablist">
		<li class="nav-item">
	    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-justified-home" aria-controls="navs-pills-justified-home" aria-selected="false" style="text-weight:700" aria-selected="false">
	      🔥 오늘의 운동
	    <span class="badge rounded-pill badge-center h-px-20 w-px-20 bg-danger">3</span>
	    </button>
		</li>
		
	    <li class="nav-item">
	    <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-justified-profile" aria-controls="navs-pills-justified-profile" aria-selected="true">
	      🌮 식단관리
	    </button>
	    </li>
	    
	    <li class="nav-item">
	    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-justified-messages" aria-controls="navs-pills-justified-messages" aria-selected="false">
	      ✏️ 출결확인
	    </button>
		</li>
		</ul>
		<!-- / 내용위에 분류버튼 -->




	          
        <!-- 내용 넣을 부분 (* 수정해도 되는 부분)-->
		<div class="tab-content" style="height: 695px;">
	
	
	
	
	        <!-- 오늘의 운동 -->
	        <div class="tab-pane fade show active" id="navs-pills-justified-home" role="tabpanel">
	        </div>
	        <!-- /오늘의 운동 -->
		
		
		
		
	
	
	
	
	
	
	    	<!-- 오늘의식단 -->
			<div class="tab-pane fade" id="navs-pills-justified-profile" role="tabpanel" style="height:100%; width:100%">
			
		
			<div style="margin:auto; width:100%; height:100%;">
	        	<div id="calendar" style="height:100%"></div>
			</div>
		
		
		<script>
		$(function(){
			
			var date = new Date();
			var today = new Date();
			/* calrendarMaker(); */
		
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
		
            
			function calrendarMaker(){
					
            /* var date = new Date(); */
            
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
            var monthStartDay = new Date(calendarYear, date.getMonth(), 1);
            var calendarMonthStartDay = monthStartDay.getDay();
            
            // 주 카운트
            var calendarWeekCount = Math.ceil((calendarMonthStartDay + calendarMonthLastDate) / 7);
            
            var html = "";
                html += "<div align='center' class='calMove'>";
                
                html += "<button type='button' class='pre'><i class='tf-icon bx bx-chevron-left'></i></button> &nbsp;&nbsp;&nbsp;";
                html += "<label class='mm'>" + calendarMonth + "월</label> &nbsp;&nbsp;&nbsp;";
                html += "<button type='button' class='next'><i class='tf-icon bx bx-chevron-right'></i></button>";
                
                html += "</div><br>";
                
                html += "<div class='cal'><table class='calrendar'>";
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

                  let mm = $(".mm").text().replace("월", "");
                  if(mm>0 && mm<10){
                    mm = "0" + mm;
                  }

                  let yy = calendarYear.toString();
                  yy =yy.substring(2);

                  let dietDate = yy + "/" + mm + "/" + dd;
                  
                  location.href = 'dietDetail.cl?dietDate=' + dietDate + '&classNo=${classNo}';
                }) 
                
			}
           calrendarMaker();
			
		  })
          </script>
		
          
				
			</div>
			<!-- /식단 -->
	                
	                
	                
	                
	                
	                
	                
	
	        <!-- 출결 -->
			<div class="tab-pane fade" id="navs-pills-justified-messages" role="tabpanel">
			</div>


	              
		</div>
		<!-- / 내용 넣을 부분 -->
	
    </div>
    </div>

	    
</div>
	
</div>
</div>
</div>
</div>
</div>
<!-- /내용 감싸는 전체 wrap -->

	

</body>
</html>