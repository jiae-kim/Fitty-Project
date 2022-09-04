<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fitty 근태수정</title>
<link type="text/css" rel="stylesheet" href="resources/css/attendance.css" />
<script type="text/javascript" src="resources/js/attendance.js"></script>
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
                    <div class="card mb-4 attModifyDiv">
                        <h5 class="card-header"><b>⏰ 수정요청 타임라인</b></h5>
                        <div class="card-body modifyWrap">
                          <button class="simple">
                            <div class="profileDiv">
                              <i class='bx bxs-user-circle'></i>
                              <span class="profileName"><b>홍길동</b></span>
                              <span class="profileName">트레이너</span>
                            </div>
                            <div>
                              <table class="modifyList">
                                <tr>
                                  <th>변경요청일</th>
                                  <td>2022.08.16</td>
                                </tr>
                                <tr>
                                  <th>비고</th>
                                  <td>출근수정</td>
                                </tr>
                                <tr>
                                  <td colspan="2" style="text-align:center"><button class="btn btn-sm btn-primary">처리하기</button></td>
                                </tr>
                              </table>
                            </div>
                          </button>
                          <button class="simple">
                            <div class="profileDiv">
                              <i class='bx bxs-user-circle'></i>
                              <span class="profileName"><b>홍길동</b></span>
                              <span class="profileName">트레이너</span>
                            </div>
                            <div>
                              <table class="modifyList">
                                <tr>
                                  <th>변경요청일</th>
                                  <td>2022.08.16</td>
                                </tr>
                                <tr>
                                  <th>비고</th>
                                  <td>출근수정</td>
                                </tr>
                                <tr>
                                  <td colspan="2" style="text-align:center"><button class="btn btn-sm btn-secondary">처리완료</button></td>
                                </tr>
                              </table>
                            </div>
                          </button>
                        </div>
                        <div class="endDiv">
                          <button class="btn btn-primary">📝 근태 수정</button>
                          <!-- Basic Pagination 최대를 3으로 하던가ㅜㅜ-->
                          <div aria-label="Page navigation pageNav">
                            <ul class="pagination smallPagination">
                              <li class="page-item prev">
                                <a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevron-left"></i></a>
                              </li>
                              <li class="page-item">
                                <a class="page-link" href="javascript:void(0);">1</a>
                              </li>
                              <li class="page-item">
                                <a class="page-link" href="javascript:void(0);">2</a>
                              </li>
                              <li class="page-item active">
                                <a class="page-link" href="javascript:void(0);">3</a>
                              </li>
                              <li class="page-item next">
                                <a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevron-right"></i></a>
                              </li>
                            </ul>
                          </div>
                          <!--/ Basic Pagination -->
                        </div>
                    </div>
                    
                  </div>
                
                  <!-- 휴가관리 -->
                  <div class="col-md-10 ">
                    <div class="card mb-4 modifyDiv">
                        <h5 class="card-header"><b>📝 근태 수정요청안</b></h5>
                        <div class="card-body" style="width: 95%;">
                          <form id="formAccountSettings" method="POST" onsubmit="return false">
                            <table class="table table-hover modifyTable">
                              <thead>
                                <tr>
                                  <td colspan="6" class="profileTd">
                                    <i class='bx bxs-user-circle'></i>
                                    <span class="profileName"><b>홍길동</b></span>
                                    <span class="profileName">트레이너</span>
                                  </td>
                                </tr>
                                <tr>
                                  <td>수정요청일</td>
                                  <td>출근시간</td>
                                  <td>휴식시간</td>
                                  <td>퇴근시간</td>
                                  <td>총 근무시간</td>
                                  <td>상태</td>
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                  <td>2022/08/15</td>
                                  <td>10:13:21</td>
                                  <td>59:31</td>
                                  <td>18:15:35</td>
                                  <td>06:58:36</td>
                                  <td>지각</td>
                                </tr>
                              </tbody>
                            </table>
                          </form>
                          <form class="mb-3 col-md-12 reason" style="margin-top: 15px;">
                            <h5 class="card-header" style="margin-bottom : 15px"><b>🧾 출근수정사유</b></h5>
                            <textarea class="textarea" autofocus readonly>이미 작성된 구차한 변명</textarea>
                            <h5 class="card-header" style="margin-bottom : 15px"><b>📋 수정의견</b></h5>
                            <textarea class="textarea" autofocus required>수정 의견을 적어주세요</textarea>
                            <div class="row submitDiv">
                              <div class="mt-2 btnDiv col-md-7">
                                <label for="address" class="form-label" style="font-size: 10px; width:50px">수정시간</label>
                                <input type="time" class="form-control" id="birth" name="birth" />
                              </div>
                              <div class="mt-2 btnDiv col-md-5">
                                <button type="submit" class="btn btn-primary me-2">수정하기</button>
                                <button type="button" class="btn btn-secondary me-2">반려하기</button>
                              </div>
                            </div>
                          </form>
                        </div>
                    
                 
                 </div>
             </div>
          </div>
       </div>
</div>

</body>
</html>