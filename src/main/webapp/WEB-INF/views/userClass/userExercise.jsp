<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
.title{
    padding-left: 10px;
    padding-right: 5px;
    width: 60%;
}
.count{width:17%; text-align: right;}

.set{width:20%; text-align: right;}

.todo-desc{
    padding: 10px;
    height:30px;
    color: #787878;
}
.dead-line-date{
    top: 0.25rem;
    font-size: 0.85rem;
    color: #2C2C2C;
}
.todo-display-none{
    display: none;
}
.todo-done-text{
    text-decoration: line-through;
    color: #999999;
}

.cc{
	background-color: #bfbbf433;
}

.time-over{
    font-size: 0.7rem;
    color: #FF5733;
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

<jsp:include page="userHeader.jsp" />


<div class="row">
    <div class="col-md-12">
    <div class="card mb-4">
		<h5 class="card-header"></h5>
		<div class="card-body row" style="height:740px">
		
		
      <div>

 			<div id='date' style="font-size:20px; font-wieght:900;" align="center"></div>
	        <!-- 추가 버튼 -->
		    <div id="add-btn-div">
		        <button type="button" class="btn btn-primary add-btn" data-bs-toggle="modal" data-bs-target="#backDropModal">
		            + 운동 추가
		        </button>
		    </div>
		    
		    
		    
		    <!--  등록 --> 
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
		                <input type="hidden" id="writer" value="U">
		                    <div class="form-group">
		                        <label for="form-title" class="col-form-label">운동명 : </label>
		                        <input type="text" class="form-control" id="title"  maxlength="40">
		                    </div>
		                    <div class="row g-2">
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
		                        <textarea class="form-control" id="coment" maxlength="300"></textarea>
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
		
		
		    <!-- 수정 -->
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
	        
	        
	        <!-- 목록 -->
		    <div id="todo-list">
	        <div style="float:left; width:50%;">
	        
		      <!--0-->
		        <div class='todo-div todo-display-none' id='todo-div0'>
		            <input type='hidden' id='todo-id0'>
		            <input type="hidden" id="exNo">
		            <div class='todo-header'>
		                <div class='custom-control form-control-lg custom-checkbox col-sm-12 todo-header-item' style='padding: 0.25rem 0.25rem;'>
		                    <input type='checkbox' class='custom-control-input todo-header-item' id='customCheck0' value= 0 >
		                    <div class='custom-control-label todo-header-item' for='customCheck0'>
		                    	<label class='title title0'><!--제목--></label>
		                    	<label class='count count0'><!-- 횟수 --></label>
		                    	<label class='set set0'><!-- 세트수 --></label>
	                    	</div>
		                </div>
		            </div>
		            <div class='todo-desc desc0' align='left'>
		            	<!-- 설명 -->
		            </div>
		            <div class='todo-btn' align="right">
		                <button type='button' class='btn btn-outline-primary upbtn' data-toggle='modal' data-target='#updateModal'>수정</button>
		                <button type='button' class='btn btn-outline-dark' onclick='deleteTodo(0);'>삭제</button>
		            </div>
		        </div>
		        
		      <!--2-->
		        <div class='todo-div todo-display-none' id='todo-div2'>
		            <input type='hidden' id='todo-id2'>
		            <input type="hidden" id="exNo">
		            <div class='todo-header'>
		                <div class='custom-control form-control-lg custom-checkbox col-sm-12 todo-header-item' style='padding: 0.25rem 0.25rem;'>
		                    <input type='checkbox' class='custom-control-input todo-header-item' id='customCheck2' value= 2 >
		                    <div class='custom-control-label todo-header-item' for='customCheck2'>
		                    	<label class='title title2'><!--제목--></label>
		                    	<label class='count count2'><!-- 횟수 --></label>
		                    	<label class='set set2'><!-- 세트수 --></label>
	                    	</div>
		                </div>
		            </div>
		            <div class='todo-desc desc2' align='left'>
		            	<!-- 설명 -->
		            </div>
		            <div class='todo-btn' align="right">
		                <button type='button' class='btn btn-outline-primary upbtn' data-toggle='modal' data-target='#updateModal'>수정</button>
		                <button type='button' class='btn btn-outline-dark' onclick='deleteTodo(2);'>삭제</button>
		            </div>
		        </div>
		      
		      <!--4-->
		        <div class='todo-div todo-display-none' id='todo-div4'>
		            <input type='hidden' id='todo-id4'>
		            <input type="hidden" id="exNo">
		            <div class='todo-header'>
		                <div class='custom-control form-control-lg custom-checkbox col-sm-12 todo-header-item' style='padding: 0.25rem 0.25rem;'>
		                    <input type='checkbox' class='custom-control-input todo-header-item' id='customCheck4' value= 4 >
		                    <div class='custom-control-label todo-header-item' for='customCheck4'>
		                    	<label class='title title4'><!--제목--></label>
		                    	<label class='count count4'><!-- 횟수 --></label>
		                    	<label class='set set4'><!-- 세트수 --></label>
	                    	</div>
		                </div>
		            </div>
		            <div class='todo-desc desc4' align='left'>
		            	<!-- 설명 -->
		            </div>
		            <div class='todo-btn' align="right">
		                <button type='button' class='btn btn-outline-primary upbtn' data-toggle='modal' data-target='#updateModal'>수정</button>
		                <button type='button' class='btn btn-outline-dark' onclick='deleteTodo(4);'>삭제</button>
		            </div>
		        </div>
		        
		      </div>
		      
		      
		      <div style="float:right; width:50%">  
		      <!--1-->
		        <div class='todo-div todo-display-none' id='todo-div1'>
		            <input type='hidden' id='todo-id1'>
		            <input type="hidden" id="exNo">
		            <div class='todo-header'>
		                <div class='custom-control form-control-lg custom-checkbox col-sm-12 todo-header-item' style='padding: 0.25rem 0.25rem;'>
		                    <input type='checkbox' class='custom-control-input todo-header-item' id='customCheck1' value= 1 >
		                    <div class='custom-control-label todo-header-item' for='customCheck1'>
		                    	<label class='title title1'><!--제목--></label>
		                    	<label class='count count1'><!-- 횟수 --></label>
		                    	<label class='set set1'><!-- 세트수 --></label>
	                    	</div>
		                </div>
		            </div>
		            <div class='todo-desc desc1' align='left'>
		            	<!-- 설명 -->
		            </div>
		            <div class='todo-btn' align="right">
		                <button type='button' class='btn btn-outline-primary upbtn' data-toggle='modal' data-target='#updateModal'>수정</button>
		                <button type='button' class='btn btn-outline-dark' onclick='deleteTodo(1);'>삭제</button>
		            </div>
		        </div>
		      
		      <!--3-->
		        <div class='todo-div todo-display-none' id='todo-div3'>
		            <input type='hidden' id='todo-id3'>
		            <input type="hidden" id="exNo">
		            <div class='todo-header'>
		                <div class='custom-control form-control-lg custom-checkbox col-sm-12 todo-header-item' style='padding: 0.25rem 0.25rem;'>
		                    <input type='checkbox' class='custom-control-input todo-header-item' id='customCheck3' value= 3 >
		                    <div class='custom-control-label todo-header-item' for='customCheck3'>
		                    	<label class='title title3'><!--제목--></label>
		                    	<label class='count count3'><!-- 횟수 --></label>
		                    	<label class='set set3'><!-- 세트수 --></label>
	                    	</div>
		                </div>
		            </div>
		            <div class='todo-desc desc3' align='left'>
		            	<!-- 설명 -->
		            </div>
		            <div class='todo-btn' align="right">
		                <button type='button' class='btn btn-outline-primary upbtn' data-toggle='modal' data-target='#updateModal'>수정</button>
		                <button type='button' class='btn btn-outline-dark' onclick='deleteTodo(3);'>삭제</button>
		            </div>
		        </div>
		        
		      
		        
		      <!--5-->
		        <div class='todo-div todo-display-none' id='todo-div5'>
		            <input type='hidden' id='todo-id5'>
		            <input type="hidden" id="exNo">
		            <div class='todo-header'>
		                <div class='custom-control form-control-lg custom-checkbox col-sm-12 todo-header-item' style='padding: 0.25rem 0.25rem;'>
		                    <input type='checkbox' class='custom-control-input todo-header-item' id='customCheck5' value= 5 >
		                    <div class='custom-control-label todo-header-item' for='customCheck5'>
		                    	<label class='title title5'><!--제목--></label>
		                    	<label class='count count5'><!-- 횟수 --></label>
		                    	<label class='set set5'><!-- 세트수 --></label>
	                    	</div>
		                </div>
		            </div>
		            <div class='todo-desc desc5' align='left' align="right">
		            	<!-- 설명 -->
		            </div>
		            <div class='todo-btn' align="right">
		                <button type='button' class='btn btn-outline-primary upbtn' data-toggle='modal' data-target='#updateModal'>수정</button>
		                <button type='button' class='btn btn-outline-dark' onclick='deleteTodo(5);'>삭제</button>
		            </div>
		        </div>
		     </div>    
		      
		    </div>
        
      </div>
		
		
		
		<c:set var="date" value="<%=new java.util.Date()%>" />
		<fmt:formatDate var="exDate" value="${date}" pattern="yy/MM/dd" />
			
	        <script>
			$(function(){
				
				load();
				
		        var today = new Date();
				var dd = today.getDate();
				var mm = today.getMonth()+1;
				var yy = today.getFullYear().toString().substring(2);

				if(dd<10){
				    dd='0'+dd;
				}
				if(mm<10){
				    mm='0'+mm;
				}
				today = yy + mm + dd;
				
				var t = "20" + yy + "년 " + mm + "월 " +  dd + "일";
				
				$("#date").text(t);
				//'YY/MM/DD'형식이 data로 넘어가지 않아 일단은 붙여두었음
				
			})

			
	        // 운동 추가하기
	        $("#insert").click( function() {
				
	            console.log('추가 시작');
	            var title = $("#title").val();
	            var count = $("#count").val();
	            var set = $("#set").val();
	            var coment = $("#coment").val();
	            var writer = $("#writer").val();
	            
	            console.log(count, set, coment);
	            console.log(title);
	            
	            $.ajax({
	                url: "insertEx.cl",
	                data: {exTitle:title, exCount:count, exSet:set, exComent:coment, classNo:${classNo}, exWriter:writer},
	                success: function (result) {
	                    
	                	if(result > 0){
	                		alert("운동이 추가되었습니다.");
		                    load();
	                	}else{
	                		alert("등록실패");
	                	}
	                    
	                },
	                error: function () {
	                    console.log("운동추가용 ajax 통신 실패");
	                }
	            });
	            
	            
	            
	            $("#title").val('');
	            $("#count").val('');
	            $("#set").val('');
	            $("#coment").val('');
	            $('#backDropModal').modal('toggle');
	        } ); 
			
			
			

	        // 추가 후 리스트 조회
	        function load(){
	        	
	            $.ajax({
	                url: "exList.cl",
	                data:{
	                	 classNo: ${classNo},
	                	 exDate: "${exDate}"
	                 	 },
	                success: function(list) {
	                	
	                	console.log(list);
	                    console.log("조회 성공");
	                	
	                    hideDisplay();
	                    
	                    var todoDiv = "#todo-div"
	                    var title = ".title"
	                    var count = ".count"
	                    var set = ".set"
	                    var coment = ".desc"
	                    var complete = "#customCheck"
	                    var todoid = "#todo-id"
	                    var exNo = "#exNo"
	                    
	                    for(var i = 0; i < list.length; i++){
	                    	
	                    	//완료 상태일 때 텍스트에 줄이 그어지도록
	                        /* if( list[i].exStatus == 'Y'){
	                            $( complete+i ).prop("checked" , true);
	                            $( title+i ).addClass("todo-done-text");
	                            $( coment+i ).addClass("todo-done-text");
	                            $( count+i ).addClass("todo-done-text");
	                            $( set+i ).addClass("todo-done-text"); 
	                            $( todoid+i ).addClass("todo-done-text"); 
	                        }else{
	                            $( complete+i ).prop("checked" , false);
	                            $( title+i ).removeClass("todo-done-text");
	                            $( coment+i ).removeClass("todo-done-text");
	                            $( count+i ).removeClass("todo-done-text");
	                            $( set+i ).removeClass("todo-done-text"); 
	                            $( todoid+i ).removeClass("todo-done-text"); 
	                        } */
	                        
	                        
	                        
	                        $( todoDiv+i ).removeClass('todo-display-none');
	                        //$( todoid+i ).val(list[i].exNo);
	                        $( title+i ).text(list[i].exTitle);
	                        $( coment+i ).text(list[i].exComent);
	                        $( count+i ).text(list[i].exCount + "개");
	                        $( set+i ).text(list[i].exSet + "세트");
	                        
	                        $( exNo ).val(list[i].exNo);
	                        
	                    }
	                    
	                },
	                error: function() {
	                    console.log("ajax 통신 실패");
	                }
	            });
	            
	        }
			
	        
	        
	        
	        //checkbox 클릭 시 완료X->완료로 상태변경 (완료->완료X 상태 변경??????)
	        $("input[type='checkbox']").change(function(){
	        	
	            var index = $(this).val();
	            var div = "#todo-div" + index;
	            
	            if(this.checked) {
	                $(div).addClass("cc");
	            }else {
	                $(div).removeClass("cc");
	            }
	            
	            $.ajax({
	                url: 'checkEx.cl',
	                data: {exNo:$("#exNo").val()},
	                success: function (result) {
	                	
	                    console.log(result);
	                    load();
	                    
	                },
	                error: function () {
	                    console.log("체크박스 상태변경용 ajax 통신 실패");
	                }
	            });

	        });
	        
	        
	        
	        
	        function hideDisplay(){
	            $('.todo-div').addClass('todo-display-none');
	        }
	        
	        
	        
	        //운동 삭제
	        function deleteTodo(index) {

	            $.ajax({
	                url: 'deleteEx.cl',
	                data: {exNo: $("#exNo").val()},
	                success: function (result) {
	                	
	                	if(result > 0){
		                    load();
	                	}
	                },
	                error: function () {
	                    console.log("운동 삭제용 ajax 통신 실패");
	                }
	            });
	        }
	        
	        
	        
	        //모달 close할때 안에 값 비우기 ????????????왜안돼?
	        $('.x').on('hidden.bs.modal', function (e) {
	        	$(this).find('form')[0].reset();
	        })

	        
	        
	        
	        //수정 버튼 클릭시 insert되어있던 내용 조회해 뿌리기
	        /* $(".upbtn").click(function(){
	        	
	        	var $btn = $(this).parent().parent().children().eq(1).val();
	        	
	        	console.log("btn" + $btn);
	        	
	            $.ajax({
	                url: 'selectExercise.cl',
	                data:{exNo: $btn},
	                success: function (ex) {
	                	
	                	console.log("ex" + ex);
	                	
	                    $("#update-title").val(ex.exTitle);
	                    $("#update-count").val(ex.exCount);
	                    $("#update-set").val(ex.exSet);
	                    $("#update-coment").val(ex.exComent);
	                },
	                error: function () {
	                    console.log("운동 수정용 조회 ajax 통신 실패");
	                }
	            })
	        }) */
	        
	        
	        
	        
	        //수정 버튼 클릭시 insert되어있던 내용 조회해 뿌리기
	        /* function select(exNo){
	        	
	        	//var $btn = $(this).parent().parent().children().eq(1).val();
	        	
	        	//console.log($btn);
	        	
	        	//var id = $("#todo-id" + index).val();
	            // $("#update-todo-id").val(id);
	            //if(id == null) return;
	            
	            $.ajax({
	                url: 'selectExercise.cl',
	                data:{exNo: exNo},
	                success: function (ex) {
	                	
	                	console.log(ex);
	                	
	                    $("#update-title").val(ex.exTitle);
	                    $("#update-count").val(ex.exCount);
	                    $("#update-set").val(ex.exSet);
	                    $("#update-coment").val(ex.exComent);
	                },
	                error: function () {
	                    console.log("운동 수정용 조회 ajax 통신 실패");
	                }
	            })
	        } */
	        
	        
	        // 업데이트 (수정 )
	        $("#update").click( function() {
	        	
	            console.log('업데이트 시작');
	            
	            var id = $("#update-todo-id").val();
	            var title = $("#update-title").val();
	            var count = $("#update-count").val();
	            var set = $("#update-set").val();
	            var coment = $("#update-coment").val();
	            var exNo = $("#exNo").val();
	            
	            var JSONObject = {'exTitle': title, 'exCount': count, 'exSet' : set, 'exComent' : coment, 'exNo' : exNo};
	            
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
			            $('#updateModal').modal('toggle');
			            
	                    alert("수정 완료");
	                    load();
	                },
	                error: function () {
	                    console.log("운동수정용 ajax 통신 실패");
	                }
	            });
	            
	        });
	        </script>		

		
		
		
          
		</div>
    </div>
    </div>
</div>


</body>
</html>