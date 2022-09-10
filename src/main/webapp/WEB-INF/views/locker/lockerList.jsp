<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
        table *{
          text-align: center;
        }




        table thead, table tfoot{
          background-color: #f8f4fc;
          /* background-color: #e8e4fc; */
        }

        .pagination{
          justify-content: center;
        }

        #dataTable td, #dataTable th{
          padding:0px;
          font-size: 4px;
          height: 23px;
        }

        #workTable td, #workTable th{
          padding:0px;
          font-size: 4px;
          height: 23px;
        }

        #late{ background-color: #fcffe1;}
        #illegal{ background-color: #ffebeb;}
        #approve{ background-color: #e1ffdd;}
        /* #yearVac{ background-color: #e7fdf9;} */
        #vacation{ background-color: #f2f2f2;}
        #plus{ background-color: #c8c9ff;}

        .locker{
          width:150px;
          height:100px;
          background-color: #f7f6f8;
          border: #e4e4e7 solid 1px;
          position: relative;
        }

        .locker-td{
          padding-right: 12px;
          padding-bottom: 12px;
        }

        .lk-ck{
          position: absolute;
          left: 5px;
          top:5px;
        }
        
        .lk-label{
          font-size: 7px;
          background-color: #696cff;
          color:white;
          border-radius: 3px;
          padding:3px;
          position:absolute;
          top:5px;
          right: 5px;
        }

        .bt-text{
          width:100px;
          height:95px;
          text-align: center;
          vertical-align: center;
          background-color: #f7f6f8;
          border: transparent;
          font-size: 15px;
        }
