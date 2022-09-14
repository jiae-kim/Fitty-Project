<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.sideMenu{
    width:15%;
    height:750px;
    float:left;
    background-color:white;
    margin-top:30px;
    border-radius:6px;
    box-shadow: 0 0 0.375rem 0.25rem rgb(161 172 184 / 15%);
  }
  #s-btn1{
    width:130px;
    height:40px;
    border:1px solid rgb(105, 108, 255);
    color:rgb(105, 108, 255);
    background-color: white;
    border-radius: 5px;
    margin-top:30px;
    margin-left:20%;
  }
  .list{
    margin-top:50px;
    margin-left:20px;
    color:rgb(51, 51, 51);
  }
  .list li{
    list-style-type: none;
    margin-top:5px;
    font-size:14px;
  }
  .list a{color:rgb(51, 51, 51);}
  .selType{
    border:1px solid lightgray;
    border-radius: 5px;
    padding:15px;
    float:left;
    font-size:13px;
    color:rgb(50, 50, 50);
    width:150px;
  }
  .selType>button{border:none; background-color:white;}
  .selthumbnail{
    border:1px solid lightgray;
    border-radius: 5px;
    float:right;
    color:rgb(50, 50, 50);
    width:340px;
    height:400px;
    text-align:center;
  }
</style>
</head>
<body>
	<div class="sideMenu">
		
        <button id="s-btn1" data-bs-toggle="modal" data-bs-target="#newAppModal">새 결재 진행</button>

         <div class="list">
           <span><b>결재하기</b></span>
           <ul>
             <li><a href="결재대기문서.html">결재 대기 문서</a></li>
             <li><a href="결재예정문서.html">결재 예정 문서</a></li>
           </ul>
           <span><b>개인 문서함</b></span>
           <ul>
             <li><a type="button" onclick="postFormSubmit('draftList.ap');">기안 문서함</a></li>
             <li><a href="임시저장함.html">임시 저장함</a></li>
             <li><a href="결재문서함.html">결재 문서함</a></li>
           </ul>
         </div>
       </div>
       <form id="postForm" action="" method="post">
			<input type="hidden" name="empNo" value="${ loginUser.empNo }">
		</form>
       <script>
       	function postFormSubmit(url){
       		$("#postForm").attr("action", url).submit();
       	}
       </script>
       
     <div
       class="modal fade"
       id="newAppModal"
       aria-labelledby="modalToggleLabel"
       tabindex="-1"
       style="display: none"
       aria-hidden="true"
     >
       <div class="modal-dialog modal-dialog-scrollable">
         <div class="modal-content">
           <div class="modal-header">
             <h5 class="modal-title" id="modalToggleLabel" style="color:rgb(51, 51, 51);">결재양식 선택</h5>
             <button
               type="button"
               class="btn-close"
               data-bs-dismiss="modal"
               aria-label="Close"
             ></button>
           </div>
           <div class="modal-body">
             <div class="selType">
               <button class="seltn" id="seltn1">- 휴가신청 </button><br><br>
               <button class="seltn" id="seltn2">- 연장근무신청 </button><br><br>
               <button class="seltn" id="seltn3">- 지출결의서 </button>
             </div>
             <div class="selthumbnail">
               <img width="330" height="390" src="resources/approval_images/vct.png" style="display:none;" id="img1">
               <img width="330" height="390" src="resources/approval_images/ovt.png" style="display:none;">
               <img width="330" height="390" src="resources/approval_images/exp.png" style="display:none;">
             </div>
           </div>
           <div class="modal-footer">
       		 <button class="btn btn-primary" id="sub">확인</button>
             <button class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
           </div>
         </div>
       </div>
     </div>
     <script>
     	$(function(){
     		$("#seltn1").click(function(){
     			$("#sub").removeAttr("onclick");
	    		$("#sub").attr("onclick", "location.href='vacation.ap'");
	    		$("#img1").show();
	    	 })
     	})
     </script>
       

</body>
</html>