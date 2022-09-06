<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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

        .card-machine{
          display:inline;
        }

        #machine-area td{
          padding: 12px;
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
              <ul class="nav nav-pills mb-3 nav-fill" role="tablist">
                <li class="nav-item">
                  <button
                    type="button"
                    class="nav-link active"
                    role="tab"
                    data-bs-toggle="tab"
                    data-bs-target="#navs-pills-justified-home"
                    aria-controls="navs-pills-justified-home"
                    aria-selected="true"
                  >
                    <!-- <i class="tf-icons bx bx-home"></i> Home -->
                    🏋️‍♀️ 전체&nbsp기구
                  </button>
                </li>
                <li class="nav-item">
                  <button
                    type="button"
                    class="nav-link"
                    role="tab"
                    data-bs-toggle="tab"
                    data-bs-target="#navs-pills-justified-messages"
                    aria-controls="navs-pills-justified-messages"
                    aria-selected="false"
                  >
                    <!-- <i class="tf-icons bx bx-user"></i> Profile -->
                    ✔ 기구&nbsp점검
                  </button>
                </li>
                <li class="nav-item">
                  <button
                    type="button"
                    class="nav-link"
                    role="tab"
                    data-bs-toggle="tab"
                    data-bs-target="#navs-pills-justified-messages"
                    aria-controls="navs-pills-justified-messages"
                    aria-selected="false"
                  >
                    <!-- <i class="tf-icons bx bx-message-square"></i> Messages -->
                    🛠 고장난&nbsp기구
                  </button>
                </li>
              </ul>
              <div class="tab-content" style="width:100%; height:100%">
                <div class="tab-pane fade show active" id="navs-pills-justified-home" role="tabpanel">
                  <div style="height : 20px"></div>
                  <table class="pull-right">
                    <tr>
                      <td width="22px"></td>
                        <td>
                          <h3>전체기구<span>(23)</span></h3>
                        </td>
                        
                        <td width="1050px"></td>
                        <td><button class="btn btn-primary" onclick="generalChange();">기구등록</button></td>
                    </tr>        
                  </table>

                  <br>

                  <div id="machine-area" style="width:100%; height:100%">

                    <table>
                      <tr>
                        <td>
                          <div class="card h-100" data-bs-toggle="modal">
                            <img class="card-img-top" src="https://demos.themeselection.com/sneat-bootstrap-html-admin-template-free/assets/img/elements/2.jpg" art="Card image cap">
                            <div class="card-body">
                              <h5 class="card-title" style="display:inline">벤치프레스 1</h5>
                            </div>
                          </div>   
                        </td>
  
                        <td>
                          <div class="card h-100">
                            <img class="card-img-top" src="https://demos.themeselection.com/sneat-bootstrap-html-admin-template-free/assets/img/elements/2.jpg" art="Card image cap">
                            <div class="card-body">
                              <h5 class="card-title" style="display:inline">벤치프레스 2</h5>
                            </div>
                          </div>   
                        </td>
  
                        <td>
                          <div class="card h-100">
                            <img class="card-img-top" src="https://demos.themeselection.com/sneat-bootstrap-html-admin-template-free/assets/img/elements/2.jpg" art="Card image cap">
                            <div class="card-body">
                              <h5 class="card-title" style="display:inline">벤치프레스 3</h5>
                            </div>
                          </div>   
                        </td>
  
                        <td>
                          <div class="card h-100">
                            <img class="card-img-top" src="https://demos.themeselection.com/sneat-bootstrap-html-admin-template-free/assets/img/elements/2.jpg" art="Card image cap">
                            <div class="card-body">
                              <h5 class="card-title" style="display:inline">Card title</h5>
                            </div>
                          </div>   
                        </td>
  
                        <td>
                          <div class="card h-100">
                            <img class="card-img-top" src="https://demos.themeselection.com/sneat-bootstrap-html-admin-template-free/assets/img/elements/2.jpg" art="Card image cap">
                            <div class="card-body">
                              <h5 class="card-title" style="display:inline">Card title</h5>
                            </div>
                          </div>   
                        </td>
                           
                      </tr>
  
                      <tr>
                        <td>
                          <div class="card h-100">
                            <img class="card-img-top" src="https://demos.themeselection.com/sneat-bootstrap-html-admin-template-free/assets/img/elements/2.jpg" art="Card image cap">
                            <div class="card-body">
                              <h5 class="card-title" style="display:inline">Card title</h5>
                            </div>
                          </div>   
                        </td>
  
                        <td>
                          <div class="card h-100">
                            <img class="card-img-top" src="https://demos.themeselection.com/sneat-bootstrap-html-admin-template-free/assets/img/elements/2.jpg" art="Card image cap">
                            <div class="card-body">
                              <h5 class="card-title" style="display:inline">Card title</h5>
                            </div>
                          </div>   
                        </td>
  
                        <td>
                          <div class="card h-100">
                            <img class="card-img-top" src="https://demos.themeselection.com/sneat-bootstrap-html-admin-template-free/assets/img/elements/2.jpg" art="Card image cap">
                            <div class="card-body">
                              <h5 class="card-title" style="display:inline">Card title</h5>
                            </div>
                          </div>   
                        </td>
  
                        <td>
                          <div class="card h-100">
                            <img class="card-img-top" src="https://demos.themeselection.com/sneat-bootstrap-html-admin-template-free/assets/img/elements/2.jpg" art="Card image cap">
                            <div class="card-body">
                              <h5 class="card-title" style="display:inline">Card title</h5>
                            </div>
                          </div>   
                        </td>
  
                        <td>
                          <div class="card h-100">
                            <img class="card-img-top" src="https://demos.themeselection.com/sneat-bootstrap-html-admin-template-free/assets/img/elements/2.jpg" art="Card image cap">
                            <div class="card-body">
                              <h5 class="card-title" style="display:inline">Card title</h5>
                            </div>
                          </div>   
                        </td>
                           
                      </tr>
                    </table>

                   
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