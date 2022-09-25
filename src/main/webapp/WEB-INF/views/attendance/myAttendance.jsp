<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fitty 개인근태확인</title>

<!-- 해당페이지 css 외부로딩 : 새로고침시 컨트롤 + f5로 강력새로고침 하세요 -->
<link type="text/css" rel="stylesheet" href="resources/css/attendance.css" />



<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">


</head>
<body>
<jsp:include page="../common/header.jsp"/>



<div class="row">
    <!-- 연월차관리 -->
    <div class="col-md-2 ">
      <div class="card mb-4 vacDetailDiv">
          <h5 class="card-header" style="margin-bottom:20px;"><b>📑 오늘의 근태확인</b></h5>
          <div class="card-body row">
            <div class="vacSimple">
              <div id="loginUserDiv">
                <img src="<c:out value='${loginUser.empPhoto}' default='resources/profile_images/defaultProfile.png' />" alt="Avatar" class="rounded-circle" width="150px;" height="150px;"/>
                <br><span class="myName"><b>${loginUser.empName}</b></span>
                <br><span class="myName">${loginUser.grName }</span>
                <input type="hidden" value="${loginUser.empNo }" id="loginUserEmp">
				<input type="hidden" value="${ loginUser.attIn }" id="loginUserAttin">
				<input type="hidden" value="${ loginUser.attOut }" id="loginUserAttOut">
              </div>
            </div>
            
            <table id="todayWork" style="font-size:15px; margin-top:50px;">
              <tr>
                  <td id="intervalTime" colspan="3"><span id="hour"></span>:<span id="minute"></span>:<span id="second"></span></td>
              </tr>
              <tr>
                  <th>출근</th>
                  <td class="goRight">${ myAtt.attIn }</td>
              </tr>
              <tr>
                  <th>퇴근</th>
                  <td class="goRight">${ myAtt.attOut }</td>
              </tr>
            </table>
            <a class="btn btn-primary modifyBtn myAttBtn" style="margin-top : 20px;" href="modifyList.mo?empNo=${loginUser.empNo }">근태수정요청</a>
            <a class="btn btn-info modifyBtn myAttBtn" onclick="go('select.emp')" style="color:white; margin-bottom:20px;">내 정보 수정</a>

            <div class="vacation"  >
              <button class="yearVac" type="button" style="height:180px;">
              	<a href="detail.vac?no=${loginUser.empNo } ">
                <span style="font-size:25px;">🎁<br></span>
                <span>올해의 연차<br></span>
                <span class="gapSpan">${ myAtt.gapYearVac }<br></span>
                <span>일 있어요!<br></span>
                </a>
              </button>
              <div class="emptyVac" style="width:12px; background-color: white;">
              </div>
              <button class="realVac" type="button" style="height:180px;">
              	<a href="detail.vac?no=${loginUser.empNo } ">
                <span style="font-size:25px;">🎉<br></span>
                <span>올해의 휴가<br></span>
                <span class="gapSpan">${ myAtt.gapVac }<br></span>
                <span>일 있어요!<br></span>
                </a>
              </button>
            </div>
          </div>
      </div>
    </div>
    <!-- 휴가관리 -->
    <div class="col-md-10 ">
      <div class="card mb-4 vacDetailDiv">
          <h5 class="card-header"><b>⏱ 이번달 근태확인</b></h5>
          <div class="card-body row" id='calendar-container'>
            <div id='calendar'>
        
				
				</div>
          </div>
      </div>
    </div>
</div>
<script type="text/javascript" src="resources/js/attendance.js"></script>
<script type="text/javascript" src="resources/js/attendance/myAttendance.js"></script>
<!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->  
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">  
<!-- jquery CDN -->  
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>   -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<!-- fullcalendar CDN -->  
<!-- <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />  
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>   -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<!-- fullcalendar 언어 CDN -->  
<!-- <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script> -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.min.js'></script>

<style type="text/css">

</body>
</html>