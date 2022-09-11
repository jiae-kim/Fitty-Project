<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fitty 헬스장 이용권</title>
</head>
<body>
<jsp:include page="../common/header.jsp"/>

<div class="content-wrapper">
  <div class="container-xxl flex-grow-1 container-p-y" style="padding : 0px;">
    <div class="row">
      <div class="col-xl-12">
        <div class="nav-align-top mb-4">
          <div class="tab-content" style="height: 750px;">
            <h5 class="text-muted">🎫상품관리 - 헬스장이용권</h5>
            <div class="btn-group2" style="float: right;">
            <!-- 등록 버튼 -->
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#ProductEnroll">이용권 등록</button>
            <!-- Modal창 띄우기 -->
            
            <div class="modal fade" id="ProductEnroll" tabindex="-1" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="modalCenterTitle">🎫상품관리 - 헬스장 이용권</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  </div>
                  <div class="modal-body">
                    <label for="nameWithTitle" class="form-label">이용권 개월 수</label>
                    <select id="defaultSelect" name="" class="form-select">
                      <option disabled selected hidden>등록할 이용권 개월수 선택</option>
                      <option value="1">1개월 이용권</option>
                      <option value="2">2개월 이용권</option>
                      <option value="3">3개월 이용권</option>
                      <option value="4">4개월 이용권</option>
                      <option value="5">5개월 이용권</option>
                      <option value="6">6개월 이용권</option>
                      <option value="7">7개월 이용권</option>
                      <option value="8">8개월 이용권</option>
                      <option value="9">9개월 이용권</option>
                      <option value="10">10개월 이용권</option>
                      <option value="11">11개월 이용권</option>
                      <option value="12">12개월 이용권</option>
                    </select>
                    <br><br>
                    <label for="nameWithTitle" class="form-label">이용권 가격</label>
                    <input type="text" id="number" class="form-control" placeholder="금액을 입력하세요">
                    <!-- 금액 입력 시 자동으로 천단위 콤마 찍어줌 -->
                    <script type="text/javascript">
                      //var p = document.getElementById('number');
                      const input = document.querySelector('#number');
                      input.addEventListener('keyup', function(e){
                        let value = e.target.value;
                        value = Number(value.replaceAll(',', ''));
                        const formatValue = value.toLocaleString('ko-KR');
                        input.value = formatValue;
                      })
                    </script>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-primary">확인</button>
                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
                  </div>
                </div>
              </div>
            </div>

            <!-- 삭제 버튼 -->
            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#ProductDelete">이용권 삭제</button>
            <!-- Modal창 띄우기 -->
            <div class="modal fade" id="ProductDelete" tabindex="-1" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="modalCenterTitle">🎫상품관리 - 헬스장 이용권</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  </div>
                  <div class="modal-body" style="text-align: center; font-size: larger; font-weight: bold;">헬스장 이용권이 삭제되었습니다</div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-primary">확인</button>
                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
                  </div>
                </div>
              </div>
            </div>
          </div><br><br><br><br><br>

          <div class="card">
            <div class="table-responsive text-nowrap">
            <table class="table">
              <thead class="table-light">
                <tr>
                  <th></th>
                  <th>이용권 번호</th>
                  <th>이용권</th>
                  <th>가격(원)</th>
                  <th>이용권 수정</th>
                </tr>
              </thead>
              
              <tbody class="table-border-bottom-0">
              
              <c:choose>
              	<c:when test="${empty list}">
              	<tr>
              		<td colspan="6">현재 등록된 헬스장 이용권이 없습니다.</td>
              	</tr>
              	</c:when>
              	<c:otherwise>
            		<c:forEach var="p" items="${list}">
		              <tr>
		              	<!-- 체크박스 버튼 -->
		                <td><input type="checkbox"></td>
		                <!-- 이용권 번호 -->
		                <td><i class="fab fa-react fa-lg text-info me-3"></i>${p.proNo}</td>
		                <!-- 이용권 -->
		                <td>${p.pro}</td>
		                <!-- 이용권 금액 -->
		                <td>${p.proPrice}</td>
                	    <!-- 수정 버튼 -->
		                <td>
		                  <button type="button" class="btn rounded-pill btn-outline-warning" data-bs-toggle="modal" data-bs-target="#ProductModify">수정</button>
		                  <!-- Modal창 띄우기 -->
		                  
		                  <div class="modal fade" id="ProductModify" tabindex="-1" aria-hidden="true">
		                    <div class="modal-dialog modal-dialog-centered" role="document">
		                      <div class="modal-content">
		                        <div class="modal-header">
		                          <h5 class="modal-title" id="modalCenterTitle">🎫상품관리 - 헬스장 이용권</h5>
		                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		                        </div>
		                        <div class="modal-body">
		                          <label for="nameWithTitle" class="form-label">이용권 개월 수</label>
		                          <select id="defaultSelect" name="" class="form-select">
		                            <option disabled selected hidden>등록할 이용권 개월수 선택</option>
		                            <option value="1">1</option>
		                            <option value="2">2</option>
		                            <option value="3">3</option>
		                            <option value="4">4</option>
		                            <option value="5">5</option>
		                            <option value="6">6</option>
		                            <option value="7">7</option>
		                            <option value="8">8</option>
		                            <option value="9">9</option>
		                            <option value="10">10</option>
		                            <option value="11">11</option>
		                            <option value="12">12</option>
		                          </select>
		                          <br><br>
		                          <label for="nameWithTitle" class="form-label">이용권 가격</label>
		                          <input type="text" id="productPrice" class="form-control" placeholder="금액을 입력하세요">
		                        </div>
		                        <div class="modal-footer">
		                          <button type="submit" class="btn btn-primary">확인</button>
		                          <button type="reset" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
		                        </div>
		                      </div>
		                    </div>
		                  </div>
		                </td>
		              </tr>
		             </c:forEach>
		             </c:otherwise>
	             </c:choose>
            </tbody>
          </table>
        </div>
       </div> <br><br><br><br>
       
       
       <!-- 페이징 -->
   		<nav aria-label="Page navigation">
           <ul class="pagination justify-content-center">
           <c:choose>
	           	<c:when test="${pi.currentPage eq 1}">
	                <li class="page-item disabled">
                   	  <a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevrons-left"></i></a>
	                </li>
	            </c:when>
            	<c:otherwise>
		           	 <li class="page-item prev">
	                   <a class="page-link" href="list.ur?cpage=${pi.currentPage - 1}"><i class="tf-icon bx bx-chevrons-left"></i></a>
	                 </li>
            	</c:otherwise>
       		</c:choose>
         
         	<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
               <li class="page-item"><a class="page-link" href="list.ur?cpage=${p}">${p}</a></li>
			</c:forEach>
		
			<c:choose>
				<c:when test="${pi.currentPage eq pi.maxPage}">                                
	               <li class="page-item disabled">
	                   <a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevrons-right"></i></a>
	               </li>
	            </c:when>
	            <c:otherwise>
	            	<li class="page-item next">
	                	<a class="page-link" href="list.ur?cpage=${pi.currentPage + 1}"><i class="tf-icon bx bx-chevrons-right"></i></a>
	            	</li>
	            </c:otherwise>
       		</c:choose>
         </ul>
        </nav>
        
      </div>
     </div>
    </div>
   </div>
  </div>
</div>
</body>
</html>