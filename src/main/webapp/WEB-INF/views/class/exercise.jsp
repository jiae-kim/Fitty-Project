<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
    margin: 1% 10%;
}
input{
    border-style: groove;
    width: 12px;
}
button{
    border-style: groove;
}
.shadow{
    box-shadow: 3px 7px 7px rgba(0, 0, 0, 0.03);
}
h1{
    text-align: center;
    font-weight: 900;
    margin: 2.5rem 0 1.5rem;
}
.add-btn{
    background-color: #6495ED;
    float: right;
    color: white;
    width: 30%;
}
#add-btn-div{
    height: 40px;
    margin: 3px;
}
.todo-div{
    margin: 10px 10px;
    border: 3px solid #6d64ed69;
    border-radius: 8px;
    padding: 10px;
}
.todo-btn{
    margin: 5px 10px;
}
/* check box */
.custom-control-label::before,
.custom-control-label::after {
    width: 1.25rem;
    height: 1.25rem;
}
.todo-header{
    height: 32px;
}
.todo-header-item{
    float: left;
}

/* 운동카드 한 줄 비율 */
.title{
    padding-left: 10px;
    padding-right: 5px;
    width:40%;
}
.weight{width:15%; text-align:right; margin-top:6px}

.count{width:15%; text-align: right; margin-top:6px}

.set{width:15%; text-align: right; margin-top:6px}

.check{float:right; margin-right:1px; margin-top:-1px; width:70px; height:35px;}

.coment{
    padding: 10px;
    color: #787878;
}


.todo-done-text{
    text-decoration: line-through;
    color: #999999;
}

.cc{
	background-color: #bfbbf433;
}

.todo-header-item>input{
	vertical-align:middle;
	/* margin-top: 6px; */
}

.custom-control-label{width:100%; height:100%;}

.custom-conrtol{
	padding:0.75rem 0.25rem;
}

.custom-control-input{width:20px; height:20px}

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
	<div class="col-md-2 col-12 mb-md-0 mb-4" style="height:700px">
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
        	<label style='font-size:15px; font-weight:600'>수업목표 : 체중 증량</label><br>
        	<label style='font-size:15px; font-weight:600'>기대결과 :  정상 체중</label><br><br>
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
	    <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-justified-home" 
	    aria-controls="navs-pills-justified-home" aria-selected="true" style="text-weight:700"
	    >
	      🔥 오늘의 운동
	    <!-- <span class="badge rounded-pill badge-center h-px-20 w-px-20 bg-danger">3</span> -->
	    </button>
		</li>
		
		
	    <li class="nav-item">
	    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-justified-profile" 
	    aria-controls="navs-pills-justified-profile" aria-selected="false"
	    onclick="location.href='dietDetail.cl?dietDate=${exDate }&classNo=${classNo}';"
	    >
	      🌮 식단관리
	    </button>
	    </li>
	    
	    <!-- 
	    <li class="nav-item">
	    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-justified-messages" 
	    aria-controls="navs-pills-justified-messages" aria-selected="false"
	    >
	      ✏️ 출결확인
	    </button>
		</li> -->
		</ul>
		<!-- / 내용위에 분류버튼 -->




	          
        <!-- 내용 넣을 부분 (* 수정해도 되는 부분)-->
		<div class="tab-content" style="min-height: 695px; display: table-cell;">
	
	
	
