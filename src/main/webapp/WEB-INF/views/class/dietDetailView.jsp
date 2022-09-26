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
	
	
	 /* 댓글 스타일 */
	 .reply-wrap label{
	   float:left; margin-left: 3px; font-weight: 600; font-size: 14px;
	 }
	
	 .reply{
	   border: 2px solid rgb(221, 203, 224); border-radius: 10px; overflow: hidden;  display: flex; align-items: center; padding: 5px; margin-bottom: 10px;
	   margin-top: 5px;
	 }
	
	 .reply-content{
	   width: 100%; float: left; vertical-align: middle; padding-left: 10px;
	 }
	
	 .r-main>#writer{
	   font-size: 13px; font-weight: 700;
	 }
	
	 .r-main>#date{
	   color:lightgrey; font-size:11px
	 }
	
	 .r-main>#content{
	   font-size: 14px;
	 }
	
	 .reply-input{
	   border: 2px solid rgb(213, 193, 216); border-radius: 10px; display: flex; padding: 5px;
	 }
	
	 .reply-input textarea{
	   resize: none; border: none; margin-left: -5px;
	 }
	
	 .reply-input button{
	   vertical-align: middle; border: none; border-radius: 5px; width: 50px;
	 }
	 
	 .reply-input button:hover{
	 	background-color:darkgray;
	 }
	 
	 .update{
	 	width:94%; border:1px solid lightgrey; border-radius:5px; float:left; resize:none; margin-bottom:10px;
	 }
	 
	 #upBtn{
	 	width:5%; border-radius:5px; border:1px solid lightgrey; float:right; height:100%;
	 }
	 
</style>
</head>
<body>

<jsp:include page="../common/header.jsp" />


<!-- 내용 감싸는 전체 wrap -->
<div class="content-wrapper" style="margin-top: -20px;">
<div class="container-xxl flex-grow-1 container-p-y" style="padding:0px; margin-top:-25px">
<div class="row">
<div class="col-xl-12">
<div class="nav-align-top mb-4"><br>
	
