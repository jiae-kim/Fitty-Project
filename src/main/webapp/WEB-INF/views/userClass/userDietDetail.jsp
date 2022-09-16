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

</style>
</head>
<body>

<jsp:include page="userHeader.jsp" />


<div class="row">
    <div class="col-md-12">
    <div class="card mb-4" style="height:800px">
		<h5 class="card-header" style="padding:1rem">오늘의 식단</h5>
		<div class="card-body row" align="center">
		
		
      	<div class="di-date" align="center">
        <a href="" style="color:#696CFF; font-size:20px">◀️</a> &nbsp;&nbsp;
        <label style="font-weight: 700; font-size:25px;">${dietDate }</label>  &nbsp;&nbsp;
        <a href="" style="color:#696CFF; font-size:20px">▶️</a>
        </div>

        <div class="row row-cols-1 row-cols-md-3 g-4 mb-5" style="height: 60%; margin-top:10px">

          <div class="col" style="width: 25%;">
            <div class="card h-100">
              <img class="card-img-top di_bf_img" src="3.png" style="object-fit: cover;"/>
              <div class="card-bodyy di_bf_content">
                <h5 class="card-title">아침</h5>
                <p class="card-text">
                  토마토
                  우유
                </p>
              </div>
            </div>
          </div>

          <div class="col" style="width: 25%;">
            <div class="card h-100">
              <img class="card-img-top di_bf_img" src="3.png" style="object-fit: cover;"/>
              <div class="card-bodyy di_bf_content">
                <h5 class="card-title">점심</h5>
                <p class="card-text">
                  토마토
                  우유
                </p>
              </div>
            </div>
          </div>

          <div class="col" style="width: 25%;">
            <div class="card h-100">
              <img class="card-img-top di_bf_img" src="3.png" style="object-fit: cover;"/>
              <div class="card-bodyy di_bf_content">
                <h5 class="card-title">저녁</h5>
                <p class="card-text">
                  토마토
                  우유
                </p>
              </div>
            </div>
          </div>

          <div class="col" style="width: 25%;">
            <div class="card h-100">
              <img class="card-img-top di_bf_img" src="3.png" style="object-fit: cover;"/>
              <div class="card-bodyy di_bf_content">
                <h5 class="card-title">간식</h5>
                <p class="card-text">
                  토마토
                  우유
                </p>
              </div>
            </div>
          </div>

        </div>



      <br>



      <!-- 댓글 -->
      <div class="reply-wrap" style="height: 30%;">
        <label>댓글 (3)</label><br>

        <div class="reply">
          <div class="reply-content">
            <label id="writer">김연아 트레이너</label> &nbsp; <label id="date">2022.08.12</label><br>
            <label id="content">내ㅛ오오오오오오오</label>
          </div>
          	<div class="reply-like">🤍</div>
        </div>
        


        
        <!-- 댓글입력 -->
        <form id="postForm" action="" method="post" >
          <input type="hidden" name="no" value="">
          
        </form>
        
        <div class="reply-input">
            <textarea class="form-control" id="exampleFormControlTextarea1" rows="2" placeholder="댓글을 입력해주세요."></textarea>
            <button>등록</button>
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
				url:"",
				data:{},
				success:function(){
					
				},
				error:function(){
					
				}
			})
		}
		
		//댓글 등록
	</script>
		
		
		
          
		</div>
    </div>
    </div>
</div>


</body>
</html>