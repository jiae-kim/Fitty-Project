<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fitty 직원 근태 상세</title>
<link type="text/css" rel="stylesheet" href="resources/css/attendance.css" />
<script type="text/javascript" src="resources/js/attendance.js"></script>
</head>
<body>
<jsp:include page="../common/header.jsp"/>

<div class="row">
  <!-- 연월차관리 -->
  <div class="col-lg ">
    <div class="card mb-4 vacDetailDiv">
      <h5 class="card-header"><b>🏋️‍♂️ 정저탄</b> 트레이너 　　　　　　　　　　　　　　　　　　　<b style="color:#8592a3">🎁 연월차관리</b></h5>
      <div class="card-body row">
          <div class="vacSimpleInfo">
            <div class="col-4 vacDiv">
                <div class="vacSm">발생연월차</div>
                <div class="vacLg">15</div>
            </div>
            <div class="col-4 vacDiv">
                <div class="vacSm">소진연월차</div>
                <div class="vacLg">3</div>
            </div>
            <div class="col-4 vacDiv">
                <div class="vacSm">잔여연월차</div>
                <div class="vacLg">12</div>
            </div>
          </div>
      </div>
      <h5 class="card-header"><b>📜 연차사용내역</b><br>
      <div class="card-body">
        <table class="table vacTable">
          <thead>
              <tr>
                  <td><b>연월차사용일</b></td>
                  <td><b>사유</b></td>
                  <td><b>차감연차</b></td>
              </tr>
          </thead>
          <tbody>
              <tr>
                  <td>2022/08/05</td>
                  <td>개인사유</td>
                  <td>1</td>
              </tr>
              <tr>
                  <td>2022/08/05</td>
                  <td>개인사유</td>
                  <td>1</td>
              </tr>
              <tr>
                  <td>2022/08/05</td>
                  <td>개인사유</td>
                  <td>1</td>
              </tr>
              <tr>
                  <td>2022/08/05</td>
                  <td>개인사유</td>
                  <td>1</td>
              </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>

  <!-- 휴가관리 -->
  <div class="col-lg ">
    <div class="card mb-4 vacDetailDiv">
      <h5 class="card-header"> 　　　　　　　　　　　　　　　　　　　　　　　　　　　　　<b style="color:#8592a3">🎉 휴가 관리</b></h5>
      <div class="card-body row">
          <div class="vacSimpleInfo">
            <div class="col-4 vacDiv">
                <div class="vacSm">발생휴가</div>
                <div class="vacLg">3</div>
            </div>
            <div class="col-4 vacDiv">
                <div class="vacSm">소진휴가</div>
                <div class="vacLg">1</div>
            </div>
            <div class="col-4 vacDiv">
                <div class="vacSm">잔여휴가</div>
                <div class="vacLg">2</div>
            </div>
          </div>
      </div>
      <h5 class="card-header"><b>📜 휴가사용내역</b><br>
      <div class="card-body">
        <table class="table vacTable">
          <thead>
              <tr>
                  <td><b>휴가사용일</b></td>
                  <td><b>사유</b></td>
                  <td><b>차감휴가</b></td>
              </tr>
          </thead>
          <tbody>
              <tr>
                  <td>2022/08/05</td>
                  <td>정기휴가</td>
                  <td>1</td>
              </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>


</div>

</body>
</html>