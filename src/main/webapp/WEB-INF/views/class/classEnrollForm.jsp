<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
	
          <!-- 내용 감싸는 전체 wrap -->
        <form action="insert.cl" method="post">

          <input type="hidden" name="empNo" value="${loginUser.empNo}">

          
          <div class="content-wrapper">
            <div class="container-xxl flex-grow-1 container-p-y">
              <div class="row">

                <div class="col-md-6">
                  <div class="nav-align-top mb-4">
                    <div class="tab-content" style="height: 759px;">

                      <label style="font-weight:900; font-size: 20px;" align="center">🙍‍♀️ 회원 인적사항</label><br><br>
                     
                      <div class="mb-3 row">
                        <label for="html5-text-input" class="col-md-2 col-form-label">회원번호</label>
                        <div class="col-md-10">
                          <input class="form-control userNo" type="text" id="html5-text-input" />
                        </div>
                      </div>
                      

                      <div class="mb-3 row">
                        <label for="html5-text-input" class="col-md-2 col-form-label">이름</label>
                        <div class="col-md-10">
                          <input class="form-control" type="text" id="html5-text-input" />
                        </div>
                      </div>

                      <div class="mb-3 row">
                        <label for="html5-text-input" class="col-md-2 col-form-label">전화번호</label>
                        <div class="col-md-10">
                          <input class="form-control" type="text" id="html5-text-input" />
                        </div>
                      </div>

                      
                      <div class="mb-3 row">
                        <label for="html5-text-input" class="col-md-2 col-form-label">생년월일</label>
                        <div class="col-md-10">
                          <input class="form-control" type="text" id="html5-text-input" />
                        </div>
                      </div>




                      <br><br>
                      <label style="font-weight:900; font-size: 20px;" align="center">📚 수업등록사항</label><br><br>

                      <div class="mb-3 row">
                        <label for="html5-text-input" class="col-md-2 col-form-label">등록횟수</label>
                        <div class="col-md-10">
                          <input class="form-control" type="text" id="html5-text-input" />
                        </div>
                      </div>

                      <div class="mb-3 row">
                        <label for="html5-text-input" class="col-md-2 col-form-label">운동시작일</label>
                        <div class="col-md-10">
                          <input class="form-control" type="text" id="html5-text-input" />
                        </div>
                      </div>



                    </div>
                  </div>
                </div>


                <div class="col-md-6">
                  <div class="nav-align-top mb-4">
                    <div class="tab-content" style="height: 759px;">

                      <label style="font-weight:900; font-size: 20px;" align="center">✏️ 상담내용</label><br><br>

                      <div class="mb-3 row">
                        <label for="html5-text-input" class="col-md-2 col-form-label">수업목표</label>
                        <div class="col-md-10">
                          <input class="form-control" type="text" id="html5-text-input" />
                        </div>
                      </div>


                      <div class="mb-3 row">
                        <label for="html5-text-input" class="col-md-2 col-form-label">기대결과</label>
                        <div class="col-md-10">
                          <input class="form-control" type="text" id="html5-text-input" />
                        </div>
                      </div>
                      
                      <div class="class-btn">
                      	<button type="reset">취소하기</button>
                      	<button type="submit">등록하기</button>
                      </div>

                    </div>

                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- /내용 감싸는 전체 wrap -->

        </form>
	
	
	
</body>
</html>