<!-- 오늘의 운동 -->
<div class="tab-pane fade show active" id="navs-pills-justified-home" role="tabpanel" style='width:100%'>
	        
	        <!-- 해당 날짜 -->
	        <div id='date' style="font-size:22px; font-weight:700; margin-bottom:30px" align="center"></div>
	        <button type="button" class="btn btn-sm rounded-pill btn-outline-primary" onclick="location.href='main.cl?classNo=${classNo}';" style="float:left;">
			     <span class="tf-icons bx bx-calendar-check"></span>&nbsp; 달력보기
			</button><br>
	        
	        
	        <script>
				$(function(){
					let dArr = "${exDate}".split("/");
					let d = "20" + dArr[0] + "년 " + dArr[1] + "월 " + dArr[2] + "일";
					
					$("#date").text(d);
					
					var today = new Date();
					
				})
			</script>
	        
	       
		    <!-- 추가 버튼 -->
		    <div id="add-btn-div" style="margin-right:10px; margin-bottom:30px">
		        <button type="button" class="btn btn-primary add-btn" style='width:110px; margin-right:15px; margin-top:15px;' data-bs-toggle="modal" data-bs-target="#backDropModal">
		            + 운동추가
		        </button>
		        <button type="button" class="btn btn-primary feedback" style='width:110px; margin-right:15px; margin-top:15px; float:right' data-bs-toggle="modal" data-bs-target="#feedbackForm">
		            피드백
		        </button>
		    </div>
		    
		    
		    
		    <!-- 운동 진행률 -->
		    <div style='width:99%;'><i class='bx bxs-battery-charging' style='font-size:26px !important'></i>&nbsp;<label style='font-size:16px; font-weight:500'> 진행률</label>
		    <div class='progress' style='background:none; font-size:15px; margin-bottom:30px; width:99%; background:rgba(67,89,113,.1); height:20px; margin-top:2px; margin-right:60px'>
		        <div class="progress-bar bg-info" role="progressbar" style="height:20px" aria-valuemin="0" aria-valuemax="100  margin-right:60px"></div>
		    </div>
		    </div>
		    
		    
		    
	        <!-- 목록 --> 
	        <i class='bx bx-layer-plus' style='font-size:26px'></i>&nbsp;<label style='font-size:16px; font-weight:500'> 운동목록</label>
		    <div id="todo-list" style='width:100%; height:100%;'>
	        
		    </div>
		    
		    
		    
		    <!--  등록 폼 --> 
		    <div class="modal fade" id="backDropModal" data-bs-backdrop="static" tabindex="-1" style="display: none;" aria-hidden="true">
		        <div class="modal-dialog">
		            <div class="modal-content">
		
		                <!-- Modal Header -->
		                <div class="modal-header">
		                    <h4 class="modal-title">운동 등록하기</h4>
		                    <!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
		                </div>
		
		                <!-- Modal body -->
		                <div class="modal-body">
		                <input type="hidden" id="writer" value="E">
		                <input type="hidden" id="exDate" value="${exDate }">
		                    <div class="form-group">
		                        <label for="form-title" class="col-form-label">운동명 : </label>
		                        <input type="text" class="form-control" id="title"  maxlength="40">
		                    </div>
		                    <div class="row g-2">
			                    <div class="col mb-0">
			                      <label for="emailBackdrop" class="form-label">무게 : </label>
			                      <input type="text" class="form-control" id="weight">
			                    </div>
			                    <div class="col mb-0">
			                      <label for="emailBackdrop" class="form-label">횟수 : </label>
			                      <input type="number" class="form-control" id="count" min="1" value="1">
			                    </div>
			                    <div class="col mb-0">
			                      <label for="dobBackdrop" class="form-label">세트수 : </label>
			                      <input type="number" class="form-control" id="set" min="1" value="1">
			                    </div>
			                </div>
		                    <!-- <div class="form-group">
		                        <label for="form-desc" class="col-form-label">내용 : </label> 
		                        <textarea class="form-control" id="coment" maxlength="300" required></textarea>
		                        아무것도 입력하지 않았을 때 undefined가 출력되어 일단은 required로 막아둠
		                    </div> -->
		                </div>
		
		                <!-- Modal footer -->
		                <div class="modal-footer">
		                	<button type="button" class="btn btn-outline-secondary x" data-bs-dismiss="modal">취소</button>
		                    <button type="button" class="btn btn-primary" id="insert">추가</button>
		                </div>
		            </div>
		        </div>
		    </div>
		    
		    
		    <!-- 피드백 폼 -->
		    <div class="modal fade" id="feedbackForm" data-bs-backdrop="static" tabindex="-1" style="display: none;" aria-hidden="true">
		        <div class="modal-dialog">
		            <div class="modal-content">
		
		                <!-- Modal Header -->
		                <div class="modal-header">
		                    <h4 class="modal-title">트레이너 피드백</h4>
		                </div>
		
		                <!-- Modal body -->
		                <div class="modal-body">
		                <input type="hidden" id="writer" value="E">
		                    <div class="form-group">
		                        <label for="form-title" class="col-form-label">내용 : </label>
		                        <textarea class="form-control" id="feedback" maxlength="300" required></textarea>
		                    </div>
		                </div>
		
		                <!-- Modal footer -->
		                <div class="modal-footer">
		                	<button type="button" class="btn btn-outline-secondary x" data-bs-dismiss="modal">취소</button>
		                    <button type="button" class="btn btn-primary" id="insertFeedback">추가</button>
		                </div>
		            </div>
		        </div>
		    </div>
		
		
		    <!-- 수정 폼 -->
		    <div class="modal" id="updateModal">
		        <div class="modal-dialog">
		            <div class="modal-content">
		
		                <!-- Modal Header -->
		                <div class="modal-header">
		                    <h4 class="modal-title">운동 수정하기</h4>
		                    <button type="button" class="close" data-dismiss="modal">&times;</button>
		                </div>
		                <!-- Modal body -->
		                <div class="modal-body">
		                    <input type="hidden" id="update-todo-id">
		                    <div class="form-group">
		                        <label for="form-title" class="col-form-label">운동명 : </label>
		                        <input type="text" class="form-control" id="update-title"  maxlength="40">
		                    </div>
		                    <div class="row g-2">
			                    <div class="col mb-0">
			                      <label for="emailBackdrop" class="form-label">무게 : </label>
			                      <input type="text" class="form-control" id="update-weight">
			                    </div>
			                    <div class="col mb-0">
			                      <label for="emailBackdrop" class="form-label">횟수 : </label>
			                      <input type="number" class="form-control" id="update-count" min="1" value="1">
			                    </div>
			                    <div class="col mb-0">
			                      <label for="dobBackdrop" class="form-label">세트수 : </label>
			                      <input type="number" class="form-control" id="update-set" min="1" value="1">
			                    </div>
			                </div>
		                   <!--  <div class="form-group">
		                        <label for="form-desc" class="col-form-label">내용 : </label>
		                        <textarea class="form-control" id="update-coment" maxlength="300"></textarea>
		                    </div> -->
		                </div>
		
		                <!-- Modal footer -->
		                <div class="modal-footer">
		                    <button type="button" class="btn btn-outline-secondary x" data-dismiss="modal">취소</button>
		                    <button type="button" class="btn btn-primary" id="update">수정</button>
		                </div>
		
		            </div>
		        </div>
		    </div>
	        
	        
    
