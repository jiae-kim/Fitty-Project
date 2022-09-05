<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fitty 신규 직원 등록</title>
<link type="text/css" rel="stylesheet" href="resources/css/attendance.css" />
<script type="text/javascript" src="resources/js/attendance.js"></script>
</head>
<body>
<jsp:include page="../common/header.jsp"/>

        <div class="row">

          <div class="col-md-12">
            <div class="card mb-4 profileEnrollDiv">
              <h5 class="card-header secondHeader">🏋️‍♂️ 프로필 사진 등록</h5>
              <!-- Account -->
              <div class="card-body">
                <div class="d-flex align-items-start align-items-sm-center gap-4">
                  <img src="resources/bootTemplate/sneat-1.0.0/assets/img/avatars/1.png" alt="user-avatar" class="d-block rounded" height="70" width="70" id="uploadedAvatar" />
                  <div class="button-wrapper">
                      <button type="button" class="btn btn-outline-primary">프로필사진 등록</button>
                      <input type="file" id="upload" class="account-file-input" hidden accept="image/png, image/jpeg" />
                    </label>
                  </div>
                </div>
              </div>
              <hr class="my-0">
              <!-- Account -->
              <div class="card-body">
                <form id="formAccountSettings" method="POST" onsubmit="return false">
                  <h5 class="card-header secondHeader" style="margin-bottom: 50px;">🏋️‍♂️ 신규직원 인적정보 작성</h5>
                  <div class="row">
                    <div class="mb-3 col-md-6">
                      <label for="firstName" class="form-label">이름</label>
                      <input class="form-control" type="text" id="firstName" name="firstName" value="신규 직원 이름 작성" autofocus required/>
                    </div>
                    <div class="mb-3 col-md-3">
                      <label for="organization" class="form-label">직급</label>
                      <div style="height : 10px"></div>
                      <input class="form-check-input"  type="radio" name="trainer" value="trainer">트레이너&nbsp&nbsp&nbsp&nbsp&nbsp
                      <input class="form-check-input"  type="radio" name="admin" value="admin">관리자
                    </div>
                    <div class="mb-3 col-md-3">
                      <label for="organization" class="form-label">성별</label>
                      <div style="height : 10px"></div>
                      <input class="form-check-input"  type="radio" name="gender" value="M">남자&nbsp&nbsp&nbsp&nbsp&nbsp
                      <input class="form-check-input"  type="radio" name="gender" value="F">여자
                    </div>
                    <div class="mb-3 col-md-6">
                      <label for="lastName" class="form-label">사번</label>
                      <input class="form-control" type="text" name="lastName" id="lastName" value="이미입력된사번" readonly/>
                    </div>
                    <div class="mb-3 col-md-6">
                      <label for="email" class="form-label">이메일</label>
                      <input class="form-control" type="text" id="email" name="email" value="이미입력된이메일@example.com" placeholder="john.doe@example.com" readonly/>
                    </div>
                    <div class="mb-3 col-md-6">
                      <label class="form-label" for="phoneNumber">전화번호</label>
                      <div class="input-group input-group-merge">
                        <input type="text" id="phoneNumber" name="phoneNumber" class="form-control" placeholder="전화번호를 입력해주세요" />
                      </div>
                    </div>
                    <div class="mb-3 col-md-6">
                      <label for="address" class="form-label">생년월일</label>
                      <input type="text" class="form-control" id="birth" name="birth" placeholder="생년월일 8자리를 입력해주세요" />
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
      

</body>
</html>