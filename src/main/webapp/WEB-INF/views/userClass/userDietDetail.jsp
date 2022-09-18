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
    width: 97%; float: left; vertical-align: middle; padding-left: 10px;
  }

  .reply-content>#writer{
    font-size: 13px; font-weight: 700;
  }

  .reply-content>#date{
    color:lightgrey; font-size:11px; line-height: 20px; margin-left:10px
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
  	background-color:lavender;
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
        </div>

		<script>
			$(function(){
				let dateArr = "${d.dietDate}".split("/");
				let date = "20" + dateArr[0] + "년 " + dateArr[1] + "월 " + dateArr[2] + "일";
				
				$(".di-date label").text(date);
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
			    	<c:when test="${d.dietEnroll eq 'N'}">
				    	<form action="insertDi.cl" method="post" enctype="multipart/form-data">
			    	</c:when>
			    	<c:otherwise>
			    		<form action="updateDi.cl" method="post" enctype="multipart/form-data">
			    		<!-- update의 경우 -->
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
				        	<c:when test="${d.dietEnroll eq 'N'}">
					            <input class="form-control" type="file" id="formFile" name="upfile"><br>
				        	</c:when>
				        	<c:otherwise>
				        		<input class="form-control" type="file" id="formFile" name="reupfile"><br>
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
        	<c:when test="${d.lcImage eq null}"> <!-- 점심에는 아무글도 없음 -->
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
			    	<c:when test="${d.dietEnroll eq 'N'}"> <!-- 아점저 아무것도 등록 안되어있음 => insert일 경우임 -->
				    	<form action="insertDi.cl" method="post" enctype="multipart/form-data">
			    	</c:when>
			    	<c:otherwise> <!-- 무언가 등록되어 있음 => update해야함 -->
			    		<form action="updateDi.cl" method="post" enctype="multipart/form-data"> <!-- update요청 -->
			    		<!-- update의 경우 -->
			    	</c:otherwise>
			    	</c:choose>
			    		<input type="hidden" name="time" value="lc"> <!-- insert요청하며 어떤 타임의 첨부파일인지를 같이 보냄 -->
			    		<input type="hidden" name="classNo" value="${d.classNo }">
			    		<input type="hidden" name="dietDate" value="${d.dietDate }">
			    	
				        <div class="modal-body">
				        <div class="row">
				        <div class="col mb-3">
				        	<label for="formFile" class="form-label">오늘 식단 사진을 등록해보세요 !</label>
				        	<c:choose>
				        	<c:when test="${d.dietEnroll eq 'N'}">
					            <input class="form-control" type="file" id="formFile" name="upfile"><br>
				        	</c:when>
				        	<c:otherwise>
				        		<input class="form-control" type="file" id="formFile" name="reupfile"><br>
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
			    	<c:when test="${d.dietEnroll eq 'N'}">
				    	<form action="insertDi.cl" method="post" enctype="multipart/form-data">
			    	</c:when>
			    	<c:otherwise>
			    		<form action="updateDi.cl" method="post" enctype="multipart/form-data">
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
				        	<c:when test="${d.dietEnroll eq 'N'}">
					            <input class="form-control" type="file" id="formFile" name="upfile"><br>
				        	</c:when>
				        	<c:otherwise>
				        		<input class="form-control" type="file" id="formFile" name="reupfile"><br>
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
			    	<c:when test="${d.dietEnroll eq 'N'}">
				    	<form action="insertDi.cl" method="post" enctype="multipart/form-data">
			    	</c:when>
			    	<c:otherwise>
			    		<form action="updateDi.cl" method="post" enctype="multipart/form-data">
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
				        	<c:when test="${d.dietEnroll eq 'N'}">
					            <input class="form-control" type="file" id="formFile" name="upfile"><br>
				        	</c:when>
				        	<c:otherwise>
				        		<input class="form-control" type="file" id="formFile" name="reupfile"><br>
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



        </div>

      <br>



      <!-- 댓글 -->
      <div class="reply-wrap" style="height: 30%;">
        <label>댓글 <span id="rcount"></span></label><br>


		
		<div class="r">
	    <!--    <div class="reply">
	          <div class="reply-content">
	            <label id="writer">김연아 트레이너</label> &nbsp; <label id="date">2022.08.12</label><br>
	            <label id="content">내ㅛ오오오오오오오</label>
	          </div>
	          	<div class="reply-like">🤍</div>
	        </div>-->
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
					console.log(list);
					
					let value = "";
					let type = "";
					for(let i=0; i<list.length; i++){
						value += "<div class='reply'><div class='reply-content'>"
							   + "<label id='writer'>" + list[i].writerName + "&nbsp";
							   
						type = (list[i].writerType == "U") ? "회원" : "트레이너";
								
						value += type + "</label>&nbsp"
							   + "<label id='date'>" + list[i].replyDate + "</label><br>"
							   + "<label id='content'>" + list[i].replyContent + "</label></div>"
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
		
		//댓글 등록
		function addReply(){
			if( $(".content").val().trim().length != 0 ){
				
				$.ajax({
					url:"rinsert.di",
					data:{replyContent:$(".content").val(),
						  dietNo:${d.dietNo},
						  replyWriter:${loginU.userNo},
						  writerName:'${loginU.userName}',
						  writerType:'U' //직접적으로 문자열을 전달해도 되나염?
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
    </div>
    </div>
</div>


</body>
</html>