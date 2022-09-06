<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fitty 신규 직원 등록</title>
<link type="text/css" rel="stylesheet" href="resources/css/attendance.css" />
</head>
<body>
<jsp:include page="../common/header.jsp"/>

        <div class="row">

          <div class="col-md-12">
            <div class="card mb-4 profileEnrollDiv">
              <!-- Account -->
              <div class="card-body">
                <form id="formAccountSettings" action="insert.emp" method="POST">
                  <h5 class="card-header secondHeader" style="margin-bottom: 50px;">🏋️‍♂️ 신규직원 인적정보 작성</h5>
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
                      <input class="form-control" type="text" id="empName" name="empName" placeholder="신규 직원 이름 작성" autofocus required/>
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
                      <input class="form-control" type="text" name="empNo" id="empNo" value="이미입력된사번" readonly/>
                    </div>
                    <div class="mb-3 col-md-6">
                      <label for="empMail" class="form-label">이메일</label>
                      <input class="form-control" type="text" id="empMail" name="empMail" value="이미입력된이메일@example.com" placeholder="john.doe@example.com" readonly/>
                    </div>
                    <div class="mb-3 col-md-6">
                      <label class="form-label" for="empPhone">전화번호</label>
                      <div class="input-group input-group-merge">
                        <input type="text" id="empPhone" name="empPhone" class="form-control" placeholder="전화번호를 입력해주세요" />
                      </div>
                    </div>
                    <div class="mb-3 col-md-6">
                      <label for="empBirth" class="form-label">생년월일</label>
                      <input type="text" class="form-control" id="empBirth" name="empBirth" placeholder="생년월일 8자리를 입력해주세요" />
                    </div>
                  </div>
                  <div class="mt-2 enrollBtnDiv">
                    <button type="submit" class="btn btn-primary me-2">직원등록</button>
                    <button type="button" class="btn btn-secondary me-2" onclick="go('centerAtt.att')">목록으로</button>
                  </div>
                </form>
              </div>
            </div>
            <!-- /Account -->
          </div>
        </div>
      
<script type="text/javascript" src="resources/js/employee.js"></script>
</body>
</html>