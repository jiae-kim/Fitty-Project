<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Profile</title>
<link type="text/css" rel="stylesheet" href="resources/css/attendance.css" />
</head>
<body>
<jsp:include page="../common/header.jsp"/>

        <div class="row">

          <div class="col-md-12">
            <div class="card mb-4 profileEnrollDiv">
              <!-- Account -->
              <div class="card-body">
                <form id="formAccountSettings" action="update.emp" method="POST">
                  <h5 class="card-header secondHeader" style="margin-bottom: 50px;">🏋️‍♂️ My Profile</h5>
                  <div class="row">
	                <div class="d-flex align-items-start align-items-sm-center gap-4">
	                  <c:choose>
	                  	<c:when test="${empty e.empPhoto }">
	                  		<img  id="roundPhoto" src='resources/profile_images/defaultProfile.png' onclick="$('#empPhoto').click();" >
	                  	</c:when>
	                  	<c:otherwise>
	                  		<input type="hidden"  name="empPhoto" value="${ e.empPhoto }">
	                  		<img  id="roundPhoto" src='${ e.empPhoto }' onclick="$('#empPhoto').click();" >
	                  	</c:otherwise>
	                  </c:choose>
                	  <input type="file" id="empPhoto" style="display:none;" name="empPhoto">
	                </div>
                    <div class="mb-3 col-md-6">
                      <label for="empName" class="form-label">이름</label>
                      <input class="form-control" type="text" id="empName" value="${loginUser.empName }" name="empName" placeholder="이름" autofocus required/>
                    </div>
                    <div class="mb-3 col-md-3">
                      <label for="empGrade" class="form-label">직급</label>
                      <div style="height : 10px"></div>
                      <input class="form-check-input"  type="radio" name="empGrade" value="T">트레이너&nbsp&nbsp&nbsp&nbsp&nbsp
                      <input class="form-check-input"  type="radio" name="empGrade" value="A">관리자
                    </div>
                    <div class="mb-3 col-md-3">
                      <label for="empGender" class="form-label">성별</label>
                      <div style="height : 10px"></div>
                      <input class="form-check-input"  type="radio" name="empGender" value="M">남자&nbsp&nbsp&nbsp&nbsp&nbsp
                      <input class="form-check-input"  type="radio" name="empGender" value="F">여자
                    </div>
                    <div class="mb-3 col-md-6">
                      <label for="empNo" class="form-label">사번</label>
                      <input class="form-control" type="text" name="empNo" id="empNo" value="${ loginUser.empNo }" readonly/>
                    </div>
                         <c:if test="${ not empty loginUser.empGrade }">
                    	<script>
                    		$(function(){
								$("input[value=${loginUser.empGrade}]").attr("checked", true);                  			
                    		})
                    		
                    	</script>
                    	
                    </c:if>
                    
                    <c:if test="${ not empty loginUser.empGender }">
                    	<script>
                    		$(function(){
								$("input[value=${loginUser.empGender}]").attr("checked", true);                  			
                    		})
                    		
                    	</script>
                    	
                    </c:if>
                    
                    <div class="mb-3 col-md-6">
                      <label for="empMail" class="form-label">이메일</label>
                      <input class="form-control" type="text" id="empMail" name="empMail" value="${ loginUser.empMail }" readonly/>
                    </div>
                    <div class="mb-3 col-md-6">
                      <label class="form-label" for="empPhone">전화번호</label>
                      <div class="input-group input-group-merge">
                        <input type="text" id="empPhone" name="empPhone" class="form-control"  value="${ loginUser.empPhone }" />
                      </div>
                    </div>
                    <div class="mb-3 col-md-6">
                      <label for="empBirth" class="form-label">생년월일</label>
                      <input type="text" class="form-control" id="empBirth" name="empBirth" value="${ loginUser.empBirth }"  />
                    </div>
                  </div>
                  <div class="mt-2 enrollBtnDiv">
                    <button type="submit" class="btn btn-primary me-2">수정하기</button>
                    <button type="button" class="btn btn-secondary me-2" onclick="go('login.emp')">목록으로</button>
                  </div>
                </form>
              </div>
            </div>
            <!-- /Account -->
          </div>
        </div>
      
<!-- <script type="text/javascript" src="resources/js/employee.js"></script> -->
</body>
</html>