</div>
<!-- /오늘의 운동 -->
	        
	       <%--  <c:set var="date" value="<%=new java.util.Date()%>" />
			<fmt:formatDate var="exDate" value="${date}" pattern="yy/MM/dd" /> --%>
			
	        <script>
			$(function(){
				
				load();
				progress();
			})
			
			
			
			//오늘 날짜 운동 리스트 전체 조회
	        function load(){
	        	
	            $.ajax({
	                url: "exList.cl",
	                data:{
	                	 classNo: ${classNo},
	                	 exDate: "${exDate}"
	                 	 },
	                success: function(list) {
	                	
	                	console.log(list);
	                	
	                	var html = "";

	                	for(let i in list){
	                		
		                	if(list[i].exStatus == 'N'){
			    				html += "<div style='height:10%;'><div class='todo-div' style='width:98%; margin:5px 0px; float:left; text-align:middle;'>";
		                	}else{
		                		html += "<div style='height:10%'><div class='todo-div' style='width:98%; margin:5px 0px; float:left; text-align:middle; background:lavender;'>";
		                	}
		                	
			    				html  +=    "<input type='hidden' id='exNo' value='" + list[i].exNo + "'>"
			    				      +     "<div class='todo-header'>"
			    				      +             "<div class='custom-control-label todo-header-item' for='customCheck0'>"
			    				      +             	"<label class='title'>" + list[i].exTitle + "</label>"
			    				      +             	"<label class='weight'>" + list[i].exWeight + " kg</label>"
			    				      +             	"<label class='count'>" + list[i].exCount + "회</label>"
			    				      +             	"<label class='set'>" + list[i].exSet + "set</label>";
			    				      
			    				      if(list[i].exStatus == 'N'){
								html  += 				"<button type='button' class='btn btn-sm btn-outline-primary check' style='font-size:14px;'>미완료</button>";
			    				      }
			    				      
			    			    html  +=        	"</div>"
			    				      +     "</div>";
		    				      
			    				html += "</div>";
			    				
			    				html += "<div class='btn-group' style='width:2%; float:left; top:10px; top:21px; '>"
									 +  	"<button type='button' class='btn btn-sm btn-icon rounded-pill dropdown-toggle hide-arrow' data-bs-toggle='dropdown' aria-expanded='false'>"
									 +	 		"<i class='bx bx-dots-vertical-rounded' style='color:black'></i>"
									 + 		"</button>"
									 + 		"<ul class='dropdown-menu dropdown-menu-end'>"
									 +   		"<li><button type='button' class='btn upbtn' data-toggle='modal' data-target='#updateModal'>수정</button></li>"
									 +   		"<li><button type='button' class='btn debtn';'>삭제</button></li>"
									 + 		"</ul>"
								     + "</div></div>";
		                	}
	                	
	    				$("#todo-list").html(html);
	    				
	                },
	                error: function() {
	                    console.log("운동 리스트 전체조회용 ajax 통신 실패");
	                }
	            });
	            
	        }
			
			
			
			
			//운동 진행률
			function progress(){
				
				$.ajax({
					url:"progress.cl",
					data:{classNo:${classNo},
						  exDate:"${exDate}"},
					success:function(result){
						
						console.log("진행률 : " + result);
						
						$(".progress-bar").text(result + "%");
						$(".progress-bar").attr("aria-valuenow", result);
						$('.progress-bar').css({"width": result + "%"});
						
					},
					error:function(){
						console.log("진행률 조회용 ajax 통신 실패");
					}
				})

			}
			

			
			
	        // 운동 등록
	        $("#insert").click( function() {
				
	            console.log('추가 시작');
	            
	            $.ajax({
	                url: "insertEx.cl",
	                data: {exTitle:$("#title").val(), 
	                		exCount:$("#count").val(), 
	                		exSet:$("#set").val(), 
	                		classNo:${classNo}, 
	                		exWriter:$("#writer").val(),
	                		exWeight:$("#weight").val(),
	                		exDate:"${exDate}"
                		  },
	                success: function (result) {
	                	
	                	console.log("등록 성공");
	                    
	                	if(result > 0){
	                		 
				            //모달에 내용 비우기
				            $("#title").val('');
				            $("#count").val('');
				            $("#set").val('');
				            $("#weight").val('');
				            $('#backDropModal').modal('toggle');
	                		
		                    load(); //오늘 운동 리스트 조회
		                    progress();
		                    
	                	}else{
	                		alert("등록실패");
	                	}
	                    
	                },
	                error: function () {
	                    console.log("운동추가용 ajax 통신 실패");
	                }
	            });
	            
	        } ); 
			
			
	        
	        //트레이너 피드백 추가
	        $("#insertFeedback").click(function(){
	        	
	        	console.log($("#feedback").val());
	        	
	        	$.ajax({
	        		url:"feedback.cl",
	        		data:{exDate:"${exDate}", classNo:${classNo}, exComent:$("#feedback").val()},
	        		success:function(result){
	        			
	        			alertify.alert("피드백이 등록되었습니다.");
	        			
	        		},
	        		error:function(){
	        			console.log("피드백 추가용 ajax 통신 실패");
	        		}
	        	})
	        })
	        
	        function selectFeedback(){
	        	$.ajax({
	        		url:"selectFeedback.cl",
	        		data:{exDate:"${exDate}", classNo:${classNo}},
	        		success:function(ee){
	        			
	        			$("#feedback").val(ee.exComent);
	        			
	        		},
	        		error:function(){
	        			console.log("피드백 조회용 ajax 통신 실패");
	        		}
	        	})
	        }
	        

	        
	        
	        //운동완료 체크시 상태변경
	        $(document).on("click", ".check", function(){
	        	
	        	var exNo = $(this).parent().parent().parent().children().eq(0).val();
	        	
	        	console.log(exNo);
	        	
	        	
	        	$.ajax({
	        		url:"checkEx.cl",
	        		data:{exNo:exNo},
	        		success:function(result){
	        			
	        			console.log("완료 : " + result);
	        			load();
	        			progress();
	        			
	        		},
	        		error:function(){
	        			
	        			console.log("운동완료 ajax 통신 실패");
	        		}
	        	})
	        	
	        })
	        
	        
	        
	        //운동 삭제
	        $(document).on("click", ".debtn", function(){
	        	
	        	var exNo = $(this).parent().parent().parent().prev().children().eq(0).val();
	        	

	            $.ajax({
	                url: 'deleteEx.cl',
	                data: {exNo:exNo},
	                success: function (result) {
	                	
	                	if(result > 0){
	                		alertify.alert("운동 항목이 삭제되었습니다.");
		                    load();
		                    progress();
	                	}
	                },
	                error: function () {
	                    console.log("운동 삭제용 ajax 통신 실패");
	                }
	            });
	        })
	        
	        
	        //모달 close할때 안에 값 비우기 ????????????왜안돼?
	        $('.x').on('hidden.bs.modal', function (e) {
	        	$(this).find('form')[0].reset();
	        })

	        
	        
	        
	        //수정 버튼 클릭시 해당 글 내용 조회
	        $(document).on("click", ".upbtn", function(){
	        	
	        	var exNo = $(this).parent().parent().parent().prev().children().eq(0).val();
	        	
	        	console.log("수정버튼 클릭시 : " + exNo);
	        	
	            $.ajax({
	                url: 'selectEx.cl',
	                data:{exNo:exNo},
	                success: function (ex) {
	                	
	                	console.log(ex);
	                	
	                   	$("#update-title").val(ex.exTitle);
	                    $("#update-count").val(ex.exCount);
	                    $("#update-set").val(ex.exSet);
	                    $("#update-coment").val(ex.exComent);
	                    $("#update-weight").val(ex.exWeight);
	                    
	                },
	                error: function () {
	                    console.log("운동 수정용 조회 ajax 통신 실패");
	                }
	            })
	        })
	        	
	        
	        
	        
	        //운동 수정
	        $("#update").click( function() {
	        	
	            console.log('업데이트 시작');
	            
	            var title = $("#update-title").val();
	            var count = $("#update-count").val();
	            var set = $("#update-set").val();
	            var coment = $("#update-coment").val();
	            var weight = $("#update-weight").val();
	            var exNo = $("#exNo").val();
	            
	            console.log(title, count, set, coment, exNo, weight);
	            
	            var JSONObject = {'exTitle': title, 'exCount': count, 'exSet' : set, 'exComent' : coment, 'exNo' : exNo, 'exWeight' : weight};
	            
	            $.ajax({
	                url: 'updateEx.cl',
	                data: JSONObject,
	                method: "get",
	                success: function (result) {
	                	
	                    console.log("업데이트 완료");
	                    
			            $("#update-title").val('');
			            $("#update-count").val('');
			            $("#update-set").val('');
			            $("#update-coment").val('');
			            $("#update-weight").val('');
			            $('#updateModal').modal('toggle');
			            
			            load();
			            progress();
			            
	                },
	                error: function () {
	                    console.log("운동수정용 ajax 통신 실패");
	                }
	            });
	            
	            
                
	        });
	        </script>
	        
	        
	        
	        
	        
	        
	        
	
	
	
	
	
	    	<!-- 오늘의식단 -->
			<div class="tab-pane fade" id="navs-pills-justified-profile" role="tabpanel" style="height:100%; width:100%">
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