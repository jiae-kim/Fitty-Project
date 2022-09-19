<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fitty 예약 상세조회</title>
</head>
<body>
	<!-- 회원 페이지 : 예약 상세조회용 모달 (별도의 JSP임)/ 조회, 수정, 삭제 기능 -->
	<!-- 예약 상세조회 Modal : 로그인한 회원의 정보 / 어떤 직원과 어떤 수업을 언제(날짜, 시간)-->
          <form action="" method="post" id="t">
          <div class="modal-body" id="myModall">
          	<input type="hidden" name="bookNo" value="${b.bookNo}">
          	<!-- 담당 트레이너 -->
          	<div class="mb-4 row">
				<label for="html5-date-input" class="col-md-5 col-form-label" id="font">담당 트레이너</label>
				<div class="col-md-6">
					<input class="form-control" type="date" name="empName" value="${b.empName}" id="html5-date-input" readonly />
				</div>
			</div>
          	
          	<!-- 수업일자 (변경가능) -->
			<div class="mb-4 row">
				<label for="html5-date-input" class="col-md-5 col-form-label" id="font">예약 날짜</label>
				<div class="col-md-6">
					<input class="form-control" type="date" name="bookDate" value="${b.bookDate}" id="html5-date-input" />
				</div>
			</div>
			
			<!-- 수업 시작 시간 (변경가능) -->
			<div class="mb-4 row">
				<label for="html5-date-input" class="col-md-5 col-form-label" id="font">수업 시작 시간</label>
				<div class="col-md-6">
					<input class="form-control" type="time" name="bookStime" value="${b.bookStime}" id="html5-date-input" />
				</div>
			</div>
			
			<!-- 수업 종료 시간 (변경가능) -->
			<div class="mb-4 row">
				<label for="html5-date-input" class="col-md-5 col-form-label" id="font">수업 종료 시간</label>
				<div class="col-md-6">
					<input class="form-control" type="time" name="bookEtime" value="${b.bookEtime}" id="html5-date-input" />
				</div>
			</div>
            </div>
            <div class="modal-footer" style="text-align: center;">
              <button type="submit" class="btn btn-primary">예약변경</button>
              <button type="submit" class="btn btn-warning">예약취소</button>
              <a class="btn btn-secondary" href="list.sc">목록으로</a>
            </div>
            </form> 
            
</body>
</html>