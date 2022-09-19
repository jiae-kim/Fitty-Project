<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fitty 근태수정</title>
<link type="text/css" rel="stylesheet" href="resources/css/attendance.css" />
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="content-wrapper">
    <div class="container-xxl flex-grow-1 container-p-y" style="padding:0px;">
        <div class="row">

            <!-- <h5 class="py-3 my-4">근태관리 페이지</h5> -->
            <div class="col-xl-12">
            <!-- <h6 class="text-muted">Filled Pills</h6> -->
                <div class="nav-align-top mb-4">
                    <ul class="nav nav-pills mb-3 nav-fill" role="tablist">
                    <li class="nav-item">
                        <button
                        type="button"
                        class="nav-link"
                        role="tab"
                        data-bs-toggle="tab"
                        aria-selected="false"
                        onclick="go('centerAtt.att')"
                        >
                        📅 전직원 근태확인
                        </button>
                    </li>
                    <li class="nav-item">
                        <button
                        type="button"
                        class="nav-link"
                        role="tab"
                        data-bs-toggle="tab"
                        aria-selected="false"
                        onclick="go('vacControl.att')"
                        >
                        🎁 연차 관리 &nbsp&&nbsp 🎉 휴가 관리
                        </button>
                    </li>
                    <li class="nav-item">
                        <button
                        type="button"
                        class="nav-link active"
                        role="tab"
                        data-bs-toggle="tab"
                        aria-selected="true"
                        onclick="go('modifyAtt.att')"
                        >
                        📝 근태 수정
                        </button>
                    </li>
                    </ul>
                    <div class="row">
                  <!-- 수정요청관리 -->
                  <div class="col-md-2 ">
                    <div class="card mb-4 attModifyDiv" style="overflow: auto;">
                        <h5 class="card-header"><b>⏰ 수정요청 타임라인</b></h5>
                        <div class="card-body modifyWrap">
                          
                          <c:choose>
                  	<c:when test="${ empty list }">
                  		<span>📃 리스트가 없습니다. 📃</span>
                  	</c:when>
                  	<c:otherwise>
                  		<c:forEach var="m" items="${ list }">
                  		<button class="simple" name="simple">
                  		<input type="hidden" value="${ m.moAttNo }" id="moAttNo">
                  		 <!--  <a  href="modifyDetail.mo?moAttNo=${ m.moAttNo }"> -->
			             <div class="profileDiv">
			               <img src="<c:out value='${ m.empPhoto }' default='resources/profile_images/defaultProfile.png' />" alt="Avatar" class="rounded-circle" width="20px;" height="20px;"/>
			               <span class="profileName"><b>${m.empName}</b></span>
			               <span class="profileName">${m.grName }</span>
			             </div>
			             <div>
			               <table class="modifyList">
			                  <tr>
			                   <th>작성일</th>
			                   <td>${ m.moAttEnrollD }</td>
			                 </tr>
			                 <tr>
			                   <th>수정요청일</th>
			                   <td>${ m.moAttModifyD }</td>
			                 </tr>
			                 <tr>
			                   <th>비고</th>
			                   <c:choose>
			                   		<c:when test="${ m.moAttType eq 'I' }">
			                   			<td><span class="badge rounded-pill bg-label-primary">출근수정</span></td>
			                   		</c:when>
			                   		<c:when test="${ m.moAttType eq 'O' }">
			                   			<td><span class="badge rounded-pill bg-label-info">퇴근수정</span></td>
			                   		</c:when>
			                   		<c:otherwise>
			                   			<td><span class="badge rounded-pill bg-label-secondary">기타수정</span></td>
			                   		</c:otherwise>
			                   </c:choose>
			                 </tr>
			                 <tr>
			                 	<c:choose>
			                   		<c:when test="${ m.moAttStatus eq 'W' }">
			                   			<td colspan="2" style="text-align:center"><button class="btn btn-sm btn-secondary">대기중</button></td>
			                   		</c:when>
			                   		<c:when test="${ m.moAttStatus eq 'M' }">
			                   			<td colspan="2" style="text-align:center"><button class="btn btn-sm btn-success">승인됨</button></td>
			                   		</c:when>
			                   		<c:otherwise>
			                   			<td colspan="2" style="text-align:center"><button class="btn btn-sm btn-danger">반려됨</button></td>
			                   		</c:otherwise>
			                   </c:choose>
			                 </tr>
			               </table>
			             </div>
			            
			           </button>
                  	</c:forEach>
                 </c:otherwise>
              </c:choose>
                       
                    <!--<div class="endDiv">
                          <button class="btn btn-primary">📝 근태 수정</button>
                          <div class="endDiv">
				           <div style="backgorund-color:white; height:20px; position: fixed;"> 
				           <button style="position: fixed;" class="btn btn-primary" onclick="selectMoAttForm();">📝 새 수정요청</button>
						   <input type="hidden" value="${ loginUser.empNo }" id="empNo">
				           <div aria-label="Page navigation pageNav">
				             <ul class="pagination">
				             </ul>
				           </div>-->
				           <!--/ Basic Pagination -->
				         </div>
                    </div>
                    
                  </div>
                
                  <!-- 휴가관리 -->
                  <div class="col-md-10 printModifyDiv">
                   
                 
                 </div>
             </div>
          </div>
       </div>
</div>
<script type="text/javascript" src="resources/js/attendance.js"></script>
<script type="text/javascript" src="resources/js/attendance/modifyAttendance.js"></script>
</body>
</html>