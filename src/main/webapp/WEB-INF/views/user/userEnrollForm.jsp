<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fitty 신규회원등록</title>
<style>
  #font {
    font-size: 15px;
  }
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>

<div class="content-wrapper">
<form action="insert.ur" method="post" id="enrollForm" enctype="multipart/form-data">
    <div class="container-xxl flex-grow-1 container-p-y" style="padding : 0px;">
        <div class="row">
            <div class="col-xl-12">
                <div class="nav-align-top mb-4">
                    <div class="tab-content" style="height: 700px; padding-left: 5%;" >
                    <h5 class="text-muted">🙍‍♀️회원관리 - 신규 회원 등록</h5>
                    <br>

                    <!-- 회원번호 : 등록시 시퀀스 자동 생성 -->

                    <!-- 이름 -->
                    <div class="mb-3 row" style="padding-bottom: 10px;">
                      <label for="html5-text-input" class="col-md-2 col-form-label" id="font">이름</label>
                      <div class="col-md-3">
                        <input class="form-control" type="text" name="userName" placeholder="신규 등록 할 회원 이름을 입력하세요" id="html5-text-input" required />
                      </div>
                    </div>

                    <!-- 전화번호 -->
                    <div class="mb-3 row" style="padding-bottom: 10px;">
                      <label for="html5-tel-input" class="col-md-2 col-form-label" id="font">전화번호</label>
                      <div class="col-md-3">
                        <input class="form-control" type="tel" name="userPhone" placeholder="(-) 포함" id="html5-tel-input" required />
                      </div>
                    </div>

                    <!-- 생년월일 -->
                    <div class="mb-3 row" style="padding-bottom: 10px;">
                      <label for="html5-text-input" class="col-md-2 col-form-label" id="font">생년월일</label>
                      <div class="col-md-3">
                        <input class="form-control" type="text" name="userBirth" placeholder="생년월일 6자리" id="html5-text-input" />
                      </div>
                    </div>

                    <!-- 성별 -->
                    <div class="col-md" style="padding-bottom: 20px;">
                      <label for="html5-tel-input" class="col-md-2 col-form-label" id="font">성별</label>

                      <div class="form-check form-check-inline mt-3">
                      <input class="form-check-input" type="radio" name="userGender" id="inlineRadio1" value="F"  required />
                      <label class="form-check-label" for="inlineRadio1">&nbsp;&nbsp;F</label>
                      </div>

                      <div class="form-check form-check-inline">
                      <input class="form-check-input" type="radio" name="userGender" id="inlineRadio2" value="M"  required />
                      <label class="form-check-label" for="inlineRadio2">&nbsp;&nbsp;M</label>
                      </div>
                    </div>

                    <!-- 회원권 구분 -->
                    <div class="col-md" style="padding-bottom: 20px;">
                      <label for="html5-tel-input" class="col-md-2 col-form-label" id="font">회원권 구분</label>
                        <input class="form-check-input defaultRadio" type="radio" name="userType" value="H" required />
                        <label class="form-check-label" for="defaultRadio1">&nbsp;&nbsp;헬스장 이용권</label>
                        &nbsp;&nbsp;&nbsp;
                        <input class="form-check-input defaultRadio" type="radio" name="userType" value="P" required />
                        <label class="form-check-label" for="defaultRadio1">&nbsp;&nbsp;PT 이용권</label>
                    </div>

                    <script>
                      $(function(){
                        $('.defaultRadio').change(function(){
                          var result = $(".defaultRadio:checked").val();
                          console.log(result);
                          if(result == 'H') {
                            $('#selectBox').show();
                          }else {
                            $('#selectBox').hide();
                          }
                        })
                      })
                    </script>
        
                    <!-- 등록일 -->
                    <div class="mb-3 row" style="padding-bottom: 10px;">
                      <label for="html5-date-input" class="col-md-2 col-form-label" id="font">등록일</label>
                      <div class="col-md-3">
                        <input class="form-control" type="date" name="userSdate" id="html5-date-input" required />
                      </div>
                    </div>

                    <!-- 이용 개월 -->
                    <div class="mb-3 row" id="selectBox" style="padding-bottom: 10px;">
                      <label for="html5-date-input" class="col-md-2 col-form-label" id="font">이용 개월</label>
                      <div class="col-md-3">
                        <select id="defaultSelect" name="userMonth" class="form-select" required>
                          <option disabled selected hidden>헬스장 이용 개월 선택</option>
                          <c:forEach var="p" items="${product}">
                            <option value="${p.proMonth}">${p.pro}</option>
                          </c:forEach>
                        </select>
                      </div>
                    </div>
                    
                    <!-- 프로필 -->
                    <div class="mb-3 row" style="padding-bottom: 10px;">
                      <label for="formFile" class="col-md-2 col-form-label" id="font">회원 프로필</label>
                      <div class="col-md-3">
                      <input class="form-control" type="file" name="upfile" id="formFile" />
                      </div>
                    </div><br>
                        
                    <!-- 버튼 -->
                    <div class="mb-3" style="text-align: center;">
                      <button type="button" class="btn btn-primary" style="display: inline-block;" data-bs-toggle="modal" data-bs-target="#UserEnroll">회원등록</button>
                      <!--model창 나오게--> 
                      <div class="modal fade" id="UserEnroll" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title" id="modalCenterTitle">🙍‍♀️회원관리 - 신규 회원 등록</h5>
                              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            </div>
                            <div class="modal-body" style="text-align: center; font-size: larger; font-weight: bold;">신규회원 등록이 완료되었습니다</div>
                            <div class="modal-footer">
                              <button type="submit" class="btn btn-primary">확인</button>
                              <button type="reset" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
                            </div>
                          </div>
                        </div>
                      </div>
                      <a class="btn btn-secondary" href="list.ur">목록으로</a>
                    </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
</div>
          
</body>
</html>