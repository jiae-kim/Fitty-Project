<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.tab-content {
	    padding: 3rem !important;
	}
	
	.mb-3 label{
		font-size:15px !important;
	}

  #plus:hover{
    background-color: #696cff7d !important;
    cursor: pointer;
  }

	
</style>
</head>
<body>

<!-- 회원조회에서 수업등록으로 넘어갈 때 나타나는 페이지 -->

	<jsp:include page="../common/header.jsp" />
	
	
	<!-- 내용 감싸는 전체 wrap -->
	<form action="insert.cl" method="post">

	<input type="hidden" name="empNo" value="${loginUser.empNo}">

         
	<div class="content-wrapper">
		<div class="container-xxl flex-grow-1 container-p-y" style="padding:0px; margin-top:-25px">
           	<div class="row">

			<div class="col-md-6">
            	<div class="nav-align-top mb-4">
               		<div class="tab-content" style="height: 758px;">


						<label style="font-weight:900; font-size: 20px;" align="center">🙍‍♀️ 회원 인적사항</label><br><br>
	                    
	                   	<div class="mb-3 row">
	                    <label for="html5-text-input" class="col-md-2 col-form-label">회원번호</label>
	                       	<div class="col-md-10">
	                        	<input class="form-control userNo" name="userNo" type="text" id="html5-text-input" value="${u.userNo }" readonly/>
	                       	</div>
	                    </div>
	                     
                     	<div class="mb-3 row">
                       	<label for="html5-text-input" class="col-md-2 col-form-label">이름</label>
	                       	<div class="col-md-10">
	                        	<input class="form-control" type="text" id="html5-text-input" value="${u.userName }" readonly/>
	                       	</div>
                     	</div>

                     	<div class="mb-3 row">
                       	<label for="html5-text-input" class="col-md-2 col-form-label">전화번호</label>
	                       	<div class="col-md-10">
	                         	<input class="form-control" type="text" id="html5-text-input" value="${u.userPhone }" readonly/>
	                       	</div>
                     	</div>

                     	<div class="mb-3 row">
                       	<label for="html5-text-input" class="col-md-2 col-form-label">생년월일</label>
	                       	<div class="col-md-10">
	                        	<input class="form-control" type="text" id="html5-text-input" value="${u.userBirth }" readonly/>
	                       	</div>
						</div><br><br>

                      
                      
                    	<label style="font-weight:900; font-size: 20px;" align="center">📚 수업등록사항</label><br><br>

						<div class="mb-3 row">
						<label for="html5-text-input" class="col-md-2 col-form-label">등록횟수</label>
                        	<div class="col-md-10">
					        	<select class="form-select" name="classCount" id="exampleFormControlSelect1" aria-label="Default select example" required>
						          	<option value="" disabled selected style="display:none"> </option>
						            <option value="10" >10</option>
						            <option value="20">20</option>
						            <option value="30">30</option>
					       		</select>
					        </div>
				        </div>

						<div class="mb-3 row">
                        <label for="html5-text-input" class="col-md-2 col-form-label">운동시작일</label>
                        	<div class="col-md-10">
			            		<input class="form-control" name="classStartDate" type="date" id="html5-date-input">
			            	</div>
						</div>
                      
						<div class="mb-3 row">
						<label for="html5-text-input" class="col-md-2 col-form-label">키</label>
                        	<div class="col-md-10" style="position: relative; display: flex; flex-wrap: wrap; align-items: stretch;">
		                    	<div class="input-group input-group-merge">
					          		<input type="text" name="userHeight" class="form-control" aria-label="Recipient's username" aria-describedby="basic-addon33">
					          		<span class="input-group-text" id="basic-addon33">cm</span>
				        		</div>
                        	</div>
						</div>
                      
						<div class="mb-3 row">
                        <label for="html5-text-input" class="col-md-2 col-form-label">몸무게</label>
                        	<div class="col-md-10" style="position: relative; display: flex; flex-wrap: wrap; align-items: stretch;">
		                    	<div class="input-group input-group-merge">
					          		<input type="text" name="userWeight" class="form-control" aria-label="Recipient's username" aria-describedby="basic-addon33">
					          		<span class="input-group-text" id="basic-addon33">kg</span>
				        		</div>
                        	</div>
						</div>

						</div>
					</div>
				</div>


			<div class="col-md-6">
            	<div class="nav-align-top mb-4">
                	<div class="tab-content" style="height: 759px;">
                	

                   	<label style="font-weight:900; font-size: 20px;" align="center">✏️ 상담내용</label><br><br>

                    <div style="height:80%">
	                    <div class="mb-3 row">
	                    <label for="html5-text-input" class="col-md-3 col-form-label">수업목표</label>
	                        <div class="col-md-9">
	                          <input class="form-control" name="classGoal" type="text" id="html5-text-input" />
	                        </div>
	                    </div>
	
						<div class="mb-3 row input-box">
							<div for='html5-text-input' class='col-md-3 col-form-label' style='padding-right:0px'>
		                       	<label style='width:70%'>기대결과</label>
		                       	<i class='bx bxs-plus-circle' style='font-size:25px; color:purple'></i>
		                    </div>
	                        <div class="col-md-9" style='margin-bottom:15px'>
	                        	<input class="form-control" name="classResult" type="text" />
	                        </div>
	                    </div>
                    </div> 
                      
                      
                    <div class="class-btn" style="margin-bottom: 20px; height: 20%;" align="center">
                    	<button type="reset" class="btn btn-outline-primary" onclick="back()">취소하기</button>
                      	<button type="submit" class="btn btn-primary">등록하기</button>
                    </div>



					<script>
					function back(){
						window.confirm("정말 취소?");
						window.history.back();
					}
					
					
					//기대결과 input 추가
					$(function(){
						$(".bxs-plus-circle").click(function() {
							
							var html = "";
							html += "<div for='html5-text-input' class='col-md-3 col-form-label' style='padding-right:0px'><label style='width:72%'></label>"
							      + "<i class='bx bxs-minus-circle' style='font-size:25px; color:purple'></i></div>"
							      + "<div class='col-md-9' style='margin-bottom:15px'><input class='form-control' name='classResult' type='text' /></div>";
							      
						    $(".input-box").append(html);
						})
					})	
					
					//기대결과 input 삭제
					$(document).on("click", ".bxs-minus-circle", function(){
						
						$(this).parent().next().remove();
						$(this).parent().remove();
						
					})
					
					</script>	
					
					
						
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