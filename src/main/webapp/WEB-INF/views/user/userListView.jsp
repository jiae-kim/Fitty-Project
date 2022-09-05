<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fitty 회원전체조회</title>
</head>
<body>
<jsp:include page="../common/header.jsp"/>

<div class="content-wrapper">
    <div class="container-xxl flex-grow-1 container-p-y">
        <div class="row">
            <div class="col-xl-12">
                <div class="nav-align-top mb-4">
                    <div class="tab-content" style="height: 750px;">
                        <h5 class="text-muted">🙍‍♀️회원관리 - 회원 조회</h5>
                        <br>
                        <!-- Dropdown with icon -->
                        <div class="btn-group">
                          <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown"  aria-haspopup="true" aria-expanded="false">이용권별조회</button>
                          <ul class="dropdown-menu">
                              <li><h6 class="dropdown-header text-uppercase">조회할 이용권 선택</h6></li>
                              <li><a class="dropdown-item" href="javascript:void(0);">헬스장</a></li>
                              <li><a class="dropdown-item" href="javascript:void(0);">PT</a></li>
                          </ul>
                        </div>
                        <!--/ Dropdown with icon -->
                        <br><br><br>

                        <!-- Hoverable Table rows -->
                        <div class="card row">
                            <div class="table-responsive text-nowrap">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>이름</th>
                                    <th>회원번호</th>
                                    <th>프로필</th>
                                    <th>성별</th>
                                    <th>등록일</th>
                                    <th>만료일</th>
                                    <th>이용권 구분</th>
                                    <th>PT등록 페이지</th>
                                </tr>
                                </thead>

                                <tbody class="table-border-bottom-0">
                                <tr>
                                <c:choose>
                                	<c:when test="${empty list}">
                                	<tr>
                                		<td colspan="6">현재 등록된 회원이 없습니다.</td>
                                	</tr>
                                	</c:when>
                                	<c:otherwise>
                                		<c:forEach var="u" items="${list}">
                                		<tr>
		                                    <!-- 이름 -->
		                                    <td><i class="fab fa-angular fa-lg text-danger me-3"></i>${u.userName}</td>
		                                    <!-- 회원번호 -->
		                                    <td><span class="badge bg-label-primary me-1">${u.userNo}</span></td>
		                                    <!-- 프로필 -->
		                                    <td>
		                                        <ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
		                                            <li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="Lilian Fuller">
		                                            <img src="" alt="Avatar" class="rounded-circle" />
		                                            </li>
		                                        </ul>
		                                    </td>
		                                    <!-- 성별 -->
		                                    <td>${u.userGender}</td>
		                                    <!-- 등록일 -->
		                                    <td>${u.userSdate}</td>
		                                    <!-- 만료일 -->
		                                    <td>${u.userEdate}</td>
		                                    <!-- 이용권 구분 -->
		                                    <td>${u.userType}</td>
		                                    
		                                    <c:choose>
		                                    <c:when test="${u.userType eq 'P'}">
		                                    <td><button type="button" class="btn rounded-pill btn-info">PT등록</button></td>
		                                    </c:when>
		                                    <c:otherwise>
		                                    	<td><button type="button" class="btn rounded-pill btn-info" disabled>PT등록</button></td>
		                                    </c:otherwise>
		                                    </c:choose>
		                                    
	                                    </tr>
	                                    </c:forEach>
	                                    </c:otherwise>
                                    </c:choose>
                                </tr>
                                </tbody>
                            </table>
                            </div>
                        </div>

                        <br><br><br>
                        <!--/ Hoverable Table rows -->
                        
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