<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/*여기서부터 개별 스타일*/
        
        table *{
          text-align: center;
        }
        
        table thead, table tfoot{
          background-color: #f8f4fc;
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
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div class="content-wrapper">
      <div class="container-xxl flex-grow-1 container-p-y" style="padding:0px;">
        <div class="row">

          <!-- <h5 class="py-3 my-4">근태관리 페이지</h5> -->
          <div class="col-xl-12">
            <!-- <h6 class="text-muted">Filled Pills</h6> -->
            <div class="nav-align-top mb-4">
              <ul class="nav nav-pills mb-3 nav-fill" role="tablist">
                <li class="nav-item">
                  <a class="nav-link" href="list.mc">
                    <!-- <i class="tf-icons bx bx-home"></i> Home -->
                    🏋️‍♀️ 전체&nbsp기구
                  </a>
                </li>
                <li class="nav-item">
                  <a type="button" class="nav-link active" href="ckList.mc">
                    <!-- <i class="tf-icons bx bx-user"></i> Profile -->
                    ✔ 기구&nbsp;점검
                  </a>
                </li>
                <li class="nav-item">
                  <a
                    type="button"
                    class="nav-link"
                    data-bs-target="#navs-pills-justified-messages"
                    aria-controls="navs-pills-justified-messages"
                    aria-selected="false"
                  >
                    <!-- <i class="tf-icons bx bx-message-square"></i> Messages -->
                    🛠 고장난&nbsp기구
                  </a>
                </li>
              </ul>
              <div class="tab-content" style="width:100%; height:100%">
                <div class="tab-pane fade show active" id="navs-pills-justified-home" role="tabpanel">
                  <div style="height : 20px"></div>
                  <table class="pull-right">
                    <tr>
                        <td>
                          <h3>시설 점검 리스트</h3>
                        </td>
                        <td style="width:84.7%; text-align:right">
                          <button class="btn btn-primary" onclick="generalChange();">작성하기</button>
                        </td>
                    </tr>        
                  </table>

                  <br>

                  <div id="machine-area" style="width:100%; height:100%">

                    <table class="table" style="border:1px solid rgb(209, 209, 209)">
                      <tr>
                        <th>점검자</th>
                        <th>점검 기구</th>
                        <th>점검 제목</th>
                        <th>점검일</th>
                      <c:choose>
                      <c:when test="${ empty list }">
	                      <tr>
	                        <td colspan="4">현재 등록 점검이 없습니다.</td>
	                      </tr>
                      </c:when>
                      <c:otherwise>
                      	<c:forEach var="m" items="${ list }">
                      	<tr>
	                        <td>${ m.ckWriter }</td>
	                        <td>${ m.mcName }</td>
	                        <td>${ m.ckTitle }</td>
	                        <td>${ m.ckDate }</td>
	                    </tr>
	                    </c:forEach>
                      </c:otherwise>
                      </c:choose>
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
                          <c:choose>
                          	<c:when test="${ pi.currentPage eq 1 }">
	                            <li class="page-item prev disabled">
	                              <a class="page-link"><i class="tf-icon bx bx-chevron-left"></i></a>
	                            </li>
                            </c:when>
                            <c:otherwise>
	                            <li class="page-item prev">
	                              <a class="page-link" href="ckList.mc?cpage=${ pi.currentPage - 1 }"><i class="tf-icon bx bx-chevron-left"></i></a>
	                            </li>
                            </c:otherwise>
                           </c:choose>
                           
                           <c:forEach var="p" begin="${pi.startPage }" end="${ pi.endPage }">
                            <li class="page-item">
                              <a class="page-link page-color" href="ckList.mc?cpage=${ p }">${ p }</a>
                            </li>
                           </c:forEach>
                            
                           <c:choose>
                           <c:when test="${pi.currentPage eq pi.maxPage }">
                            <li class="page-item next disabled">
                              <a class="page-link"><i class="tf-icon bx bx-chevron-right"></i></a>
                            </li>
                           </c:when> 
                           <c:otherwise>
                           	<li class="page-item next">
                              <a class="page-link" href="ckList.mc?cpage=${ pi.currentPage + 1 }"><i class="tf-icon bx bx-chevron-right"></i></a>
                            </li>
                           </c:otherwise>
                           </c:choose>
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