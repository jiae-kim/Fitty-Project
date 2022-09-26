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

  tr{
  	height:15%
  }

  td{
    padding: 3px 3px; text-align: right; vertical-align: sub; 
    min-width: 105px;
    max-width: 105px;
    width: 105px; 
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
  }
  
  .calMove{
  	height:5%
  }
  
  .cal{
  	height:90%
  }	
  
  .arrow:hover{color:purple; cursor:pointer};
</style>
</head>
<body>

<jsp:include page="userHeader.jsp" />



<div class="row">
    <div class="col-md-12">
    <div class="card mb-4">
		<h5 class="card-header" style='color:#696cff; font-size:20px; font-weight:900; text-align:center'>💖 ${loginU.userName }님의 my fitty 💖</h5>
		<div class="card-body row" style="height:740px">
        
        <div style='margin:auto; width:100%; height:100%;'>
	        	<div id='calendar' style='height:100%'></div>
		</div>
		
		
		
		<script>
		var today = new Date();
		
		var yy = "";
		var mm = "";
		var dd = "";
		
		$(function(){
			
			calrendarMaker();
		
            $(document).on("click", ".pre", function() { // 이전달
                today = new Date ( today.getFullYear(), today.getMonth()-1, today.getDate());
                dd = today.getDate(); //오늘의 일
                mm = today.getMonth()+1;  //오늘에 해당하는 월
    			yy = today.getFullYear().toString().substring(2); //오늘에 해당하는 년
           		calrendarMaker();
            })
		
            $(document).on("click", ".next", function() { // 다음달
                today = new Date ( today.getFullYear(), today.getMonth()+1, today.getDate());
                dd = today.getDate(); //오늘의 일
                mm = today.getMonth()+1;  //오늘에 해당하는 월
    			yy = today.getFullYear().toString().substring(2); //오늘에 해당하는 년
           		calrendarMaker();
            })
            
            
            //var ttt = new Date(); //지정된 형식대로 만든 오늘날짜
            
			dd = today.getDate(); //오늘의 일
			mm = today.getMonth()+1;  //오늘에 해당하는 월
			yy = today.getFullYear().toString().substring(2); //오늘에 해당하는 년

			if(dd<10){
			    dd='0'+dd
			}
			if(mm<10){
			    mm='0'+mm
			}
			var ttt = yy + "/" + mm + "/" + dd;
            
		})
            
		
		function calrendarMaker(){
			
			// 식단리스트를 조회하는 ajax
			$.ajax({
				url : "select.cl",
				data : {classNo: ${classNo}},
				success:function(data){ // 
					
				
				var d = data.d; //diet리스트
				var e = data.e; //exercise리스트
				
				var all = data.all; //각 일자별 전체 운동 갯수
				var com = data.com; //각 일자별 운동완료한 갯수
				
				console.log(d);
				console.log(e);
				
				var now = new Date();	// 현재 날짜 및 시간
				var mn = now.getMonth()+1;
				
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
		            
		            var html = "";
		                html += "<div align='center' class='calMove'>";
		                
		                
		                html += "<button type='button' class='pre' style='border:none; background:none;'><i class='bx bxs-left-arrow arrow' style='color:lavender'></i></button>";
		                html += " &nbsp;&nbsp;&nbsp;<label class='mm'>" + calendarMonth + "월</label> &nbsp;&nbsp;&nbsp;";
		                html += "<button type='button' class='next' style='border:none; background:none;'><i class='bx bxs-right-arrow arrow' style='color:lavender'></i></button>";

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
		                      
		                      	if(calendarDay == calendarToday && calendarMonth == mn){
		                      		html += "<div class='div' style='width: 99%; height: 103%; border: 5px solid #9a9cf76e;'>"
		                      			  + "<span>" + calendarDay + "</span>";
		                      	}else{
			                      	html += "<div class='div'><span>" + calendarDay + "</span>";
		                      	}
		                      	
		                      	html += "<div class='day'><div class='diet' style='background:#fcffceab;'>";
		                      	
		                      		//조회해온 리스트의 각 날짜와 div 안의 날짜가 같을 경우 반복문을 돌려 뿌려지도록
			                      	for(let i in d){
			                      		if( (yy + "/" + mm + "/" + calendarDay) == d[i].dietDate ){
 			                      	/* html += "식단 "; */
			                      			if(d[i].bfImage != null){
			                      				html += "🍋";
			                      			}				                      			
			                      			if(d[i].lcImage != null){
			                      				html += "🍑";
			                      			}
			                      			if(d[i].dnImage != null){
			                      				html += "🍏";
			                      			}
			                      			if(d[i].reImage != null){
			                      				html += "🍇";
			                      			}
			                      			/* html += "<div style='background:purple; border-radius:70%; width:15px; height:15px; margin:auto; float:left'></div>" */
			                      		}
			                      	}
		                        html += "</div><div class='exercise' style='background:#c75ef621'>";
		                      		
		                      		//각 일자별 진행률 보여주기
	                      			//완료
		                      		for(let i in com){ 
		                      			if( (yy + "/" + mm + "/" + calendarDay) == com[i].exDate ){
		                      				html += "운동 <label style='font-weight:500'>" + com[i].exSet + "</label> / ";
		                      			}
		                      		}
	                      			//전체
		                      		for(let i in all){ 
		                      			if( (yy + "/" + mm + "/" + calendarDay) == all[i].exDate ){
		                      				html += "<label style='font-weight:500'>" + all[i].exCount + "</label>";
		                      			}
		                      		}
		                      	html += "</div>";
		                      	
		                       	html += "</div>"
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
		        			
		                    let dd = $(this).children().eq(0).text(); //클릭한 div의 "일"
		                    
		                    if(dd>0 && dd<10){ // "일"을 두글자로 표현
		                      dd = "0" + dd;
		                    }

		                    let month = $(".mm").text().replace("월", ""); //달력내의 "월"을 두글자로 표현
		                    let mm = "";
		                    if(month>0 && month<10){
		                      mm = "0" + month;
		                    }

		                    let yy = calendarYear.toString(); //달력내의 "년"을 두글자로 표현
		                    yy =yy.substring(2);

		                    
		                    let clDate = yy + "/" + mm + "/" + dd; //클릭한 div의 지정형식 날짜 (DB에서 비교 가능한 값)
		                    
		                    
		                    
		                    let t = new Date(); //현재 날짜(년월일)
		                    let clickDate = new Date(calendarYear, month-1, dd); //클릭한 div의 시스템 날짜
		                    
		                    console.log(clDate);
		                    
		                    
		                    if(clickDate < t){ //오늘 이후의 날짜는 클릭되지 않도록
		                       	location.href = 'userDiDetail.cl?classNo=${classNo}&dietDate=' + clDate;
		                    }else{
		                  	  alert("선택 불가능한 날짜입니다.");
		                    }
		                    
		              	}) 
		                
				},
				error:function(){
					console.log("달력 조회용 ajax 통신 실패");
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