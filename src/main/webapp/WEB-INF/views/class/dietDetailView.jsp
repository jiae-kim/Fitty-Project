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
	   width: 97%; float: left; vertical-align: middle; padding-left: 10px;
	 }
	
	 .reply-content>#writer{
	   font-size: 13px; font-weight: 700;
	 }
	
	 .reply-content>#date{
	   color:lightgrey; font-size:11px
	 }
	
	 .reply-content>#content{
	   font-size: 14px;
	 }
	
	 .reply-like{
	   width: 3%; float: left;
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
	 
	 #up, #de {
	 	color:lightgrey;
	 	font-size:10px;
	 }
	 
	 #up:hover {
	 	color:red;
	 }
	 
	 #de:hover {
	 	color:red;
	 }
	 
	 .reply-like:hover{
	 	cursor:pointer;
	 	color:red;
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
	    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-justified-home" aria-controls="navs-pills-justified-home" aria-selected="false" style="text-weight:700">
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
		<div class="tab-content">
		<!--  style="height: 695px;" -->
	
	
	
	        <!-- 오늘의 운동 -->
	        <div class="tab-pane fade show active" id="navs-pills-justified-home" role="tabpanel">
	        </div>
	        <!-- /오늘의 운동 -->
		
		
		
		
	
	
	
	
	
	
	    	<!-- 오늘의식단 -->
			<div class="tab-pane fade" id="navs-pills-justified-profile" role="tabpanel">
				<div class="di-date" align="center">
		
		<!-- 여기에 사진 -->
		<div class="di-date" align="center">
        <a href="" style="color:#696CFF; font-size:20px">◀️</a> &nbsp;&nbsp;
        <label style="font-weight: 700; font-size:25px;"></label>  &nbsp;&nbsp;
        <a href="" style="color:#696CFF; font-size:20px">▶️</a>
        </div><br>
        
        				
		<button type="button" class="btn btn-sm rounded-pill btn-outline-primary" onclick="window.history.back();" style="float:right">
	       	<span class="tf-icons bx bx-calendar-check"></span>&nbsp; 달력보기
	    </button><br>
        
        

		<script>
			$(function(){
				let dateArr = "${d.dietDate}".split("/");
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



        </div>
		
				</div>
				

				<!-- 댓글 -->
				<div class="reply-wrap" style="height: 30%;">
		    		<label>댓글 <span id="rcount"></span></label><br>
		
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
							url:"rlist.di",
							data:{no:"${d.dietNo}"},
							success:function(list){
								console.log(list);
								
								let value = "";
								let type = "";
								for(let i=0; i<list.length; i++){
									if(list[i].replyWriter == '${loginUser.empNo}'){
										value += "<div class='reply' style='background:#c1b3ff12;'>";
									}else{
										value += "<div class='reply'>";
									}
									
									value += "<div class='reply-content'><label id='writer'>" + list[i].writerName + "&nbsp";
										   
									type = (list[i].writerType == "U") ? "회원" : "트레이너";
											
									value += type + "</label>&nbsp"
										   + "<label id='date'>" + list[i].replyDate + "</label>&nbsp;&nbsp;";
										   
									if(list[i].replyWriter == '${loginUser.empNo}'){
										value += "<button id='up' onclick='replyUpdate();'>수정</button>&nbsp;";
										value += "<button id='de'>삭제</button>";
									}
										   
									value += "<br><label id='content'>" + list[i].replyContent + "</label></div>"
										   + "<div class='reply-like'>" + "🤍" + "</div></div>";
								}
								
								$(".r").html(value);
								$("#rcount").text(list.length);
							},
							error:function(){
								console.log("댓글 리스트 조회용 ajax통신 실패");
							}
						})
						
					}
					
					
					//댓글 수정
					function replyUpdate(){
						
						let re = $(document).children("#content").text();
						console.log(re);
					}
					
					
					
					
					
					
					//댓글 등록
					function addReply(){
						if( $(".content").val().trim().length != 0 ){
							
							$.ajax({
								url:"rinsert.di",
								data:{replyContent:$(".content").val(),
									  dietNo:${d.dietNo},
									  replyWriter:'${loginUser.empNo}',
									  writerName:'${loginUser.empName}',
									  writerType:'E' //직접적으로 문자열을 전달해도 되나염?
									 },
								success:function(result){
									//컨트롤러에서 반환값은 int로 지정해도 괜찮은건가요?
									console.log(result);
									if(result > 0){ 
			    						$(".content").val("");
			    						selectReplyList();
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