</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"/>
	
	<div class="content-wrapper">
      <div class="container-xxl flex-grow-1 container-p-y">
        <div class="row">

          <!-- <h5 class="py-3 my-4">근태관리 페이지</h5> -->
          <div class="col-xl-12">
            <!-- <h6 class="text-muted">Filled Pills</h6> -->
            <div class="nav-align-top mb-4">
              
              <div class="tab-content" style="width:100%; height:100%">
                <div class="tab-pane fade show active" id="navs-pills-justified-home" role="tabpanel">
                  <div style="height : 20px"></div>
                  <table class="pull-right">
                    <tr>
                      <td width="22px"></td>
                        <td>
                          <h3>🔐 락커 관리<span>(${pi.listCount })</span></h3>
                        </td>
                    </tr>        
                  </table>

                  <br>
                  <table align="center">
                    <tr>
                      <td style="padding-right:670px">
                        <button type="submit" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#moveLocker">자리이동</button>
                      </td>
                      <td>
                        
                        <button type="submit" class="btn btn-primary me-2" data-bs-toggle="modal" data-bs-target="#createLocker">락커생성</button>
                        <button type="button" class="btn btn-secondary me-2">락커삭제</button>
                     
                      </td>
                    </tr>
                   
                  </table>
                  <br>
                  
                  <div id="machine-area">
                    <table align="center">
                      <tr>
                        <td class="locker-td">
                          <div class="locker">
                            <input type="checkbox" class="lk-ck form-check-input">
                            <label class="lk-label">사용중</label>
                            <button class="bt-text" data-bs-toggle="modal" data-bs-target="#basicModal">
                              유지호 <br>
                              ~2022.8.30 <br>
                              (9일 후 만료)
                            </button>
                          </div>
                        </td>
                        <td class="locker-td">
                          <div class="locker">
                            <input type="checkbox" class="lk-ck form-check-input">
                            <label class="lk-label" style="background-color:#8592A3">미사용</label>
                            <button class="bt-text" data-bs-toggle="modal" data-bs-target="#basicModal">
                              
                            </button>
                          </div>
                        </td>
                        <td class="locker-td">
                          <div class="locker">
                            <input type="checkbox" class="lk-ck form-check-input">
                            <label class="lk-label" style="background-color:#03C3EC">예약</label>
                            <button class="bt-text" data-bs-toggle="modal" data-bs-target="#basicModal">
                              이정인 <br>
                              ~2022.8.30 <br>
                              (2일 후 사용)
                            </button>
                          </div>
                        </td>
                        <td class="locker-td">
                          <div class="locker">
                            <input type="checkbox" class="lk-ck form-check-input">
                            <label class="lk-label" style="background-color:#8592A3">미사용</label>
                            <button class="bt-text" data-bs-toggle="modal" data-bs-target="#basicModal">
                              
                            </button>
                          </div>
                        </td>
                        <td class="locker-td">
                          <div class="locker">
                            <input type="checkbox" class="lk-ck form-check-input">
                            <label class="lk-label" style="background-color:#8592A3">미사용</label>
                            <button class="bt-text" data-bs-toggle="modal" data-bs-target="#basicModal">
                              
                            </button>
                          </div>
                        </td>
                        <td class="locker-td">
                          <div class="locker">
                            <input type="checkbox" class="lk-ck form-check-input">
                            <label class="lk-label" style="background-color:#8592A3">미사용</label>
                            <button class="bt-text" data-bs-toggle="modal" data-bs-target="#basicModal">
                              
                            </button>
                          </div>
                        </td>
                        
                      </tr>
                      <tr>
                        <td class="locker-td">
                          <div class="locker">
                            <input type="checkbox" class="lk-ck form-check-input">
                            <label class="lk-label" style="background-color:#8592A3">미사용</label>
                            <button class="bt-text" data-bs-toggle="modal" data-bs-target="#basicModal">
                              
                            </button>
                          </div>
                        </td>
                        <td class="locker-td">
                          <div class="locker">
                            <input type="checkbox" class="lk-ck form-check-input">
                            <label class="lk-label" style="background-color:#8592A3">미사용</label>
                            <button class="bt-text" data-bs-toggle="modal" data-bs-target="#basicModal">
                              
                            </button>
                          </div>
                        </td>
                        <td class="locker-td">
                          <div class="locker">
                            <input type="checkbox" class="lk-ck form-check-input">
                            <label class="lk-label" style="background-color:#8592A3">미사용</label>
                            <button class="bt-text" data-bs-toggle="modal" data-bs-target="#basicModal">
                              
                            </button>
                          </div>
                        </td>
                        <td class="locker-td">
                          <div class="locker">
                            <input type="checkbox" class="lk-ck form-check-input">
                            <label class="lk-label" style="background-color:#8592A3">미사용</label>
                            <button class="bt-text" data-bs-toggle="modal" data-bs-target="#basicModal">
                              
                            </button>
                          </div>
                        </td>
                        <td class="locker-td">
                          <div class="locker">
                            <input type="checkbox" class="lk-ck form-check-input">
                            <label class="lk-label" style="background-color:#8592A3">미사용</label>
                            <button class="bt-text" data-bs-toggle="modal" data-bs-target="#basicModal">
                              
                            </button>
                          </div>
                        </td>
                        <td class="locker-td">
                          <div class="locker">
                            <input type="checkbox" class="lk-ck form-check-input">
                            <label class="lk-label" style="background-color:#8592A3">미사용</label>
                            <button class="bt-text" data-bs-toggle="modal" data-bs-target="#basicModal">
                              
                            </button>
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <td class="locker-td">
                          <div class="locker">
                            <input type="checkbox" class="lk-ck form-check-input">
                            <label class="lk-label" style="background-color:#8592A3">미사용</label>
                            <button class="bt-text" data-bs-toggle="modal" data-bs-target="#basicModal">
                              
                            </button>
                          </div>
                        </td>
                        <td class="locker-td">
                          <div class="locker">
                            <input type="checkbox" class="lk-ck form-check-input">
                            <label class="lk-label" style="background-color:#8592A3">미사용</label>
                            <button class="bt-text" data-bs-toggle="modal" data-bs-target="#basicModal">
                              
                            </button>
                          </div>
                        </td>
                        <td class="locker-td">
                          <div class="locker">
                            <input type="checkbox" class="lk-ck form-check-input">
                            <label class="lk-label" style="background-color:#8592A3">미사용</label>
                            <button class="bt-text" data-bs-toggle="modal" data-bs-target="#basicModal">
                              
                            </button>
                          </div>
                        </td>
                        <td class="locker-td">
                          <div class="locker">
                            <input type="checkbox" class="lk-ck form-check-input">
                            <label class="lk-label" style="background-color:#8592A3">미사용</label>
                            <button class="bt-text" data-bs-toggle="modal" data-bs-target="#basicModal">
                              
                            </button>
                          </div>
                        </td>
                        <td class="locker-td">
                          <div class="locker">
                            <input type="checkbox" class="lk-ck form-check-input">
                            <label class="lk-label" style="background-color:#8592A3">미사용</label>
                            <button class="bt-text" data-bs-toggle="modal" data-bs-target="#basicModal">
                              
                            </button>
                          </div>
                        </td>
               
                      </tr>
                    </table>

                    <!-- Modal -->
                    <div class="modal fade" id="basicModal" tabindex="-1" aria-hidden="true">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel1">락커 No. <span>5</span></h5>
                            <button
                              type="button"
                              class="btn-close"
                              data-bs-dismiss="modal"
                              aria-label="Close"
                            ></button>
                          </div>
                          <div class="modal-body">
                            <div class="row">
                              <div class="col mb-3">
                                <div class="mb-3">
                                  <label for="defaultSelect" class="form-label">회원 목록</label>
                                  <select id="defaultSelect" class="form-select">
                                    <option>Default select</option>
                                    <option value="1">One</option>
                                    <option value="2">Two</option>
                                    <option value="3">Three</option>
                                  </select>
                                </div>
                              </div>
                            </div>
                            <div class="row g-2">
                              <div class="col mb-0">
                                <label for="emailBasic" class="form-label">시작일</label>
                                <input class="form-control" type="date" value="2021-06-18" id="html5-date-input" />
                              </div>
                              <div class="col mb-0">
                                <label for="dobBasic" class="form-label">종료일</label>
                                <input class="form-control" type="date" value="2021-06-18" id="html5-date-input" />
                              </div>
                            </div>
                          </div>
                          <div class="modal-footer">
                            <!-- <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                              Close
                            </button> -->
                            <button type="button" class="btn btn-primary">등록</button>
                            <button type="button" class="btn btn-info">고장등록</button>
                            <button type="button" class="btn btn-secondary">락커회수</button>
                          </div>
                        </div>
                      </div>
                    </div>


                    <!-- Modal : createLocker -->
                    <div class="modal fade" id="createLocker" tabindex="-1" aria-hidden="true">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel1">락커 생성</h5>
                            <button
                              type="button"
                              class="btn-close"
                              data-bs-dismiss="modal"
                              aria-label="Close"
                            ></button>
                          </div>
                          <div class="modal-body">
                            <div class="row">
                              <div class="col mb-3">
                                <div class="mb-3">
                                  <label for="defaultSelect" class="form-label">락커갯수</label>
                                  <input class="form-control" type="number" value="18" id="html5-number-input">
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="modal-footer">
                            <!-- <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                              Close
                            </button> -->
                            <button type="button" class="btn btn-primary">추가</button>
                          </div>
                        </div>
                      </div>
                    </div>


                     <!-- Modal : createLocker -->
                     <div class="modal fade" id="moveLocker" tabindex="-1" aria-hidden="true">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel1">자리 이동</h5>
                            <button
                              type="button"
                              class="btn-close"
                              data-bs-dismiss="modal"
                              aria-label="Close"
                            ></button>
                          </div>
                          <div class="modal-body">
                            <div class="row">
                              <div class="col mb-3">
                                <div class="mb-3">
                                  <label for="defaultSelect" class="form-label">회원 목록</label>
                                  <select id="defaultSelect" class="form-select">
                                    <option>Default select</option>
                                    <option value="1">One</option>
                                    <option value="2">Two</option>
                                    <option value="3">Three</option>
                                  </select>
                                </div>
                                <div class="mb-3">
                                  <label for="defaultSelect" class="form-label">현재 자리 번호</label>
                                  <input class="form-control" type="number" value="18" id="html5-number-input">
                                </div>
                                <div class="mb-3">
                                  <label for="defaultSelect" class="form-label">이동할 자리 번호</label>
                                  <input class="form-control" type="number" value="18" id="html5-number-input">
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="modal-footer">
                            <!-- <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                              Close
                            </button> -->
                            <button type="button" class="btn btn-primary">자리이동</button>
                          </div>
                        </div>
                      </div>
                    </div>
                   
                  </div>

                  <br><br>
                  
                </div>

                <div>      
                  <div>
                    <div>
                      <!-- Basic Pagination -->
                        <nav aria-label="Page navigation pageNav">
                          <ul class="pagination">
                            <li class="page-item first">
                              <a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevrons-left"></i></a>
                            </li>
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
                            <li class="page-item">
                              <a class="page-link" href="javascript:void(0);">4</a>
                            </li>
                            <li class="page-item">
                              <a class="page-link" href="javascript:void(0);">5</a>
                            </li>
                            <li class="page-item next">
                              <a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevron-right"></i></a>
                            </li>
                            <li class="page-item last">
                              <a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevrons-right"></i></a>
                            </li>
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
      </div>
      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->
</body>
</html>