<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	max-width: 1400px;
	max-hight: 1000px;    
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
          			<div class="tab-content" style="height: 1000px;">
          			<!-- 회원 페이지 : 스케줄 조회 / 등록 -->
            		<h5 class="text-muted">📅 ${loginU.userName}님의 스케줄입니다 🏋️담당 트레이너 ${loginU.empName}입니다</h5>
					<!-- 예약 등록 버튼 -->
					<div class="btn-group2" style="float: right; display: inline-block;">
		            <!-- <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#scheduleEnroll">수업 예약</button> -->
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
		                    <!-- 로그인한 회원의 수업번호, 회원번호, 담당트레이너번호 넣어줌 -->
		                  	<input type="hidden" name="clNo" value="${loginU.classNo}">
		                  	<input type="hidden" name="userNo" value="${loginU.userNo}">
		                    <input type="hidden" name="empNo" value="${loginU.empNo}">
		                  	
		                  	<!-- 수업 예약 일자 -->
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
	                                <c:forEach var="i" begin="9" end="22">
	                                	<option value="${i>9?i:'0'}${i>9?'':i}:00">${i>9?i:'0'}${i>9?'':i}:00</option>
	                                </c:forEach>
                              	</select>
								</div>
							</div>
							
							<!-- 수업 종료 시간 -->
							<div class="mb-4 row">
								<label for="html5-date-input" class="col-md-5 col-form-label" id="font">수업 종료 시간</label>
								<div class="col-md-6">
								<select id="defaultSelect" name="bookEtime" class="form-select" required>
	                                <option disabled selected hidden>예약할 수업 종료 시간 선택</option>
									<c:forEach var="i" begin="9" end="22">
	                                	<option value="${i>9?i:'0'}${i>9?'':i}:00">${i>9?i:'0'}${i>9?'':i}:00</option>
	                                </c:forEach>
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
					</div><br><br><br>	
					
					<!-- 예약 상세조회용 모달 (조회, 수정, 삭제 기능) -->
					<!-- 로그인한 회원의 정보 / 어떤 직원과 어떤 수업을 언제(날짜, 시간)-->
					<div class="modal fade" id="myModall" tabindex="-1" aria-hidden="true">
				    <div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
					  	<div class="modal-header">
							<h5 class="modal-title" id="modalCenterTitle" style="padding-bottom : 5px;">📅내 스케줄 관리 - 수업 예약</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				  	 	</div>
				  	  	<form action="" method="post" id="suForm">
			          	<div class="modal-body">
							<!-- 조회, 수정, 삭제 시 예약번호, 회원번호 필요함 -->
			          		<input type="hidden" name="bookNo" value="">

							<!-- 담당 트레이너 -->
							<div class="mb-4 row">
								<label for="html5-date-input" class="col-md-5 col-form-label" id="font">담당 트레이너</label>
								<div class="col-md-6">
									<input class="form-control" type="text" name="empName" value="" id="html5-date-input" readonly />
								</div>
							</div>
			          	
							<!-- 수업일자 (변경가능) -->
							<div class="mb-4 row">
								<label for="html5-date-input" class="col-md-5 col-form-label" id="font">예약 날짜</label>
								<div class="col-md-6">
									<input class="form-control" type="date" name="bookDate" value="" id="html5-date-input" />
								</div>
							</div>
						
							<!-- 수업 시작 시간 -->
							<div class="mb-4 row">
								<label for="html5-date-input" class="col-md-5 col-form-label" id="font">수업 시작 시간</label>
								<div class="col-md-6">
								<select id="bookStime" name="bookStime" class="form-select" required>
	                                <c:forEach var="i" begin="9" end="22">
	                                	<option value="${i>9?i:'0'}${i>9?'':i}:00">${i>9?i:'0'}${i>9?'':i}:00</option>
	                                </c:forEach>
                              	</select>
								</div>
							</div>
		
							<!-- 수업 종료 시간 -->
							<div class="mb-4 row">
								<label for="html5-date-input" class="col-md-5 col-form-label" id="font">수업 종료 시간</label>
								<div class="col-md-6">
								<select id="bookEtime" name="bookEtime" class="form-select" required>
	                                <c:forEach var="i" begin="9" end="22">
	                                	<option value="${i>9?i:'0'}${i>9?'':i}:00">${i>9?i:'0'}${i>9?'':i}:00</option>
	                                </c:forEach>
                              	</select>
								</div>
							</div>
							
			            </div>
			            <div class="modal-footer" style="display: flex; justify-content: center;">
			              <button type="button" class="btn btn-primary"  onclick="updateS();" id="updateBtn">예약변경</button>
			              <button type="button" class="btn btn-warning"  onclick="deleteS();" id="cancelBtn">예약취소</button>
			              <a class="btn btn-secondary" href="listSchedule.sc" >뒤로가기</a>
			            </div>
			            </form> 
				  	</div>
					</div>
					</div>
					
					<!-- 예약 수정 function -->
					<script>
					function updateS(){
						$('#suForm').attr('action', "update.sc").submit();
					}
					</script>
					
					<!-- 예약 삭제 function -->
					<script>
					function deleteS(){
						$('#suForm').attr('action', "delete.sc").submit();
					}
					</script>
					
					<!-- 캘린더 태그 -->
					<div id="wrap">
					<div id='calendar-container'>
						<div id='calendar'></div>
					</div> 
					</div>
						
					<c:set var="now" value="<%=new java.util.Date()%>" />
					<fmt:formatDate var="sysdate" value="${now}" pattern="yyyy-MM-dd" />
						
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
								//console.log(list);
								
								// 넘겨주고자 하는 값 리스트로 담아줌
								let userNo = ${loginU.userNo};
								let data = [];
								for(let i=0; i<list.length; i++){
									let obj = {};
									
									if(list[i].userNo == userNo){
										// 내 스케줄 (내가 예약한 내용)
										obj = {
												id : list[i].bookNo,
												title : list[i].userName + " " + list[i].bookStime + "~" + list[i].bookEtime,
												start : list[i].bookDate + " " + list[i].bookStime, 
												end : list[i].bookDate + " " + list[i].bookEtime,
												textColor : "black",
												backgroundColor : "#696cff",
												fontSize : 14
											}
									}else{
										// 내 담당트레이너의 스케줄(내 예약내용 아님)
										obj = {
											id : list[i].bookNo,
											title : "예약마감 : " + list[i].bookStime + "~" + list[i].bookEtime,
											start : list[i].bookDate + " " + list[i].bookStime, 
											end : list[i].bookDate + " " + list[i].bookEtime,
											textColor : "black",
											backgroundColor : "lightgrey",
											fontSize : 12
										}
									}
									data.push(obj);
								}
								// -------------------- 캘린더 렌더링 --------------------
								   var initialLocaleCode = 'ko';
								   var calendarEl = document.getElementById('calendar');
								   var calendar = new FullCalendar.Calendar(calendarEl, {
									  // calendar 높이 설정
									  height: '850px',
									  // 화면에 맞게 높이 재설정
									  expandRows: true,
									  // 초기 로드 될때 보이는 캘린더 화면 (기본설정 : 달)
									  initialView : 'dayGridMonth',
									  // 한주를 월요일부터 시작
									  firstDay : 1,
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
									  displayEventTime: false,
									  // 달력에서 모달 오픈
									  eventClick:function(arg){
										  ModalOpen(arg);
									  },
									  dateClick:function(arg){
										  $("#scheduleEnroll").modal("show");
									  }
								   });
								   calendar.render();
							   // ------------------------------------------------------------
							},
							error: function(){
								console.log("스케줄 전체조회 ajax 통신 실패");
							}
						})
					})

					// 예약 상세조회
					function ModalOpen(arg){
						console.log(arg);
						console.log(arg.event._def.publicId);
						
						// 해당 예약번호를 넘겨서 수업예약 상세 정보 조회 ajax
					    // ajax success function에서 조회한 정보를 #myModall의 value 값으로 뿌림
					    $.ajax({
					    	url:"detail.sc",
					    	data:{bookNo: arg.event._def.publicId},
					    	success:function(booking){
					    		console.log(booking);
					    		// 예약 번호
					    		$('#myModall input[name=bookNo]').attr('value', booking.bookNo);
					    		// 담당 트레이너 이름
					    		$('#myModall input[name=empName]').attr('value', booking.empName);
					    		// 예약한 수업 일자
					    		$('#myModall input[name=bookDate]').attr('value', booking.bookDate);
					    		// 예약한 수업 시작 시간
					    		$("#bookStime option").each(function(){
					    			if($(this).val() == booking.bookStime){
					    				$(this).attr('selected', true);
					    			}
					    		})
					    		// 예약한 수업 종료 시간 
					    		$("#bookEtime option").each(function(){
					    			if($(this).val() == booking.bookEtime){
					    				$(this).attr('selected', true);
					    			}
					    		})
					    		// 조회된학생번호와 로그인한학생번호가 일치하지 않을 경우 : 모달버튼 비활성화 attr("disabled", true);	
					    		// 현재 선택한 일정의 날짜가 오늘 날짜 이후인 예약만 변경 가능함 
					    		// console.log(${sysdate});

					    		 if(${loginU.userNo} != booking.userNo || "${sysdate}" >= booking.bookDate) { 
				    				$("#updateBtn").attr("disabled", true);
				    				$("#cancelBtn").attr("disabled", true);
					    		}
					    	},
					    	error:function(){
					    		console.log("스케줄 상세조회 ajax 통신 실패");	
					    	}
					    });
						$('#myModall').modal('show');
					}
					</script>

          			</div>
        		</div>
      		</div>
    	</div>
	</div>
</div>
</body>
</html>