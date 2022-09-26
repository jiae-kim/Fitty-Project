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
    height: 40px;
    border-bottom: 1px solid #bdc3c7;
}
.todo-header-item{
    float: left;
}

/* 운동카드 한 줄 비율 */
.title{
    padding-left: 10px;
    padding-right: 5px;
    width:30%;
}
.count{width:10%; text-align: right;}

.set{width:10%; text-align: right;}

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

.custom-control-label{width:95%}

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
		<div class="tab-content" style="min-height: 695px;">
	
	
	
<!-- 오늘의 운동 -->
<div class="tab-pane fade show active" id="navs-pills-justified-home" role="tabpanel" style='width:100%'>
	        
	        <!-- 해당 날짜 -->
	        <div id='date' style="font-size:20px; font-wieght:900;" align="center">${exDate}</div>
	        
	        <!-- 추가 버튼 -->
		    <div id="add-btn-div" style="margin-right:10px; ">
		        <button type="button" class="btn btn-outline-primary add-btn" style='width:160px' data-bs-toggle="modal" data-bs-target="#backDropModal">
		            + 운동 추가
		        </button>
		    </div>
		    
		    <!-- 운동 진행률 -->
		    <div class='progress' style='background:none; font-size:15px; margin-left:10px; margin-bottom:20px; width:99%;'>
		        <div class="progress-bar bg-success" role="progressbar" style="height:20px" aria-valuemin="0" aria-valuemax="100"></div>
		    </div>
		    
		    
		    
	        <!-- 목록 -->
		    <div id="todo-list">
	        
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
		                    <div class="form-group">
		                        <label for="form-desc" class="col-form-label">내용 : </label> 
		                        <textarea class="form-control" id="coment" maxlength="300" required></textarea>
		                        <!-- 아무것도 입력하지 않았을 때 undefined가 출력되어 일단은 required로 막아둠 -->
		                    </div>
		                </div>
		
		                <!-- Modal footer -->
		                <div class="modal-footer">
		                	<button type="button" class="btn btn-outline-secondary x" data-bs-dismiss="modal">취소</button>
		                    <button type="button" class="btn btn-primary" id="insert">추가</button>
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
		                    <div class="form-group">
		                        <label for="form-desc" class="col-form-label">내용 : </label>
		                        <textarea class="form-control" id="update-coment" maxlength="300"></textarea>
		                    </div>
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
			    				html += "<div class='todo-div'>";
		                	}else{
		                		html += "<div class='todo-div' style='background:lavender'>";
		                	}
		                	
			    				html  +=    "<input type='hidden' id='exNo' value='" + list[i].exNo + "'>"
			    				      +     "<div class='todo-header'>"
			    				      +         "<div class='custom-control form-control-lg custom-checkbox col-sm-12 todo-header-item' style='padding: 0.25rem 0.25rem;'>"
			    				      +             "<div class='custom-control-label todo-header-item' for='customCheck0'>"
			    				      +             	"<label class='title'>" + list[i].exTitle + "</label>"
			    				      +             	"<label class='weight'>" + list[i].exWeight + " kg</label>"
			    				      +             	"<label class='count'>" + list[i].exCount + "회</label>"
			    				      +             	"<label class='set'>" + list[i].exSet + "set</label>"
								      + 			    "<div class='btn-group'>"
								      + 		           "<button type='button' class='btn btn-sm btn-icon rounded-pill dropdown-toggle hide-arrow' data-bs-toggle='dropdown' aria-expanded='false'>"
								      +						 "<i class='bx bx-dots-vertical-rounded' style='color:black'></i>"
								      +					   "</button>"
								      + 		           "<ul class='dropdown-menu dropdown-menu-end'>"
								      + 		             "<li><button type='button' class='btn upbtn' data-toggle='modal' data-target='#updateModal'>수정</button></li>"
								      + 		             "<li><button type='button' class='btn debtn';'>삭제</button></li>"
								      + 		           "</ul>"
								      + 		        "</div>"
			    			          +         	"</div>"
			    				      +         "</div>"
			    				      +     "</div>";
		    				      
			    				    html += "<div class='coment' align='left'>" + list[i].exComent;
			    				    html += 	"<div style='width:8%; float:right;'>";
			    				    
			    				    	if(list[i].exStatus == 'N'){
				    						html += "<button type='button' class='btn btn-outline-primary check'>완료</button>";
				    					}
			    				    
			    				    html += 	"</div>";
			    				    	  + "</div>";
			    				    	  
			    				html  +="</div></div>";
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
	                		exComent:$("#coment").val(), 
	                		classNo:${classNo}, 
	                		exWriter:$("#writer").val(),
	                		exWeight:$("#weight").val()
                		  },
	                success: function (result) {
	                	
	                	console.log("등록 성공");
	                    
	                	if(result > 0){
	                		 
				            //모달에 내용 비우기
				            $("#title").val('');
				            $("#count").val('');
				            $("#set").val('');
				            $("#coment").val('');
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
			
			
	        

	        //운동완료 체크시 상태변경
	        $(document).on("click", ".check", function(){
	        	
	        	var exNo = $(this).parent().parent().children().eq(1).val(); //여기수정필요
	        	
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
	        	
	        	var exNo = $(this).parent().parent().parent().parent().parent().parent().parent().children().eq(0).val();
	        	

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
	        	
	        	var exNo = $(this).parent().parent().parent().parent().parent().parent().parent().children().eq(0).val();
	        	
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