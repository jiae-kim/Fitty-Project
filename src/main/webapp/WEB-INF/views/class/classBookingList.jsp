<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">

<!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->  
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">  

<!-- jquery CDN -->  
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<!-- fullcalendar CDN -->  
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>   -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>

<!-- fullcalendar 언어 CDN -->  
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.min.js'></script>
<style>
.layout-container{margin-top:-20px}
</style>
</head>
<body>

<jsp:include page="../common/header.jsp" />

<!-- 내용 감싸는 전체 wrap -->
<div class="content-wrapper">
<div class="container-xxl flex-grow-1 container-p-y" style="padding:0px; margin-top:-25px">
<div class="row">
<div class="col-xl-12">

	<div class="nav-align-top mb-4">
    <div class="tab-content" style="height: 780px;" align="center">
          
    <div id="wrap">
		<!-- 캘린더 태그 -->
		<div id='calendar-container'>
			<div id='calendar'></div>
		</div> 
	</div>      

	<!-- 캘린더 DB와 연동해서 뿌려주는 코드 -->
	<script>
	$(function(){
		$.ajax({
			url: "booking.cl",
			data:{empNo:"${loginUser.empNo}"},
			success: function(list){
				
				console.log(list);
				
				// 넘겨주고자 하는 값 리스트로 담아줌
				let data = [];
				for(let i=0; i<list.length; i++){
					let obj = {
					    id : list[i].bookNo,
						title : list[i].userName + " " + list[i].bookStime + "~" + list[i].bookEtime,
						start : list[i].bookDate + " " + list[i].bookStime, 
						end : list[i].bookDate + " " + list[i].bookEtime
					};
					data.push(obj);
				}
				
				// -------------------- 캘린더 렌더링 --------------------
				   var initialLocaleCode = 'ko';
				   var calendarEl = document.getElementById('calendar');
				   var calendar = new FullCalendar.Calendar(calendarEl, {
					  // calendar 높이 설정
					  height: '730px',
					  // 화면에 맞게 높이 재설정
					  expandRows: true,
					  // 초기 로드 될때 보이는 캘린더 화면 (기본설정 : 달)
					  initialView : 'dayGridMonth',
					  // 한국어 설정
					  locale : 'ko', 
					  // 시간 설정
					  timeZone : 'UTC',
					  // 헤더에 표시할 툴바
					  headerToolbar: {
						  left: 'prev,next today',
						  center: 'title',
						  right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
					  },
					  // Day 캘린더에서 시작 시간
					  slotMinTime: '09:00',
					  // Day 캘린더에서 종료 시간
					  slotMaxTime: '22:00',
					  // 날짜를 선택하면 day 캘린더나 week캘린더로 링크
					  navLinks: true,
					  // 현재 시간 마크
					  nowIndicator: true,
					  // 이벤트가 오버되면 높이 제한 (+ 몇개 식으로 표현)
				      dayMaxEvents: true,
				      // DB 이벤트로 추가
					  events : data,
					  // 이벤트에 시간 표시
					  displayEventTime: false
				   });
				   calendar.render();
			   // ------------------------------------------------------------
			},
			error: function(){
				alertify.alert("❌ 스케줄 조회에 실패했습니다 ❌\n다시 시도해주세요".set('basic', true));
				console.log("ajax 통신 실패");
			}
		})
	})
	</script>
          
          
          
    </div>
    </div>
</div>
</div>
</div>
</div>
    
          
          
</body>
</html>