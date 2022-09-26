<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.pagination{
justify-content: center;
}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />

	<!-- 내용 감싸는 전체 wrap -->
	<div class="content-wrapper">
	  <div class="container-xxl flex-grow-1 container-p-y" style="padding:0px; margin-top:-25px">
	    <div class="row">
	      <div class="col-xl-12">
	
	        <div class="nav-align-top mb-4">
	          <div class="tab-content" style="height: 758px;" align="center">
	
	            <!-- 내용 넣을 부분 (* 수정해도 되는 부분)-->
	            <label style="font-size:20px; font-weight:600;">내 회원 목록</label><br><br>
	            
	            <div class="tab-pane fade show active" id="navs-pills-justified-home" role="tabpanel" style="height:70%">
	            <div class="card row">
                    <div class="table-responsive text-nowrap" style="padding:20px">
                    <table class="table table-hover" id="userList">
                        <thead align="center">
	                        <tr>
	                        	<th width="5%">수업번호</th>
	                        	<th width="5%">회원번호</th>
	                        	<th width="10%">이름</th>
	                        	<th width="10%">성별</th>
	                        	<th width="10%">생년월일</th>
	                        	<th width="20%">전화번호</th>
	                        	<th width="20%">수업등록일</th>
	                        	<th width="20%">등록횟수</th>
	                        </tr>
                        </thead>

                        <tbody class="table-border-bottom-0 user" align="center">
                        <c:choose>
                        	<c:when test="${not empty list }">
		                        <c:forEach var="c" items="${list}"> 
									<tr>
										<td class="cNo">${c.classNo }</td>
										<td class="no"><span class="badge bg-label-primary me-1">${c.userNo }</span></td>
										<td>${c.userName }</td>
										<td>${c.userGender }</td>
										<td>${c.userBirth }</td>
										<td>${c.userPhone }</td>
										<td>${c.classStartDate }</td>
										<td>${c.classCount }</td>
									</tr>
								</c:forEach>
                        	</c:when>
                        	<c:otherwise>
                        		<tr><td colspan="7">조회 내역이 존재하지 않습니다.</tr>
                        	</c:otherwise>
                        </c:choose>
						</tbody>
					</table>
	            	</div>
            	</div>
            	</div>
            	
            	
            	
            	
            	<script>
            		$(function(){
            			$("#userList>tbody>tr").click(function(){
            				location.href='main.cl?classNo=' + $(this).children(".cNo").text();
            			})
            		})
            	</script>
            	
            	
            	
            	
            	<br><br>
            	
            	<div class="col" style="height:30%">
		        <div class="demo-inline-spacing">
		          <nav aria-label="Page navigation">
		            <ul class="pagination" align="center">
		              <li class="page-item first">
		                <a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevrons-left"></i></a>
		              </li>
		              <li class="page-item prev">
		                <a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevron-left"></i></a>
		              </li>
		              <li class="page-item active">
		                <a class="page-link" href="javascript:void(0);">1</a>
		              </li>
		              <li class="page-item">
		                <a class="page-link" href="javascript:void(0);">2</a>
		              </li>
		              <li class="page-item">
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
		        </div>
		        </div>
	            <!-- / 내용 넣을 부분 -->
	            
	            
	          </div>
	        </div>
		
	      </div>
	    </div>
	  </div>
	</div>
	<!-- /내용 감싸는 전체 wrap -->


</body>
</html>