<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="resources/css/attendance.css" />
</head>
<body>

<jsp:include page="../common/header.jsp"/>

        <div class="row">

          <div class="col-md-12">
            <div class="card mb-4 profileEnrollDiv">
              <!-- Account -->
              <div class="card-body row">
                  <h5 class="card-header secondHeader" style="margin-bottom: 50px;">🏋️‍♂️ 직원 근태 초기회</h5>
                <form class="col-md-6" id="formAccountSettings" action="insert.emp" method="POST" >
                  <div class="row">
	                <div class="d-flex align-items-start align-items-sm-center gap-4">
		               <div class="modalEmpList">
                  	<h6 class="card-header secondHeader" style="margin-bottom: 50px;">🏋️‍♂️ 직원 선택</h6>
							<div class="navbar-nav align-items-left modalSearch">
								<div class="nav-item d-flex align-items-center">
									<i class="bx bx-search fs-4 lh-0"></i>
									<input type="text" class="form-control border-0 shadow-none" placeholder="Search..." aria-label="Search...">
								</div>
							</div>
						    <ul class="empList">
						  		
						    </ul>
							</div>
						</div>
                	</div>
                </form>
                 <form class="col-md-6" id="formAccountSettings" action="insert.emp" method="POST" >
                 	<div class="row">
		                <div class="d-flex align-items-start align-items-sm-center gap-4">
			               <div class="modalEmpList">
	                    	<h6 class="card-header secondHeader" style="margin-bottom: 50px;">🏋️‍♂️ 직원 선택</h6>
								<div class="navbar-nav align-items-left modalSearch">
									<div class="nav-item d-flex align-items-center">
										<i class="bx bx-search fs-4 lh-0"></i>
										<input type="text" class="form-control border-0 shadow-none" placeholder="Search..." aria-label="Search...">
									</div>
								</div>
							    <ul class="empList">
							  		
							    </ul>
							</div>
						</div>
                	</div>
                 </form>
              </div>
            </div>
          </div>
        </div>



<script type="text/javascript" src="resources/js/attendance.js"></script>
<script type="text/javascript" src="resources/js/attendance/resetAttendance.js"></script>
</body>
</html>