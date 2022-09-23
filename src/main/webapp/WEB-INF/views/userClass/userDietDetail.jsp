<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  	background-color:lavender;
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

<jsp:include page="userHeader.jsp" />


<div class="row">
    <div class="col-md-12">
    <div class="card mb-4">
		<h5 class="card-header" style="padding:1rem">오늘의 식단</h5>
		<div class="card-body row" align="center">
		
		
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
		
        <div class="row row-cols-1 row-cols-md-3 g-4 mb-5" style="height: 60%; margin-top:10px">
        
        
		<!-- 아침 -->
		<div class="col" style="width: 25%;">
        <div class="card h-100">
        	
		<c:choose>
        	<c:when test="${d.bfImage eq null}">
				<button type="button" style="border:none; height:300px" 
				class="modal-button" data-bs-toggle="modal" data-bs-target="#bf">
			    	BREAKFIRST
				</button>
			
				<div class="modal fade" id="bf" tabindex="-1" style="display: none;" aria-hidden="true">
			    <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			    	<div class="modal-header" style="margin:auto">
			    		<h4 class="modal-title" id="modalCenterTitle">아침 식단</h4>
			    	</div>
			    	
			    	<c:choose>
			    	<c:when test="${d.dietEnroll eq 'Y'}">
			    		<form action="updateDi.cl" method="post" enctype="multipart/form-data">
			    	</c:when>
			    	<c:otherwise>
				    	<form action="insertDi.cl" method="post" enctype="multipart/form-data">
			    	</c:otherwise>
			    	</c:choose>
			    		<input type="hidden" name="time" value="bf">
			    		<input type="hidden" name="classNo" value="${d.classNo }">
			    		<input type="hidden" name="dietDate" value="${d.dietDate }">
			    	
				        <div class="modal-body">
				        <div class="row">
				        <div class="col mb-3">
				        	<label for="formFile" class="form-label">오늘 식단 사진을 등록해보세요 !</label>
				            <c:choose>
				        	<c:when test="${d.dietEnroll eq 'Y'}">
				        		<input class="form-control" type="file" id="formFile" name="reupfile"><br>
				        	</c:when>
				        	<c:otherwise>
					            <input class="form-control" type="file" id="formFile" name="upfile"><br>
				        	</c:otherwise>
				        	</c:choose>
				        	      
						    <label for="exampleFormControlTextarea1" class="form-label">오늘 식단을 기록해보세요 !</label>
						    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="bfContent"></textarea>
				        </div>
				        </div>
				        </div>
				        
				        <div class="modal-footer">
				              <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
				              <button type="submit" class="btn btn-primary">등록</button>
				        </div>
			        </form>
				</div>
			    </div>
				</div>
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
			
			    <!-- Modal -->
				<div class="modal fade" id="lc" tabindex="-1" style="display: none;" aria-hidden="true">
			    <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			    	<div class="modal-header" style="margin:auto">
			    		<h4 class="modal-title" id="modalCenterTitle">점심 식단</h4>
			    	</div>
			    	
			    	<c:choose>
			    	<c:when test="${d.dietEnroll eq 'Y'}">
			    		<form action="updateDi.cl" method="post" enctype="multipart/form-data">
			    	</c:when>
			    	<c:otherwise>
				    	<form action="insertDi.cl" method="post" enctype="multipart/form-data">
			    	</c:otherwise>
			    	</c:choose>
			    		<input type="hidden" name="time" value="lc">
			    		<input type="hidden" name="classNo" value="${d.classNo }">
			    		<input type="hidden" name="dietDate" value="${d.dietDate }">
			    	
				        <div class="modal-body">
				        <div class="row">
				        <div class="col mb-3">
				        	<label for="formFile" class="form-label">오늘 식단 사진을 등록해보세요 !</label>
				        	<c:choose>
				        	<c:when test="${d.dietEnroll eq 'Y'}">
				        		<input class="form-control" type="file" id="formFile" name="reupfile"><br>
				        	</c:when>
				        	<c:otherwise>
					            <input class="form-control" type="file" id="formFile" name="upfile"><br>
				        	</c:otherwise>
				        	</c:choose>
				                  
						    <label for="exampleFormControlTextarea1" class="form-label">오늘 식단을 기록해보세요 !</label>
						    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="lcContent"></textarea>
				        </div>
				        </div>
				        </div>
				        
				        <div class="modal-footer">
				              <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
				              <button type="submit" class="btn btn-primary">등록</button>
				        </div>
			        </form>
				</div>
			    </div>
				</div>
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
			
			    <!-- Modal -->
				<div class="modal fade" id="dn" tabindex="-1" style="display: none;" aria-hidden="true">
			    <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			    	<div class="modal-header" style="margin:auto">
			    		<h4 class="modal-title" id="modalCenterTitle">저녁 식단</h4>
			    	</div>
			    	
			    	<c:choose>
			    	<c:when test="${d.dietEnroll eq 'Y'}">
			    		<form action="updateDi.cl" method="post" enctype="multipart/form-data">
			    	</c:when>
			    	<c:otherwise>
				    	<form action="insertDi.cl" method="post" enctype="multipart/form-data">
			    	</c:otherwise>
			    	</c:choose>
			    		<input type="hidden" name="time" value="dn">
			    		<input type="hidden" name="classNo" value="${d.classNo }">
			    		<input type="hidden" name="dietDate" value="${d.dietDate }">
			    	
				        <div class="modal-body">
				        <div class="row">
				        <div class="col mb-3">
				        	<label for="formFile" class="form-label">오늘 식단 사진을 등록해보세요 !</label>
				        	<c:choose>
				        	<c:when test="${d.dietEnroll eq 'Y'}">
				        		<input class="form-control" type="file" id="formFile" name="reupfile"><br>
				        	</c:when>
				        	<c:otherwise>
					            <input class="form-control" type="file" id="formFile" name="upfile"><br>
				        	</c:otherwise>
				        	</c:choose>
				                  
						    <label for="exampleFormControlTextarea1" class="form-label">오늘 식단을 기록해보세요 !</label>
						    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="dnContent"></textarea>
				        </div>
				        </div>
				        </div>
				        
				        <div class="modal-footer">
				              <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
				              <button type="submit" class="btn btn-primary">등록</button>
				        </div>
			        </form>
				</div>
			    </div>
				</div>
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
			
			    <!-- Modal -->
				<div class="modal fade" id="re" tabindex="-1" style="display: none;" aria-hidden="true">
			    <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			    	<div class="modal-header" style="margin:auto">
			    		<h4 class="modal-title" id="modalCenterTitle">간식</h4>
			    	</div>
			    	
			    	<c:choose>
			    	<c:when test="${d.dietEnroll eq 'Y'}">
			    		<form action="updateDi.cl" method="post" enctype="multipart/form-data">
			    	</c:when>
			    	<c:otherwise>
				    	<form action="insertDi.cl" method="post" enctype="multipart/form-data">
			    	</c:otherwise>
			    	</c:choose>
			    		<input type="hidden" name="time" value="re">
			    		<input type="hidden" name="classNo" value="${d.classNo }">
			    		<input type="hidden" name="dietDate" value="${d.dietDate }">
			    	
				        <div class="modal-body">
				        <div class="row">
				        <div class="col mb-3">
				        	<label for="formFile" class="form-label">오늘 식단 사진을 등록해보세요 !</label>
				        	<c:choose>
				        	<c:when test="${d.dietEnroll eq 'Y'}">
				        		<input class="form-control" type="file" id="formFile" name="reupfile"><br>
				        	</c:when>
				        	<c:otherwise>
					            <input class="form-control" type="file" id="formFile" name="upfile"><br>
				        	</c:otherwise>
				        	</c:choose>
				                  
						    <label for="exampleFormControlTextarea1" class="form-label">오늘 식단을 기록해보세요 !</label>
						    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="reContent"></textarea>
				        </div>
				        </div>
				        </div>
				        
				        <div class="modal-footer">
				              <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
				              <button type="submit" class="btn btn-primary">등록</button>
				        </div>
			        </form>
				</div>
			    </div>
				</div>
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
			<div style='background:lavender; width:100%; padding:10px; font-weight:600'>아직 식단이 등록되지 않았네요! 오늘의 식단을 기록해보세요 😊😊</div>
		</c:if>

        </div>

      <br>



      <!-- 댓글 -->
      <div class="reply-wrap" style="height: 30%;">
        <label>댓글 <span id="rcount"></span></label><br>

		<div class="r">
        </div>
        
        
        
        <!-- 댓글입력 -->
        <form id="postForm" action="" method="post" >
          <input type="hidden" name="no" value="">
        </form>
        
        
        <div class="reply-input">
            <textarea class="form-control content" id="exampleFormControlTextarea1" rows="2" placeholder="댓글을 입력해주세요."></textarea>
            <button onclick="addReply();">등록</button>
        </div>
        <!-- /댓글입력 -->
      </div>
      
      
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
					
					let value = "";
					let type = "";
					let replyNo = "";
					for(let i=0; i<list.length; i++){
						
						replyNo = list[i].replyNo;
						replyContent = list[i].replyContent;
						writerName = list[i].writerName;
						
						console.log("${loginU.userNo}");
						
						if(list[i].replyWriter == '${loginU.userNo}'){
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
						
							   
						if(list[i].replyWriter == '${loginU.userNo}'){
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
					$("#rcount").text(list.length);
				},
				error:function(){
					console.log("댓글 리스트 조회용 ajax통신 실패");
				}
			})
		}
		
		//댓글 등록
		function addReply(){
			if( $(".content").val().trim().length != 0 ){
				
				$.ajax({
					url:"rinsert.di",
					data:{replyContent:$(".content").val(),
						  dietNo:${d.dietNo},
						  replyWriter:${loginU.userNo},
						  writerName:'${loginU.userName}',
						  writerType:'U'
						 },
					success:function(result){
						
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
		
		
		
		//댓글 수정에 필요한 값 
		$(document).on("click", ".u", function(){
			let replyNo = $(this).parent().parent().parent().children().eq(0).text();
			let replyContent = $(this).parent().parent().parent().prev().children().eq(3).children().text();
			replyUpdateForm(replyNo, replyContent);
		})
		
		
		
		//댓글 수정 폼
		function replyUpdateForm(replyNo, replyContent){
			
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
		
		
		
		//댓글 삭제
		$(document).on("click", ".d", function(){
			
			$.ajax({
				url:"rdelete.di";
				data:{replyNo:$(".replyNo").text()},
				success:function(result){
					
					console.lig(result);
					
					alertify.alert("댓글이 삭제되었습니댜.");
					
				},
				error:function(){
					console.log("댓글 삭제용 ajax 통신 실패");
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