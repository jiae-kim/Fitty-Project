<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fitty 당일 근태 관리</title>
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
                        class="nav-link active"
                        role="tab"
                        data-bs-toggle="tab"
                        aria-selected="true"
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
                        class="nav-link"
                        role="tab"
                        data-bs-toggle="tab"
                        aria-selected="false"
                        onclick="go('modifyAtt.att')"
                        >
                        📝 근태 수정
                        </button>
                    </li>
                    </ul>
                    
                    
              <div class="tab-content">
                <div class="tab-pane fade show active" id="navs-pills-justified-home" role="tabpanel">
                	<form class="dateForm">
                   		<table class="dateTable">
                   			<tr>
                   				<td rowspan="2"><button type="button" id="backBtn"><i class='bx bxs-left-arrow arrow'></i></button></td>
                   				<td id="dtNowYear"><input type="text" value="${ thisYear }" id="thisYear" name="thisYear"></td>
                   				<td id="dtNowMonth"><input type="text" value="${ thisMonth }" id="thisMonth" name="thisMonth"></td>
                   				<td id="dtNowDay"><input type="text" value="${ thisDay }" id="thisDay" name="thisDay"></td>
                   				<td rowspan="2"><button type="button" id="nextBtn"><i class='bx bxs-right-arrow arrow' id="rightArrow"></i></button></td>
                   			</tr>
                   			<tr>
                   				
                   			</tr>
                   		</table>
                    </form>
                  <div style="height : 20px"></div>
                  <table class="pull-right">
                    <tr>
                      <td width = "600px;"></td>
                      <td width = "150px;">
                        <select class="form-control mr-sm-0" name="orderByGrade" id="orderByGrade" style="height: 35px;"> 
                        		<option value="all" selected>전체선택</option>                                       
                                <option value="admin">관리자</option>
                                <option value="trainer">트레이너</option>
                        </select>
                      </td>
                      <td width = "150px;">
                      	<select class="form-control mr-sm-0" name="orderByStatus" id="orderByStatus" style="height: 35px;"> 
                        		<option value="selectAll" selected>전체선택</option>                                       
                                <option value="O">정상출퇴근</option>
                                <option value="YVQZ">연월차 / 휴가</option>
                                <option value="P">연장근무</option>
                                <option value="LX">지각 / 무단결근</option>
                        </select>
                      </td>
                      <td width = "400px;"><input type="text" class="form-control" placeholder="직원명 입력" name="searchText" id="searchText"  maxlength="30" style="height: 35px;"></td>
                      <td><button type="button" id="searchBtn" class="btn btn-primary"><i class='bx bx-search' style="color:white;"></i></button></td>
                    </tr>        
                      <input type="hidden" id="strInsertVacListEmpNo">
                  </table>
                </div>
              
        
                <div style="height : 5px"></div>
                    <div class="card-body">
                      <div class="table-responsive">
                        <table class="table memberListTable table-hover" id="dataTable" width="100%" cellspacing="0">
                          <thead>
                              <tr>
                                <th>사번</th>
                                <th>이름</th>
                                <th>직급</th>
                                <th>근무일</th>
                                <th>출근시간</th>
                                <th>퇴근시간</th>
                                <th>상태</th>
                                <th>야근여부</th>
                              </tr>
                          </thead>
                          <tfoot>
                              <tr>
                                <th>사번</th>
                                <th>이름</th>
                                <th>직급</th>
                                <th>근무일</th>
                                <th>출근시간</th>
                                <th>퇴근시간</th>
                                <th>상태</th>
                                <th>야근여부</th>
                              </tr>
                          </tfoot>
                          
                          <tbody id="memListTBody">
                            
                          </tbody>
                          <input type="hidden" id="invalidNoYear">
                          <input type="hidden" id="invalidNoMon">
                          <input type="hidden" id="invalidNoDay">
                        </table>
                        <div style="height : 20px"></div>
                            <!-- Basic Pagination -->
                            <nav aria-label="Page navigation pageNav">
                                <ul class="pagination">
                                
                                </ul>
                            </nav>
                            <!--/ Basic Pagination -->

					        <button class="btn btn-primary" onclick="go('centerAtt.att')">전체목록으로</button>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
</div>

<script type="text/javascript" src="resources/js/attendance.js"></script>
<script type="text/javascript" src="resources/js/attendance/centerTodayAttendance.js"></script>
</body>
</html>