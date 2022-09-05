<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fitty 개인근태확인</title>

<!-- 해당페이지 css 외부로딩 : 새로고침시 컨트롤 + f5로 강력새로고침 하세요 -->
<link type="text/css" rel="stylesheet" href="resources/css/attendance.css" />
<script type="text/javascript" src="resources/js/attendance.js"></script>
</head>
<body>
<jsp:include page="../common/header.jsp"/>



<div class="row">
    <!-- 연월차관리 -->
    <div class="col-md-2 ">
      <div class="card mb-4 vacDetailDiv">
          <h5 class="card-header"><b>📑 오늘의 근태확인</b></h5>
          <div class="card-body row">
            <div class="vacSimple">
              <div>
                <i class='bx bxs-user-circle'></i><br>
                <span class="profileName"><b>홍길동</b><br></span>
                <span class="profileName">트레이너</span>
                <div style="height: 5px;"></div>
              </div>
            </div>
            <table id="todayWork">
              <tr>
                  <th>2022/08/05</th>
                  <td>금일 누적 근무</td>
              </tr>
              <tr>
                  <td colspan="2" id="workTime">06:30:58</td>
              </tr>
              <tr>
                  <th>출근</th>
                  <td>08 : 45 : 21</td>
              </tr>
              <tr>
                  <th>퇴근</th>
                  <td>근무중</td>
            </table>

            <form class="workChange" action="" method="post">
              <select class="form-select placement-dropdown" id="selectPlacement">
                <option>근무중</option>
                <option>수업중</option>
                <option>대기중</option>
                <option>휴식중</option>
              </select>
            </form>
        
            <button class="btn btn-primary modifyBtn" onclick="go('attModiftForm.att')">근태수정요청</button>
            <button class="btn btn-secondary exelDownBtn">엑셀다운로드</button>

            <div class="vacation">
              <div class="yearVac">
                <span>🎁<br></span>
                <span>올해의 연차<br></span>
                <span>11<br></span>
                <span>일 남았어요!<br></span>
              </div>
              <div class="emptyVac" style="width:12px; background-color: white;">
              </div>
              <div class="realVac">
                <span>🎉<br></span>
                <span>올해의 휴가<br></span>
                <span>3<br></span>
                <span>일 남았어요!<br></span>
              </div>
            </div>
          </div>
      </div>
    </div>
  
    <!-- 휴가관리 -->
    <div class="col-md-10 ">
      <div class="card mb-4 vacDetailDiv">
          <h5 class="card-header"><b>⏱ 오늘의 근태확인</b></h5>
          <div class="card-body row">
            <div class="vacSimple">
              <div>
                <i class='bx bxs-user-circle'></i><br>
                <span class="profileName"><b>홍길동</b><br></span>
                <span class="profileName">트레이너</span>
                <div style="height: 5px;"></div>
              </div>
            </div>
            <table id="todayWork">
              <tr>
                  <th>2022/08/05</th>
                  <td>금일 누적 근무</td>
              </tr>
              <tr>
                  <td colspan="2" id="workTime">06:30:58</td>
              </tr>
              <tr>
                  <th>출근</th>
                  <td>08 : 45 : 21</td>
              </tr>
              <tr>
                  <th>퇴근</th>
                  <td>근무중</td>
            </table>

            <form class="workChange" action="" method="post">
              <select class="form-select placement-dropdown" id="selectPlacement">
                <option>근무중</option>
                <option>수업중</option>
                <option>대기중</option>
                <option>휴식중</option>
              </select>
            </form>
        
            <button class="btn btn-primary modifyBtn">근태수정요청</button>
            <button class="btn btn-secondary exelDownBtn">엑셀다운로드</button>

            <div class="vacation">
              <div class="yearVac">
                <span>🎁<br></span>
                <span>올해의 연차<br></span>
                <span>11<br></span>
                <span>일 남았어요!<br></span>
              </div>
              <div class="emptyVac" style="width:12px; background-color: white;">
              </div>
              <div class="realVac">
                <span>🎉<br></span>
                <span>올해의 휴가<br></span>
                <span>3<br></span>
                <span>일 남았어요!<br></span>
              </div>
            </div>
          </div>
      </div>
    </div>
</div>


</body>
</html>