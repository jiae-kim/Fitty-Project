<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fitty 채팅</title>
<link type="text/css" rel="stylesheet" href="resources/css/chat.css" />
<script type="text/javascript" src="resources/js/chat.js"></script>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="row">
   <!-- 채팅메뉴 -->
 <div class="col-md-3">
   <div class="card mb-4 chatMenu" style="background-color: #E7E7FF;">
     <div class="btnFlex">
       <button class="col-md-6" id="empListBtn" aria-selected="true">🙋‍♀️ MEMBER</button>
       <button class="col-md-6">💌 CHAT</button>
     </div>
     <form class="chatMenuForm" style="overflow:auto;">
       <div class="profileHeader">
      		
            <h5 class="card-header" style="color:#697a8d; padding-bottom:0px;">
	            <img src="<c:out value='${loginUser.empPhoto}' default='resources/profile_images/defaultProfile.png' />" alt="Avatar" class="rounded-circle" width="30px;" height="30px;"/>
	            <b>${ loginUser.empName } 🏃‍♂️ ${ loginUser.grName }</b>
            </h5>
            <input type="hidden" value="${loginUser.empNo}" id="empNoInput">
            <input type="hidden" value="${loginUser.empName}" id="empNameInput">
            <input type="hidden" value="<c:out value='${loginUser.empPhoto}' default='resources/profile_images/defaultProfile.png' />" id="empPhotoInput">
      	</div>

       <!-- Search -->
       <table class="navbar-nav align-items-center" style="margin-top: 20px; margin-bottom:20px;">
         <tr>
         	 <!-- 검색값은 처음에 ㄱ한자 공백임!!! -->
         	 <td><input type="text" class="form-control" placeholder="직원명 입력" name="searchText" id="searchText"  maxlength="30" style="height: 35px;" value=""></td>
             <td><button type="button" id="searchBtn" class="btn btn-sm rounded-pill btn-outline-primary">
             <i class='bx bx-search' style="color:#696CFF;"></i></button></td>
         </tr>
       </table>
       <!-- /Search -->

       <div >
         <ul class="empList">
         </ul>
       </div>
       
     </form>
   </div>
 </div>


 <!-- 채팅창 -->
 <div class="col-md-9 ">
   <div class="card mb-4 vacDetailDiv">
  <!-- a href="testChat">가라ㅜㅡ</a>-->
  	<!-- 
    <h5 class="card-header" style="margin-bottom : 20px; margin-top:20px;">
    <img src="${loginUser.empPhoto}" alt="Avatar" class="rounded-circle" width="30px;" height="30px;"/>
    <b>상대방 트레이너님</b>
    </h5>
	<input type="hidden" id="id" value="상대방트레이너">
	<div>
		<div id="chatarea" class="card-header" style="width: 80%; height: 600px;">
			
			<div id="chatTextArea">
				<table class="yourTable">
					<tr>
						<td rowspan="2"><img src="${loginUser.empPhoto}" alt="Avatar" class="rounded-circle col-md-1" width="30px;" height="30px;"/></td>
						<td rowspan="2" class="textTd"><div class="noStyle" id="yourText"></div></td>
						<td width="150px;">트레이너이름</td>
					</tr>
					<tr>
						<td>2022-30-44</td>
					</tr>
				</table>
				<table class="myTable">
					<tr>
						<td width="150px;">트레이너이름</td>
						<td rowspan="2" class="textTd"><div class="noStyle" id="yourText"></div></td>
						<td rowspan="2"><img src="${loginUser.empPhoto}" alt="Avatar" class="rounded-circle col-md-1" width="30px;" height="30px;"/></td>
					</tr>
					<tr>
						<td>2022-30-44</td>
					</tr>
				</table>
			</div>
			<form>
				<textarea id="message" /></textarea>
				<input type="button" class="btn btn-primary" style="margin-top:-42px; height : 50px;" id="send" value="보내기" />
			<!--  	<input type="button" id="exit" value="나가기" />-->
		<!-- 	</form>
		</div>
	</div>
     -->
  </div>
</div>


<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<script type="text/javascript" src="resources/js/chat.js"></script>
<script type="text/javascript" src="resources/js/chat/chatEmpList.js"></script>
</body>
</html>