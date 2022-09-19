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
	
</style>
</head>
<body>


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
	    <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-justified-home" aria-controls="navs-pills-justified-home" aria-selected="true" style="text-weight:700">
	      🔥 오늘의 운동
	    <span class="badge rounded-pill badge-center h-px-20 w-px-20 bg-danger">3</span>
	    </button>
		</li>
		
	    <li class="nav-item">
	    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-justified-profile" aria-controls="navs-pills-justified-profile" aria-selected="false">
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
		<div class="tab-content" style="height: 695px;">
	
	
	
		
	              
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