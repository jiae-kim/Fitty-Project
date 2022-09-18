<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fitty 스케줄 관리</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">

<!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->  
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">  
<!-- jquery CDN -->  
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>   -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<!-- fullcalendar CDN -->  
<!-- <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />  
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>   -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<!-- fullcalendar 언어 CDN -->  
<!-- <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script> -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.min.js'></script>

<style>
/* body 스타일 */
html, body{
	/* overflow: hidden; */
	font-size: 16px;
}

#calendar {    
	max-width: 1300px;
	max-hight: 900px;    
	margin: 0 auto;  
}
#font {font-size: 15px;}
</style>

</head>
<body>

<jsp:include page="../userClass/userHeader.jsp"/>

<div class="content-wrapper">
	<div class="container-xxl flex-grow-1 container-p-y" style="padding : 0px;">
    	<div class="row">
      		<div class="col-xl-12">
        		<div class="nav-align-top mb-4">
          			<div class="tab-content" style="height: 900px;">
          			<!-- 회원 페이지 : 스케줄 조회 / 등록 -->
            		<h5 class="text-muted" style="padding-bottom: 2px;">📅내 스케줄 관리</h5>
					<!-- 예약 등록 버튼 -->
					<div class="btn-group2" style="float: right; display: inline-block;">
		            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#scheduleEnroll">수업 예약</button>
		            <!-- 예약 등록 Modal -->
		            <div class="modal fade" id="scheduleEnroll" tabindex="-1" aria-hidden="true">
		              <div class="modal-dialog modal-dialog-centered" role="document">
		                <div class="modal-content">
		                  <div class="modal-header">
		                    <h5 class="modal-title" id="modalCenterTitle" style="padding-bottom : 5px;">📅내 스케줄 관리 - 수업 예약</h5>
		                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		                  </div>
		                  <form action="insert.sc" method="post" id="enrollForm">
		                  <div class="modal-body">
		                  	<!-- 수업일자 -->
							<div class="mb-4 row">
								<label for="html5-date-input" class="col-md-5 col-form-label" id="font">예약 날짜</label>
								<div class="col-md-6">
									<input class="form-control" type="date" name="bookDate" id="html5-date-input" required />
								</div>
							</div>
		
							<!-- 수업 시작 시간 -->
							<div class="mb-4 row">
								<label for="html5-date-input" class="col-md-5 col-form-label" id="font">수업 시작 시간</label>
								<div class="col-md-6">
									<input class="form-control" type="time" name="bookStime" id="html5-date-input" required />
								</div>
							</div>
		
							<!-- 수업 종료 시간 -->
							<div class="mb-4 row">
								<label for="html5-date-input" class="col-md-5 col-form-label" id="font">수업 종료 시간</label>
								<div class="col-md-6">
									<input class="form-control" type="time" name="bookEtime" id="html5-date-input" required />
								</div>
							</div>
		                  </div>
		                  <div class="modal-footer">
		                    <button type="submit" class="btn btn-primary">확인</button>
		                    <button type="reset" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
		                  </div>
		                  </form> 
		                </div>
		              </div>
		            </div>
					</div>
					<br><br><br>	
					
					<!-- 외부 JSP모달 불러오기 : 예약상세조회(scheduleUdetailView) 페이지 -->
					<!-- 예약 상세조회 모달 -->
					<div class="modal fade insertModal" id="myModal1">
					<div class="modal-dialog">
					  <div class="modal-content"></div>
					</div>
					</div>	
					
					<script>
					</script>
						
					<!-- 외부 JSP모달로 불러오기 : 예약정보 상세조회 -->
					
						
					<!-- 캘린더 태그 -->
					<div id="wrap">
					<div id='calendar-container'>
						<div id='calendar'></div>
					</div> 
					</div>
								
					<script>
						(function(){
							$(function(){
								// calendar element 취득
								var calendarEl = $('#calendar')[0];

								// full-calendar 생성하기
								var calendar = new FullCalendar.Calendar(calendarEl, {
									// calendar 높이 설정
									height: '750px',
									// 화면에 맞게 높이 재설정
									expandRows: true,
									// Day 캘린더에서 시작 시간
									slotMinTime: '09:00',
									// Day 캘린더에서 종료 시간
									slotMaxTime: '22:00',
									// 헤더에 표시할 툴바
									headerToolbar: {
										left: 'prev,next today',
										center: 'title',
										right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
									},
									// 초기 로드 될때 보이는 캘린더 화면 (기본설정 : 달)
									initialView: 'dayGridMonth',
									// 날짜를 선택하면 day 캘린더나 week캘린더로 링크
									navLinks: true,
									// 수정 가능
									editable: true,
									// 달력 일자 드래그 설정 가능
									selectable: true,
									// 현재 시간 마크
									nowIndicator: true,
									// 이벤트가 오버되면 높이 제한 (+ 몇개 식으로 표현)
									dayMaxEvents: true,
									// 한국어 설정
									locale: 'ko',
									// 드래그 가능
									droppable: true,
									// 이벤트 추가되면 발생하는 이벤트
									eventAdd: function(obj){
										console.log(obj);
									},
									// 이벤트 수정되면 발생
									eventChange: function(obj){
										console.log(obj);
									},
									// 이벤트 삭제되면 발생
									eventRemove: function(obj){
										console.log(obj);
									},
									// 드래그로 이벤트 생성 
									select: function(arg){
										var title = prompt('Event Title:');
										if(title){
											calendar.addEvent({
												title: title,
												start: arg.start,
												end: arg.end,
												allDay: arg.allDay
											})
										}
										calendar.unselect()
									}
								})
								calendar.render();
							});
						})();
					</script>


          			</div>
        		</div>
      		</div>
    	</div>
	</div>
</div>
</body>
</html>