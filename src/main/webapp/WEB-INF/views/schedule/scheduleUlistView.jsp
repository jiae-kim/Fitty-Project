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
html, body{font-size: 16px;}

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
		                  	<!-- 예약 번호는 등록 시 자동 생성됨 -->
		                    <!-- 수업번호, 회원번호, 담당트레이너번호 넣어줌 -->
		                  	<input type="hidden" name="clNo" value="${loginU.classNo}">
		                  	<label for="html5-date-input" class="col-md-5 col-form-label" id="font">${loginU.classNo}</label>
		                  	<input type="hidden" name="userNo" value="${loginU.userNo}">
		                    <input type="hidden" name="empNo" value="${loginU.empNo}">
		                  	
		                  	<!-- 수업일자 -->
							<div class="mb-4 row">
								<label for="html5-date-input" class="col-md-5 col-form-label" id="font">예약 날짜</label>
								<div class="col-md-6">
									<input class="form-control" type="date" name="bookDate" value="" id="html5-date-input" required />
								</div>
							</div>
		
							<!-- 수업 시작 시간 -->
							<div class="mb-4 row">
								<label for="html5-date-input" class="col-md-5 col-form-label" id="font">수업 시작 시간</label>
								<div class="col-md-6">
								<select id="defaultSelect" name="bookStime" class="form-select" required>
	                                <option disabled selected hidden>예약할 수업 시작 시간 선택</option>
	                                <option value="9:00">9:00</option>
	                                <option value="10:00">10:00</option>
	                                <option value="11:00">11:00</option>
	                                <option value="12:00">12:00</option>
	                                <option value="13:00">13:00</option>
	                                <option value="14:00">14:00</option>
	                                <option value="15:00">15:00</option>
	                                <option value="16:00">16:00</option>
	                                <option value="17:00">17:00</option>
	                                <option value="18:00">18:00</option>
	                                <option value="19:00">19:00</option>
	                                <option value="20:00">20:00</option>
	                                <option value="21:00">21:00</option>
	                                <option value="22:00">22:00</option>
                              	</select>
								</div>
							</div>
		
							<!-- 수업 종료 시간 -->
							<div class="mb-4 row">
								<label for="html5-date-input" class="col-md-5 col-form-label" id="font">수업 종료 시간</label>
								<div class="col-md-6">
								<select id="defaultSelect" name="bookEtime" class="form-select" required>
	                                <option disabled selected hidden>예약할 수업 종료 시간 선택</option>
	                                <option value="9:00">9:00</option>
	                                <option value="10:00">10:00</option>
	                                <option value="11:00">11:00</option>
	                                <option value="12:00">12:00</option>
	                                <option value="13:00">13:00</option>
	                                <option value="14:00">14:00</option>
	                                <option value="15:00">15:00</option>
	                                <option value="16:00">16:00</option>
	                                <option value="17:00">17:00</option>
	                                <option value="18:00">18:00</option>
	                                <option value="19:00">19:00</option>
	                                <option value="20:00">20:00</option>
	                                <option value="21:00">21:00</option>
	                                <option value="22:00">22:00</option>
                              	</select>
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
					  <div class="modal-content">
					  
					  
					  </div>
					</div>
					</div>	
					
					<script>
					</script>
						
					<!-- 외부 JSP모달로 불러오기 : 예약정보 상세조회 -->
					<!--  
					<script>
						// 예약 정보 상세조회
						$(".modal-content").load("");
						
						function ModalOpen(arg) {
							console.log(arg);
							
							// 해당 예약번호를 넘겨서 해당 예약정보 상세 조회하는 ajax
							// ajax success function에서 조회된 정보를 #myModall인 모달 div안 input 요소에 value값으로 뿌림
							
						}
					</script>
					-->
					
					<!-- 캘린더 태그 -->
					<div id="wrap">
					<div id='calendar-container'>
						<div id='calendar'></div>
					</div> 
					</div>
						
					<!-- 캘린더 DB와 연동해서 뿌려주는(select기능) 코드 -->		
					<script>
					$(function(){
						//let userNo = ${loginU.userNo};
						//console.log(userNo);
						$.ajax({
							url: "list.sc",
							// 로그인한 회원 번호 뽑아서 data로 보내줌
							data:{userNo:${loginU.userNo}},
							success: function(list){
								console.log(list);
								
								// 넘겨주고자 하는 값 리스트로 담아줌
								let userNo = ${loginU.userNo};
								let data = [];
								for(let i=0; i<list.length; i++){
									let obj = {};
									
									if(list[i].userNo == userNo){
										obj = {
											    id : list[i].bookNo,
												title : list[i].empName,
												start : list[i].bookDate, 
												end : list[i].bookDate,
												textColor : "white,
												backgroundColor : "purple"
											}
									}else{
										obj = {
										    id : list[i].bookNo,
											title : list[i].empName,
											start : list[i].bookDate, 
											end : list[i].bookDate,
											textColor : "white",
											backgroundColor : "lightgray"
										}
									}
									
									data.push(obj);
								}
								// -------------------- 캘린더 렌더링 --------------------
								   var initialLocaleCode = 'ko';
								   var calendarEl = document.getElementById('calendar');
								   var calendar = new FullCalendar.Calendar(calendarEl, {
									  // calendar 높이 설정
									  height: '750px',
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
									  slotMaxTime: '23:00',
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