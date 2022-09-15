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
                      <td>
                        <select class="form-control mr-sm-0" name="orderByAtt" id="orderByAtt" style="height: 35px;"> 
                        		<option value="allAttIn" selected>전체선택</option>                                             
                                <option value="yearOverEighty">작년 근태 80%이상</option>
                                <option value="monthOverHundred">지난달 근태 100%</option>
                        </select>
                      </td>
                      <td><input type="text" class="form-control" placeholder="검색어 입력" name="searchText" id="searchText"  maxlength="30" style="height: 35px;"></td>
                      <td><button type="button" id="searchBtn" class="btn btn-primary" onclick="changeSelect();"><i class='bx bx-search' style="color:white;"></i></button></td>
                      <td width="420px"></td>
                      <td><button class="btn btn-primary" onclick="generalChange();">연월차/휴가생성</button></td>
                      <td><button class="btn btn-secondary" onclick="generalChange();">연월차/휴가소진</button></td>
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