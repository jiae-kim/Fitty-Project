<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fitty 회원상세조회</title>
<style>
#profileImgFile{
	width:150px;
	height:150px;
	border:1px solid lightgray;
	border-radius: 50%;
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
                    <div class="tab-content" style="height: 850px;">
                        <h5 class="text-muted">🙍‍♀️회원관리 - 상세페이지</h5>
						<form action="update.ur" id="updateForm" method="post" enctype="multipart/form-data">
                         <!-- 회원번호 -->
                        <div class="mb-3 row">
                          <label for="html5-text-input" class="col-md-2 col-form-label">회원번호</label>
                          <div class="col-md-3">
                            <input class="form-control" type="text" name="userNo" value="${u.userNo}" id="html5-text-input" readonly/>
                          </div>
                        </div>

                        <!-- 이름 (변경가능) -->
                        <div class="mb-3 row">
                          <label for="html5-text-input" class="col-md-2 col-form-label">이름</label>
                          <div class="col-md-3">
                            <input class="form-control" type="text" name="userName" value="${u.userName}" id="html5-text-input" />
                          </div>
                        </div>

                        <!-- 전화번호 (변경가능) -->
                        <div class="mb-3 row">
                          <label for="html5-tel-input" class="col-md-2 col-form-label">전화번호</label>
                          <div class="col-md-3">
                            <input class="form-control" type="tel" name="userPhone" value="${u.userPhone}" id="html5-tel-input" />
                          </div>
                        </div>

                        <!-- 생년월일 (변경가능) -->
                        <div class="mb-3 row">
                          <label for="html5-text-input" class="col-md-2 col-form-label">생년월일</label>
                          <div class="col-md-3">
                            <input class="form-control" type="text" name="userBirth" value="${u.userBirth}" id="html5-text-input" />
                          </div>
                        </div>

                        <!-- 성별 -->
                        <div class="col-md">
                          <label for="html5-tel-input" class="col-md-2 col-form-label">성별</label>
                          <div class="form-check form-check-inline mt-3">
	                          <input type="radio" name="userGender" value="F" id="F" class="form-check-input" readonly />
	                          <label class="form-check-label" for="inlineRadio1">&nbsp;&nbsp;F</label>
                          </div>
                          <div class="form-check form-check-inline">
	                          <input type="radio" name="userGender" value="M" id="M" class="form-check-input" readonly />
	                          <label class="form-check-label" for="inlineRadio2">&nbsp;&nbsp;M</label>
                          </div>
                        <script>
							$(function(){
								$("input[value=${u.userGender}]").attr("checked", true);
							})
                        </script>
                        </div> <br>
                        

                        <!-- 회원권 구분 (변경가능) -->
                        <div class="col-md">
                          <label for="html5-tel-input" class="col-md-2 col-form-label">회원권 구분</label>
                            <input type="radio" name="userType" value="H"  id="H" class="form-check-input" />
                            <label class="form-check-label" for="defaultRadio1">&nbsp;&nbsp;헬스장 이용권</label>
                          &nbsp;&nbsp;&nbsp;
                            <input type="radio" name="userType" value="P" id="P" class="form-check-input" />
                            <label class="form-check-label" for="defaultRadio1">&nbsp;&nbsp;PT 이용권</label>
                        <script>
	                        $(function(){
								$("input[value=${u.userType}]").attr("checked", true);
							})
                        </script>
                        </div> <br>
                        
	
                        <!-- 등록일 -->
                        <div class="mb-3 row">
                          <label for="html5-date-input" class="col-md-2 col-form-label">등록일</label>
                          <div class="col-md-3">
                            <input class="form-control" type="date" name="userSdate" value="${u.userSdate}" id="html5-date-input" readonly />
                          </div>
                        </div>

                        <!-- 이용 개월 (변경가능) -->
                        <div class="mb-3 row">
                          <label for="html5-date-input" class="col-md-2 col-form-label">이용 개월</label>
                          <div class="col-md-3">
                            <select id="month" name="userMonth" value="${u.userMonth}" class="form-select" >
                              <option disabled selected hidden>이용 개월 선택</option>
                       		  <option value="1">1개월</option>
                              <option value="3">3개월</option>
                              <option value="6">6개월</option>
                              <option value="9">9개월</option>
                              <option value="12">12개월</option>
                            </select>
                            <script>
                            	$(function(){
                            		$("#month option").each(function(){
                            			if($(this).val() == "${u.userMonth}") {
                            				$(this).attr("selected", true);
                            			}
                            		})
                            	})
                            </script>
                          </div>
                        </div>

                        <!-- 만료일 -->
                        <div class="mb-3 row">
                          <label for="html5-text-input" class="col-md-2 col-form-label">만료일</label>
                          <div class="col-md-3">
                            <input class="form-control" type="text" name="userEdate" value="${u.userEdate}" id="html5-text-input" readonly />
                          </div>
                        </div>

                        <!-- 프로필 (변경가능) -->
						<div class="mb-3 row">
						  <label for="formFile" class="col-md-2 col-form-label">회원 프로필</label>
						  <div class="col-md-3">
							<input type="file" id="profileImgFile" style="display:none;">
							<c:choose>
							<c:when test="${empty u.userProfileUrl}">
								<img id="profileImgFile" src='resources/profile_images/defaultProfile.png' onclick="$('#profileImgFile').click();">
							</c:when>
							<c:otherwise>
								<input type="hidden" name="userProfileUrl" value="${u.userProfileUrl}">
								<img id="profileImgFile" src="<c:out value='${u.userProfileUrl}' />" onclick="$('#profileImgFile').click();">
							</c:otherwise>
							</c:choose>
						  </div>
						</div>
						
						<script>
							$(function(){
								$("#profileImgFile").change(function(){
									//let pif = $('#profileImgFile');
									let formData = new FormData();
									let uploadFile = this.files[0]
									console.log(uploadFile);
									
									formData.append("uploadFile", uploadFile);
									formData.append("userNo", "${u.userNo}");
									formData.append("originalFile", "${u.userProfileUrl}"); 
									
								$.ajax({
									url:"uploadProfile.ur",
									data:formData,
									processData: false,
									contentType: false,
									type:"POST",
									success:function(u){
										location.reload();
									},
									error:function(){
										console.log("회원 프로필 이미지 등록을 위한 ajax 통신 실패");
									}
								})
								})
							})
						</script><br><br>
                       
						 
                        <!-- 버튼 -->
                        <div class="mb-3" style="text-align: center;">
                            <!-- 회원수정 버튼 -->
                            <button type="button" class="btn btn-warning" style="display: inline-block;" data-bs-toggle="modal" data-bs-target="#UserModify">회원수정</button>
                            <!-- 수정 model창 나오게--> 
                            <div class="modal fade" id="UserModify" tabindex="-1" aria-hidden="true">
                              <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                  <div class="modal-header">
                                    <h5 class="modal-title" id="modalCenterTitle">🙍‍♀️회원관리 - 상세조회</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                  </div>
                                  <div class="modal-body" style="text-align: center; font-size: larger; font-weight: bold;">회원정보를 수정하시겠습니까?</div>
                                  <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">확인</button>
                                    <button type="reset" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
                                  </div>
                                </div>
                              </div>
                            </div>
                            
                            <!-- 회원삭제 버튼 -->
                            <button type="button" class="btn btn-danger" style="display: inline-block;" data-bs-toggle="modal" data-bs-target="#UserDelete">회원삭제</button>
                            <!-- 삭제 model창 나오게 -->
                            <div class="modal fade" id="UserDelete" tabindex="-1" aria-hidden="true">
                              <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                  <div class="modal-header">
                                    <h5 class="modal-title" id="modalCenterTitle">🙍‍♀️회원관리 - 상세조회</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                  </div>
                                  <div class="modal-body" style="text-align: center; font-size: larger; font-weight: bold;">회원정보를 삭제하시겠습니까?</div>
                                  <div class="modal-footer">
                                    <button type="button" class="btn btn-primary" onclick="postFormSubmit('delete.ur');">확인</button>
                                    <button type="reset" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
                                  </div>
                                </div>
                              </div>
                            </div>
                            
                            <script>
                            	function postFormSubmit(url) {
                            		$("#postForm").attr("action", url).submit();
                            	}
                            </script>
                            
                            <!-- 목록 버튼 -->
                            <a class="btn btn-secondary" href="list.ur">목록으로</a>
                        </div>
                        </form>
                    </div>
                </div>
                <!-- 회원 삭제시 전달값 : 회원번호, 파일 저장 위치 -->
                <form id="postForm" action="" method="post">
                	<input type="hidden" name="userNo" value="${u.userNo}">
                	<input type="hidden" name="filePath" value="${u.userProfileUrl}">
                </form>
            </div>
        </div>
    </div>
</div>


</body>
</html>