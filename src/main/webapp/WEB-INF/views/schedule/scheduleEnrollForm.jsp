<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fiity 스케줄 등록</title>
</head>
<body>
<jsp:include page="../common/header.jsp"/>

<div class="content-wrapper">
	<div class="container-xxl flex-grow-1 container-p-y" style="padding : 0px;">
    	<div class="row">
      		<div class="col-xl-12">
        		<div class="nav-align-top mb-4">
          			<div class="tab-content" style="height: 700px;">
            		<h5 class="text-muted">📅스케줄관리 - 스케줄 등록</h5>
					<br><br>

					<!--어떤 직원이 어떤 회원과 어떤 수업을 하는지 -->
					<!-- 일정번호 : 등록시 시퀀스 자동 생성 -->

					<!-- 직원사번 -->
					<div class="mb-3 row">
						<label for="html5-text-input" class="col-md-2 col-form-label">사번</label>
						<div class="col-md-3">
							<input class="form-control" type="text" name="clNo" placeholder="사번을 입력하세요" id="html5-tel-input" required />
						</div>
					</div><br>
					
					<!-- 회원번호 -->
					<div class="mb-3 row">
						<label for="html5-tel-input" class="col-md-2 col-form-label">회원번호</label>
						<div class="col-md-3">
							<input class="form-control" type="text" name="userNo" placeholder="수업 대상인 회원번호를 입력하세요" id="html5-tel-input" required />
						</div>
					</div><br>

					<!-- 회원이름 -->
					<div class="mb-3 row">
						<label for="html5-tel-input" class="col-md-2 col-form-label">회원이름</label>
						<div class="col-md-3">
							<input class="form-control" type="text" name="userNo" placeholder="수업 대상인 회원 이름을 입력하세요" id="html5-tel-input" required />
						</div>
					</div><br>

					<!-- 수업번호 -->
					<div class="mb-3 row">
						<label for="html5-tel-input" class="col-md-2 col-form-label">수업번호</label>
						<div class="col-md-3">
							<input class="form-control" type="text" name="userNo" placeholder="진행할 수업번호를 입력하세요" id="html5-tel-input" required />
						</div>
					</div><br>

					<!-- 수업일자 -->
					<div class="mb-3 row">
						<label for="html5-date-input" class="col-md-2 col-form-label">수업일자</label>
						<div class="col-md-3">
							<input class="form-control" type="date" name="bookDate" id="html5-date-input" required />
						</div>
					</div><br>

					<!-- 수업시간 -->
					<div class="mb-3 row">
						<label for="html5-date-input" class="col-md-2 col-form-label">수업시간</label>
						<div class="col-md-3">
							<input class="form-control" type="time" name="bookStime" id="html5-date-input" required />
						</div>
					</div>

					<br><br><br>
					
					<!-- 버튼 -->
					<div class="mb-3" style="text-align: center;">
						<button type="button" class="btn btn-primary" style="display: inline-block;" data-bs-toggle="modal" data-bs-target="#UserEnroll">일정등록</button>
						<!--model창 나오게--> 
						<div class="modal fade" id="UserEnroll" tabindex="-1" aria-hidden="true">
						  <div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
							  <div class="modal-header">
								<h5 class="modal-title" id="modalCenterTitle">📅스케줄관리 - 스케줄 등록</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							  </div>
							  <div class="modal-body" style="text-align: center; font-size: larger; font-weight: bold;">새로운 일정을 등록하시겠습니까?</div>
							  <div class="modal-footer">
								<button type="submit" class="btn btn-primary">확인</button>
								<button type="reset" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
							  </div>
							</div>
						  </div>
						</div>
						<a class="btn btn-secondary" href="list.ca">목록으로</a>
					</div>

          			</div>
        		</div>
      		</div>
    	</div>
	</div>
</div>
</body>
</html>