<div class="row">
	
	
	<!-- 1. 회원카드 -->
	<div class="col-md-2 col-12 mb-md-0 mb-4" style="min-height:700px">
	<div class="card" align="center">
		<div class="card-header">
			<div style='font-size:17px; font-weight:600; background:lavender'>회원정보</div><br>
			<img src="resources/upload_profileImg/22092315545910883.jpg" class="w-px-50 h-auto rounded-circle" style='width:100px !important'><br>
			<label>김제니</label> (<label id="age">26</label> / <label>F</label>) <br>
			<label id="phone" style='font-size:15px'>010 - 2345 - 3456</label><br>
			<label style='font-size:15px'>160 cm</label>
			<label style='font-size:15px'>45 kg</label><br><br>
			<label style='font-size:15px; font-weight:600'>예약일 : 2022-09-26</label><br>
			<button type="button" class="btn btn-primary">출석</button>
			<button type="button" class="btn btn-secondary">결석</button>
			
		</div>
		
        <div class="card-body">
        	<div style='font-size:17px; font-weight:600; background:lavender'>수업정보 및 목표</div><br>
        	<label>남은회차 : 27/30</label><br><br>
        	<label>수업시작일 : 2022-09-01</label><br><br>
        	<label style='font-size:15px; font-weight:600'>수업목표 : ${c.classGoal }</label><br>
        	<label style='font-size:15px; font-weight:600'>기대결과 :  ${c.classResult}</label><br><br>
        	<div class="progress" style='height:30px'>
	          <div class="progress-bar bg-info" role="progressbar" style="width: 87%;" aria-valuenow="87" aria-valuemin="0" aria-valuemax="100">87%</div>
	        </div>
        </div>
	</div>
	</div>
	<!-- /회원카드 -->
	
	
	
	<!-- 2. 내용카드 -->
	<div class="col-md-10">
	<div class="nav-align-top mb-4">
	
		<!-- 내용위에 분류버튼 (* 수정해도 되는 부분) -->
		<ul class="nav nav-pills mb-3 nav-fill" role="tablist">
		<li class="nav-item">
	    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-justified-home" 
	    aria-controls="navs-pills-justified-home" aria-selected="false"
	    onclick="location.href='exercise.cl?classNo=${classNo}&exDate=${exDate}';"
	    >
	      🔥 오늘의 운동
	    <!-- <span class="badge rounded-pill badge-center h-px-20 w-px-20 bg-danger">3</span> -->
	    </button>
		</li>
		
	    <li class="nav-item">
	    <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-justified-profile" 
	    aria-controls="navs-pills-justified-profile" aria-selected="true" 
	    style="text-weight:700"
	    >
	      🌮 식단관리
	    </button>
	    </li>
		</ul>
		<!-- / 내용위에 분류버튼 -->
	
	
	          
        <!-- 내용 넣을 부분 (* 수정해도 되는 부분)-->
		<div class="tab-content" style="min-height: 695px;">
	
	
	
	        <!-- 오늘의 운동 -->
	        <!-- <div class="tab-pane fade" id="navs-pills-justified-home" role="tabpanel">
	        </div> -->
	        <!-- /오늘의 운동 -->
		
		
		
	
	
	    	<!-- 오늘의식단 -->
			<div class="tab-pane fade show active" id="navs-pills-justified-profile" role="tabpanel">
			<div class="di-date" align="center">
		
				<!-- 여기에 사진 -->
				<div class="di-date" align="center">
		        <a href="" style="color:#696CFF; font-size:20px">◀️</a> &nbsp;&nbsp;
		        <label style="font-weight: 700; font-size:25px;"></label>  &nbsp;&nbsp;
		        <a href="" style="color:#696CFF; font-size:20px">▶️</a>
		        </div><br>
		        
		        				
				<button type="button" class="btn btn-sm rounded-pill btn-outline-primary" onclick="location.href='main.cl?classNo=${classNo}';" style="float:right">
			       	<span class="tf-icons bx bx-calendar-check"></span>&nbsp; 달력보기
			    </button><br>
		        
        

				<script>
					$(function(){
						let dateArr = "${exDate}".split("/");
						let date = "20" + dateArr[0] + "년 " + dateArr[1] + "월 " + dateArr[2] + "일";
						
						$(".di-date label").text(date);
						
						var today = new Date();
						
					})
				</script>
				
				
		
				<div class="row row-cols-1 row-cols-md-3 g-4 mb-5" style="height: 60%; margin-top:10px; margin-bottom: 1.5rem !important;">
		        
		        
				<!-- 아침 -->
				<div class="col" style="width: 25%;">
		        <div class="card h-100">
		        	
				<c:choose>
		        	<c:when test="${d.bfImage eq null}">
						<button type="button" style="border:none; height:300px" 
						class="modal-button" data-bs-toggle="modal" data-bs-target="#bf">
					    	BREAKFIRST
						</button>
					</c:when>
		         	<c:otherwise>
		         		<img class="card-img-top di_bf_img" src="${d.bfImage }" style="object-fit: cover;"/>
		                <div class="card-bodyy di_bf_content">
			                <h5 class="card-title">아침</h5>
			                <p class="card-text">
			                  ${d.bfContent }
			                </p>
		            	</div>
		         	</c:otherwise>
				</c:choose>
		        	
				</div>
				</div>
				
				
				<!-- 점심 -->
				<div class="col" style="width: 25%;">
		        <div class="card h-100">
		        	
				<c:choose>
		        	<c:when test="${d.lcImage eq null}">
						<button type="button" style="border:none; height:300px" 
						class="modal-button" data-bs-toggle="modal" data-bs-target="#lc">
					    	LUNCH
						</button>
					</c:when>
					
		         	<c:otherwise>
		         		<img class="card-img-top di_bf_img" src="${d.lcImage }" style="object-fit: cover;"/>
		                <div class="card-bodyy di_bf_content">
			                <h5 class="card-title">점심</h5>
			                <p class="card-text">
			                  ${d.lcContent }
			                </p>
		            	</div>
		         	</c:otherwise>
				</c:choose>
		        	
				</div>
				</div>
		          
		          
				
				<!-- 저녁 -->
				<div class="col" style="width: 25%;">
		        <div class="card h-100">
		        	
				<c:choose>
		        	<c:when test="${d.dnImage eq null}">
						<button type="button" style="border:none; height:300px" 
						class="modal-button" data-bs-toggle="modal" data-bs-target="#dn">
					    	DINNER
						</button>
					</c:when>
		         	<c:otherwise>
		         		<img class="card-img-top di_bf_img" src="${d.dnImage }" style="object-fit: cover;"/>
		                <div class="card-bodyy di_bf_content">
		                <h5 class="card-title">저녁</h5>
		                <p class="card-text">
		                  ${d.dnContent }
		                </p>
		            	</div>
		         	</c:otherwise>
				</c:choose>
		        	
				</div>
				</div>
		          
		          
		          
		        <!-- 간식 -->
				<div class="col" style="width: 25%;">
		        <div class="card h-100">
		        	
				<c:choose>
		        	<c:when test="${d.reImage eq null}">
						<button type="button" style="border:none; height:300px" 
						class="modal-button" data-bs-toggle="modal" data-bs-target="#re">
					    	REFRESHMENTS
						</button>
					</c:when>
		         	<c:otherwise>
		         		<img class="card-img-top di_bf_img" src="${d.reImage }" style="object-fit: cover;"/>
		                <div class="card-bodyy di_bf_content">
		                <h5 class="card-title">간식</h5>
		                <p class="card-text">
		                  ${d.reContent }
		                </p>
		            	</div>
		         	</c:otherwise>
				</c:choose>
		        	
				</div>
				</div>
				
				<!-- 입력된 글이 하나도 없을 때 보여지는 문구 -->
				<c:if test="${ d.bfImage eq null and d.lcImage eq null and d.dnImage eq null and d.reImage eq null}">
					<div style='background:lavender; width:100%; padding:10px; font-weight:600'>아직 등록된 식단 내역이 없습니다 🙂</div>
				</c:if>
				

				</div>
			<br>
		
				

			<!-- 댓글 -->
			<div class="reply-wrap" style="height: 30%;">
			
				<!-- 댓글 갯수 -->
	    		<div><span style='float:left'>댓글</span> <label id="rr"></label></div><br>
	
				<!-- 내용 -->
				<div class="r">
		        </div>
	        
		        <!-- 입력 -->
		        <form id="postForm" action="" method="post" >
		        	<input type="hidden" name="no" value="">
		        </form>
		        
		        <div class="reply-input">
		            <textarea class="form-control content" id="exampleFormControlTextarea1" rows="2" placeholder="댓글을 입력해주세요."></textarea>
		            <button onclick="addReply();">등록</button>
		        </div>
			</div>
	        <!-- /댓글 -->
      
      
			<script>
				$(function(){
					selectReplyList();
				})
				
				//댓글 조회
				function selectReplyList(){
					
					$.ajax({
						url:"relist.di",
						data:{no:"${d.dietNo}"},
						success:function(list){
							
							console.log(list);
							
							let value = "";
							let type = "";
							let replyNo = "";
							
							for(let i=0; i<list.length; i++){
								

								replyNo = list[i].replyNo;
								replyContent = list[i].replyContent;
								writerName = list[i].writerName;
								
								
								if(list[i].replyWriter == '${loginUser.empNo}'){
									value += "<div class='reply' style='background:#c1b3ff12;'>";
								}else{
									value += "<div class='reply'>";
								}
								
								type = (list[i].writerType == "U") ? "회원" : "트레이너";
								value += "<div class='reply-content'>"
										   +"<div class='r-main'>"
											   + "<label id='writer'>" + list[i].writerName + "&nbsp" + type + "</label> &nbsp"
											   + "<label id='date'>" + list[i].replyDate + "</label> &nbsp;&nbsp;<br>"
									  	  	   + "<div class='c" + replyNo + "'><label id='content'>" + list[i].replyContent + "</label></div>"
									   	   + "</div>"
									    + "</div>";
								
									   
								if(list[i].replyWriter == '${loginUser.empNo}'){
									value += "<div class='r-ect'>"
											   + "<div class='replyNo' style='display:none;'>" + replyNo + "</div>" 
											   + "<button type='button' class='dr btn btn-xs btn-primary btn-icon rounded-pill dropdown-toggle hide-arrow' data-bs-toggle='dropdown' aria-expanded='false'>"
											   		+ "<i class='bx bx-dots-vertical-rounded'></i>"
											   + "</button>"
									           + "<ul class='dropdown-menu dropdown-menu-end' data-popper-placement='bottom-end'>"
									           		+ "<li><a class='dropdown-item u'>수정</a></li>"
									           		+ "<li><a class='dropdown-item d'>삭제</a></li>"
									           + "</ul>" 
										   + "</div>"
										   
										   + "</div>";
								}else{
									value += "</div>";
								}
								
							}
							$(".r").html(value);
							$("#rr").text(list.length);
						},
						error:function(){
							console.log("댓글 리스트 조회용 ajax통신 실패");
						}
					})
				}
				
				
				
				
				//댓글 수정에 필요한 값 
				$(document).on("click", ".u", function(){
					let replyNo = $(this).parent().parent().parent().children().eq(0).text();
					let replyContent = $(this).parent().parent().parent().prev().children().children().eq(3).children().text();
					console.log("수정" + replyNo);
					replyUpdateForm(replyNo, replyContent);
				})
				
				
				
				
				//댓글 수정 폼
				function replyUpdateForm(replyNo, replyContent){
					
					console.log(replyNo);
					console.log(replyContent);
					
					$("button").remove(".dr"); //드롭다운 버튼 삭제
					
					let update = "";
					update += "<div>"
							+ "<textarea class='update'>" + replyContent + "</textarea><button type='button' class='btn-close' data-bs-dismiss='modal' aria-label='Close' onclick='selectReplyList();'></button> </div>"
						    + "<div style='height:100%'><button id='upBtn' style='height:auto' onclick='updateReply(" + replyNo + ");'>" + "등록" + "</button>"
							+ "</div>";
					
							
					$(".c" + replyNo).html(update);
					$(".c" + replyNo + ".update").focus();
					
				}
				
				
				
				//댓글 수정
				function updateReply(replyNo){
					
					if( $(".update").val().trim().length != 0 ){
					
						$.ajax({
							url:"update.re",
							data:{replyNo:replyNo, replyContent:$(".update").val()},
							success:function(result){
								
								if(result == "success"){
									alertify.alert("댓글이 수정되었습니다.");
									selectReplyList();
								}
								
							},
							error:function(){
								console.log("댓글 수정용 ajax통신 실패");
							}
						})
					}else{
						alertify.alert("댓글 내용을 입력해주세요.");
					}
				}
				
				
				
				
				
				
				
				//댓글 등록
				function addReply(){
					
					console.log(${d.dietNo});
					console.log($(".content").val());
					console.log('${loginUser.empNo}');
					console.log('${loginUser.empName}');
					
					if( $(".content").val().trim().length != 0 ){
						
						$.ajax({
							url:"rinsert.di",
							data:{replyContent:$(".content").val(),
								  dietNo:${d.dietNo},
								  replyWriter:'${loginUser.empNo}',
								  writerName:'${loginUser.empName}',
								  writerType:'E'
								 },
							success:function(result){
								
								console.log(result);
								if(result > 0){ 
									
		    						$(".content").val("");
		    						selectReplyList();
		    						
		    						//웹소켓 알람 (구분하기 위한 문자열 / 보내는 사람 아이디 / 받는 사람 아이디 )
		    						let socketMsg = "diet," + "${loginUser.empNo}" + "," + "${d.userNo}" + "," + "${d.dietNo}";
		    						//헤더에 담아둔 웹소켓의 클라이언트 메세지 보내기
		    						socket.send(socketMsg);
		    						
		    					}
								
							},
							error:function(){
								console.log("댓글 등록용 ajax통신 실패");
							}
						})
						
					}else{
						alertify.alert("댓글 내용을 입력해주세요.");
					}
					
				}
				
				
				
				//댓글 삭제
				$(document).on("click", ".d", function(){
					
					console.log($(this).parent().parent().parent().children().eq(0).text());
					
					$.ajax({
						url:"rdelete.di",
						data:{replyNo:$(this).parent().parent().parent().children().eq(0).text()},
						success:function(result){
							
							console.lig(result);
							
							alertify.alert("댓글이 삭제되었습니댜.");
							selectReplyList();
							
						},
						error:function(){
							console.log("댓글 삭제용 ajax 통신 실패");
						}
					})
				})
			</script>
			
			</div>
			<!-- /식단 -->
	                
	                
	                
	                
	                
	                
	                
	
	        <!-- 출결 -->
			<!-- <div class="tab-pane fade" id="navs-pills-justified-messages" role="tabpanel">
			</div> -->


	              
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