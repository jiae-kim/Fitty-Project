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
      	<div class="profileHeader">
      		<img src="<c:out value='${v.empPhoto}' default='resources/profile_images/defaultProfile.png' />" alt="Avatar" class="rounded-circle" width="30px;" height="30px;"/>
            <h5 class="card-header" style="color:#697a8d;"><b>${ v.empName } 🏃‍♂️ ${ v.grName } 🏃‍♂️ 연차관리</b></h5>
      	</div>
            <table id="todayWork" class="table">
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
            <h5 class="card-header" style="color:#697a8d;"><b>📅 연차사용내역 📅</b></h5>
      	</div>
          <div class="card-body">
          	<select class="form-control mr-sm-0" name="orderByYear" id="orderByYear" style="height: 35px;"> 
          	<c:forEach var="map" items="${yearList}" varStatus="status">
          		<option value="<c:out value="${map.yearList}" />"><c:out value="${map.yearList}" /></option>
            </c:forEach>
            </select>
            <table id="yearVacTable" class="table">
              <thead>
              	<tr>
           			<td>시작일</td>
            		<td>종료일</td>
            		<td>차감</td>
            		<td>사유</td>
            		<td>종류</td>
              	</tr>
              </thead>
              <tbody id="yearVacTbody">
              	
              </tbody>
              <tfoot>
              	<tr>
              		<td>시작일</td>
              		<td>종료일</td>
              		<td>차감</td>
              		<td>사유</td>
              		<td>종류</td>
              	</tr>
              </tfoot>
            </table>
          </div>
      </div>
    </div>
  
    <!-- 휴가관리 -->
    <div class="col-md-6">
      <div class="card mb-4 vacDetailDiv justPadding">
      	<div class="profileHeader">
      		<img src="<c:out value='${v.empPhoto}' default='resources/profile_images/defaultProfile.png' />" alt="Avatar" class="rounded-circle" width="30px;" height="30px;"/>
            <h5 class="card-header" style="color:#697a8d;"><b>${ v.empName } 🏃‍♂️ ${ v.grName } 🏃‍♂️ 휴가관리</b></h5>
      	</div>
           
          
            <table id="todayWork" class="table">
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
          	<select class="form-control mr-sm-0" name="orderByYear" id="orderByYear" style="height: 35px;"> 
          	<c:forEach var="map" items="${yearList}" varStatus="status">
          		<option value="<c:out value="${map.yearList}" />"><c:out value="${map.yearList}" /></option>
            </c:forEach>
            </select>
            <table id="yearVacTable" class="table">
              <thead>
              	<tr>
           			<td>시작일</td>
            		<td>종료일</td>
            		<td>차감</td>
            		<td>사유</td>
            		<td>종류</td>
              	</tr>
              </thead>
              <tbody id="yearVacTbody">
              	
              </tbody>
              <tfoot>
              	<tr>
              		<td>시작일</td>
              		<td>종료일</td>
              		<td>차감</td>
              		<td>사유</td>
              		<td>종류</td>
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