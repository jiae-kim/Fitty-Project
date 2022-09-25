<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fitty 회원전체조회</title>
<style>
#userList>tbody>tr:hover{background:aqua; cursor:pointer;}

#sel{
	  width:110px; 
	  font-size:13px; 
	  height:45px;
	  border:1px solid lightgray;
	  border-radius:5px;
}
	
#search{
  width:300px;
  font-size:14px; 
  height:45px;
  border:1px solid lightgray;
  border-top-left-radius:5px;
  border-bottom-left-radius:5px;
  border-right:0px;
}

#s-btn{
  width:35px;
  height:45px;
  border:1px solid lightgray;
  border-top-right-radius:5px;
  border-bottom-right-radius:5px;
  border-left:0px;
}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>

<div class="content-wrapper">
    <div class="container-xxl flex-grow-1 container-p-y" style="padding : 0px;">
        <div class="row">
            <div class="col-xl-12">
                <div class="nav-align-top mb-4">
                    <div class="tab-content" style="height: 750px;">
                        <h5 class="text-muted">🙍‍♀️회원관리 - 회원 조회</h5>
                        <br>
                        <!-- 이용권별 조회 버튼 
                        <div class="btn-group">
                          <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown"  aria-haspopup="true" aria-expanded="false">이용권별조회</button>
                          <ul class="dropdown-menu">
                              <li><h6 class="dropdown-header text-uppercase">조회할 이용권 선택</h6></li>
                              <li><a class="dropdown-item" href="javascript:void(0);">헬스장</a></li>
                              <li><a class="dropdown-item" href="javascript:void(0);">PT</a></li>
                          </ul>
                        </div>
                        -->
                        
                        <!-- 검색 기능 -->
                        <div align="center">
                          <form action="search.ur" method="post">
                          <input type="hidden" name="cpage" value="1">
                          <!-- 검색 카테고리 -->
				          <select class="custom-select" name="condition" id="sel">
		                        <option value="name">이름</option>
		                        <option value="type">이용권</option>
		                    </select>
		                    <!-- 검색 창, 버튼 -->
				          	<input type="text" name="keyword" id="search" value="${keyword}" placeholder="검색 내용을 입력하세요"><button type="submit" id="s-btn" class="btn-primary">
				            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
				            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
				            </svg>
				          </button>
				          </form>
				        </div>
                        <br><br><br>

                        <div class="card row">
                            <div class="table-responsive text-nowrap">
                            <table class="table table-hover" id="userList">
                                <thead>
                                <tr>
                                    <th>이름</th>
                                    <th>회원번호</th>
                                    <th>프로필</th>
                                    <th>전화번호</th>
                                    <th>등록일</th>
                                    <th>만료일</th>
                                    <th>이용권 구분</th>
                                    <th>PT등록 페이지</th>
                                </tr>
                                </thead>

                                <tbody class="table-border-bottom-0">

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
		                                    <td class="no"><span class="badge bg-label-primary me-1">${u.userNo}</span></td>
		                                    <!-- 프로필 -->
		                                    <td>
		                                        <ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
		                                            <li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="${u.userGender}">
		                                            <img src="<c:out value='${u.userProfileUrl}' default='resources/profile_images/defaultProfile.png' />" alt="Avatar" class="rounded-circle" />
		                                            </li>
		                                        </ul>
		                                    </td>
		                                    <!-- 핸드폰번호 -->
		                                    <td>${u.userPhone}</td>
		                                    <!-- 등록일 -->
		                                    <td>${u.userSdate}</td>
		                                    <!-- 만료일 -->
		                                    <c:choose>
		                                    <c:when test="${u.userType eq 'P'}">
		                                    	<td></td>
		                                    </c:when>
		                                    <c:otherwise>
			                                    <td>${u.userEdate}</td>
		                                    </c:otherwise>
		                                    </c:choose>
		                                    <!-- 이용권 구분 -->
		                                    <td>${u.userType}</td>
		                                    <c:choose>
		                                    <c:when test="${u.userType eq 'P' and u.userPt ne 'Y'}">
		                                    	<td><a class="btn rounded-pill btn-info" href="enroll.cl?no=${ u.userNo }">PT 등록</a></td>
		                                    </c:when>
		                                    <c:when test="${u.userType eq 'P' and u.userPt ne 'N'}">
		                                    	<td><button type="button" class="btn rounded-pill btn-secondary" disabled>등록완료</button></td>
		                                    </c:when>
		                                    <c:otherwise>
		                                    	<td></td>
		                                    </c:otherwise>
		                                    </c:choose>
		                                    
	                                    </tr>
	                                    </c:forEach>
	                                    </c:otherwise>
                                    </c:choose>
                                
                                </tbody>
                            </table>
                            <script>
                            	$(function(){
                            		$("#userList>tbody>tr").click(function(){
                            			location.href ='updateForm.ur?no=' + $(this).children(".no").text();
                            		})
                            	})
                            </script>
                            </div>
                        </div>
                        <br><br><br>
                        
                        <!-- 페이징 -->
                        <nav aria-label="Page navigation">
                            <ul class="pagination justify-content-center">
                            <!-- 현재 내가 보고있는 페이지가 1페이지가 아닐경우에만 [이전]버튼 보임 -->
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
	                         
	                         <!-- 반복문 돌려서 페이지 숫자 생성 -->
	                         <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
	                         	<c:choose>
	                         		<c:when test="${empty condition}">
                                		<li class="page-item"><a class="page-link" href="list.ur?cpage=${p}">${p}</a></li>
                                	</c:when>
                                	<c:otherwise>
                                	<!-- 검색하는 경우 페이징 -->
                                		<li class="page-item"><a class="page-link" href="search.ur?cpage=${p}&condition=${condition}&keyword=${keyword}">${p}</a></li>
                                	</c:otherwise>
                                </c:choose>
							</c:forEach>
							
							<!-- 현재 내가 보고있는 페이지가 마지막 페이지가 아닐경우에만 [다음]버튼 보임 -->
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