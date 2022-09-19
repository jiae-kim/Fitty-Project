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
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="row">
    <!-- 연월차관리 -->
    <div class="col-md-6">
      <div class="card mb-4 vacDetailDiv justPadding">
    <a class="btn btn-outline-primary" onclick="go('vacControl.att')" style="margin-bottom:30px;"  href="javascript:window.history.back();">목록으로</a>
      	<div class="profileHeader">
      		<img src="<c:out value='${v.empPhoto}' default='resources/profile_images/defaultProfile.png' />" alt="Avatar" class="rounded-circle" width="30px;" height="30px;"/>
            <h5 class="card-header" style="color:#697a8d;"><b>${ v.empName } 🏃‍♂️ ${ v.grName } 🏃‍♂️ 연차관리</b></h5>
            <input type="hidden" value="${v.empNo}" id="empNoInput">
      	</div>
            <table id="todayWork" class="table" style="margin-bottom : 50px;">
              <thead>
              	<tr>
              		<td colspan="2">　</td>
              	</tr>
              </thead>
              <tbody>
              	<tr>
              		<td class="smTd">생성연월차</td>
              		<td class="smTd">사용연월차</td>
              		<td class="smTd">잔여연월차</td>
              	</tr>
              	<tr>
              		<td height="80px;" class="bigTd">${ v.empVacList[0].plusYearVac }</td>
              		<td height="80px;" class="bigTd">${ v.empVacList[0].minusYearVac }</td>
              		<td height="80px;" class="bigTd">${ v.empVacList[0].gapYearVac }</td>
              	</tr>
              </tbody>
              <tfoot>
              	
              </tfoot>
            </table>
         
          
          <div class="profileHeader">
            <h5 class="card-header" style="color:#697a8d;"><b>📅 연차리스트 📅</b></h5>
      	</div>
          <div class="card-body">
          	<select class="form-control mr-sm-0" name="orderByYear" id="orderByYear" style="margin-bottom: 35px;"> 
          		<option value="all" class="badge rounded-pill bg-label-primary" selected>전체보기</option>
          		<option value="give" class="badge rounded-pill bg-label-primary">지급내역</option>
          		<option value="take" class="badge rounded-pill bg-label-primary">차감내역</option>
            </select>
            <table id="yearVacTable" class="table">
              <thead id="yearVacThead">
              	<tr>
              		<th>지급/차감</th>
              		<th>요청일</th>
              		<th>종류</th>
              		<th>사유</th>
              		<th>일수</th>
				</tr>              		
              </thead>
              <tbody id="yearVacTbody">
              	
              </tbody>
              <tfoot id="yearVacTfoot">
              	<tr>
              		<th>지급/차감</th>
              		<th>요청일</th>
              		<th>종류</th>
              		<th>사유</th>
              		<th>일수</th>
				</tr> 
              </tfoot>
            </table>
          </div>
      </div>
    </div>
  
    <!-- 휴가관리 -->
    <div class="col-md-6">
      <div class="card mb-4 vacDetailDiv justPadding">
      <a class="btn btn-outline-primary" onclick="go('vacControl.att')" style="margin-bottom:30px;"  href="javascript:window.history.back();">목록으로</a>
      	<div class="profileHeader">
      		<img src="<c:out value='${v.empPhoto}' default='resources/profile_images/defaultProfile.png' />" alt="Avatar" class="rounded-circle" width="30px;" height="30px;"/>
            <h5 class="card-header" style="color:#697a8d;"><b>${ v.empName } 🏃‍♂️ ${ v.grName } 🏃‍♂️ 휴가관리</b></h5>
      	</div>
           
          
            <table id="todayWork" class="table" style="margin-bottom : 50px;">
              <thead>
              	<tr>
              		<td colspan="2">　</td>
              	</tr>
              </thead>
              <tbody>
              	<tr>
              		<td class="smTd">생성휴가</td>
              		<td class="smTd">사용휴가</td>
              		<td class="smTd">잔여휴가</td>
              	</tr>
              	<tr>
              		<td height="80px;" class="bigTd">${ v.empVacList[0].plusVac }</td>
              		<td height="80px;" class="bigTd">${ v.empVacList[0].minusVac }</td>
              		<td height="80px;" class="bigTd">${ v.empVacList[0].gapVac }</td>
              	</tr>
              </tbody>
              <tfoot>
              	
              </tfoot>
            </table>
         
          
          <div class="profileHeader">
            <h5 class="card-header" style="color:#697a8d;"><b>📅 휴가사용내역 📅</b></h5>
      	</div>
          <div class="card-body">
          	<select class="form-control mr-sm-0" name="orderByVac" id="orderByVac" style="margin-bottom: 35px;""> 
          		<option value="all" class="badge rounded-pill bg-label-primary" selected>전체보기</option>
          		<option value="give" class="badge rounded-pill bg-label-primary">지급내역</option>
          		<option value="take" class="badge rounded-pill bg-label-primary">차감내역</option>
            </select>
            <table id="realVacTable" class="table">
              <thead id="realVacThead">
              	<tr>
              		<th>지급/차감</th>
              		<th>요청일</th>
              		<th>종류</th>
              		<th>사유</th>
              		<th>일수</th>
				</tr> 
              </thead>
              <tbody id="realVacTbody">
              	
              </tbody>
              <tfoot id="realVacTfoot">
              	<tr>
              		<th>지급/차감</th>
              		<th>요청일</th>
              		<th>종류</th>
              		<th>사유</th>
              		<th>일수</th>
				</tr> 
              </tfoot>
            </table>
          </div>
      </div>
    </div>
    
    
    
</div>


<script type="text/javascript" src="resources/js/attendance.js"></script>
<script type="text/javascript" src="resources/js/attendance/centerVacDetail.js"></script>
</body>
</html>