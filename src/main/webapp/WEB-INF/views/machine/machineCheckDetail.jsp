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

        #tb1 th{
          background-color: #f8f4fc;
        }
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
              <div class="tab-content" style="width:100%; height:100%">
                <div class="tab-pane fade show active" id="navs-pills-justified-home" role="tabpanel">
                  <div style="height : 20px"></div>
                  <table class="pull-right">
                    <tr>
                        <td style="padding-left:15px;">
                          <h3>기구 점검 상세</h3>
                        </td>
                    </tr>        
                  </table>
                  <br>

                  <table class="table table-bordered" id="tb1" style="text-align:left;">
                  	<tr>
                  		<th>점검 제목</th>
                  		<td colspan="3">${ m.ckTitle }</td>
                  	</tr>
                    <tr>
                      <th>점검 기구</th>
                      <td colspan="3">${ m.mcName }</td>
                    </tr>
                    <tr>
                      <th>작성자</th>
                      <td>${ m.ckWriterName }</td>
                      <th>작성일자</th>
                      <td>${m.ckDate }</td>
                    </tr>
                    <tr>
                      <th>점검내용</th>
                      <td colspan="3">${ m.ckContent }</td>
                    </tr>
                    <tr>
                      <th>사진</th>
                      <td colspan="3"><img src="${ m.ckImg }" alt=""></td>
                    </tr>
                  </table>

                  <br>

                  <div class="mt-2 btnDiv" align="center">
                  	<c:choose>
	                  	<c:when test="${ m.ckResult == '1' and (loginUser.empGrade == 'C' or loginUser.empGrade == 'A' )}">
		                    <a class="btn btn-primary me-2" href="broken.mc?ckNo=${ m.ckNo }&mcNo=${ m.mcNo }">고장등록</a>
		                    <a class="btn btn-info me-2" href="normal.mc?ckNo=${ m.ckNo }">정상처리</a>
	                    </c:when>
	                    <c:otherwise>
	                    	<c:if test="${ loginUser.empNo == m.ckWriter }">
		                    	<a class="btn btn-secondary" href="ckDelete.mc?ckNo=${ m.ckNo }">삭제하기</a>
		                    </c:if>
	                    </c:otherwise>
	                </c:choose>
		            
		            
		            
                  </div>

                  <br>
                  
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