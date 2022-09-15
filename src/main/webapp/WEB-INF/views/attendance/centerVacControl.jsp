<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fitty 연차 휴가 관리</title>
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
                        class="nav-link active"
                        role="tab"
                        data-bs-toggle="tab"
                        aria-selected="true"
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
                  <div style="height : 20px"></div>
                  <table class="pull-right">
                    <tr>
                      <td width="22px"></td>
                      <td>
                        <select class="form-control mr-sm-0" name="orderByWorkTime" id="orderByWorkTime" style="height: 35px;"> 
                        		<option value="allWork" selected>전체선택</option>                                       
                                <option value="underOne">근속연수 1년이하</option>
                                <option value="oneToFive">근속연수 1~5년</option>
                                <option value="overFive">근속연수 5~10년</option>
                        </select>
                      </td>
                      <td width = "370px;">
                      	<div class="btn-group" role="group" aria-label="Basic radio toggle button group" name="orderByPercent" id="orderByPercent" style="height: 35px;">
			                <input type="radio" class="btn-check orderByPercent" name="orderByPercent" id="selectAll" value="selectAll" style="font-size: 10px;" checked autocomplete="off" />
			                <label class="btn btn-outline-primary" for="selectAll" style="font-size: 12px;">전체선택</label>
			                <input type="radio" class="btn-check orderByPercent" name="orderByPercent" id="over80" value="over80" autocomplete="off" />
			                <label class="btn btn-outline-primary" for="over80" style="font-size: 12px;">작년 근태 80%이상</label>
			                <input type="radio" class="btn-check orderByPercent" name="orderByPercent" id="over100" value="over100" autocomplete="off" />
			                <label class="btn btn-outline-primary" for="over100" style="font-size: 12px;">지난달 근태 100%</label> 
			              </div>
                        
                      </td>
                      <td><input type="text" class="form-control" placeholder="직원명 입력" name="searchText" id="searchText"  maxlength="30" style="height: 35px;"></td>
                      <td><button type="button" id="searchBtn" class="btn btn-primary" onclick="changeSelect();"><i class='bx bx-search' style="color:white;"></i></button></td>
                      <td width="180px"></td>
                      <td width = "150px;"><button class="btn btn-info" onclick="generalChange();">연월차/휴가생성</button></td>
                      <td width = "150px;"><button class="btn btn-warning" onclick="generalChange();">연월차/휴가소진</button></td>
                    </tr>        
                  </table>
                </div>
              
        
                <div style="height : 5px"></div>
                    <div class="card-body">
                      <div class="table-responsive">
                        <table class="table memberListTable table-hover" id="dataTable" width="100%" cellspacing="0">
                          <thead>
                              <tr>
                                <th><input type="checkbox" name="choiceAll" id="choiceAll" onclick="checkAll();"></th>
                                <th>사번</th>
                                <th>이름</th>
                                <th>직급</th>
                                <th>입사일</th>
                                <th>근속연수</th>
                                <th>작년근태</th>
                                <th>지난달근태</th>
                                <th>발생연월차</th>
                                <th>잔여연월차</th>
                                <th>발생휴가</th>
                                <th>잔여휴가</th>
                              </tr>
                          </thead>
                          <tfoot>
                              <tr>
                                <th><input type="checkbox" name="choiceAll" id="choiceAll" onclick="checkAll();"></th>
                                <th>사번</th>
                                <th>이름</th>
                                <th>직급</th>
                                <th>입사일</th>
                                <th>근속연수</th>
                                <th>작년근태</th>
                                <th>지난달근태</th>
                                <th>발생연월차</th>
                                <th>잔여연월차</th>
                                <th>발생휴가</th>
                                <th>잔여휴가</th>
                              </tr>
                          </tfoot>
                          
                          <tbody id="memListTBody">
                            
                          </tbody>
                          <input type="hidden" id="invalidNo">
                        </table>
                        <div style="height : 20px"></div>
                            <!-- Basic Pagination -->
                            <nav aria-label="Page navigation pageNav">
                                <ul class="pagination">
                                
                                </ul>
                            </nav>
                            <!--/ Basic Pagination -->
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
</div>

<script type="text/javascript" src="resources/js/attendance.js"></script>
<script type="text/javascript" src="resources/js/attendance/centerVacControl.js"></script>
</body>
</html>