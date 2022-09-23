<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fitty 헬스장 이용권</title>
<style>
	option:disabled{
		background:lightgray;
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
          <div class="tab-content" style="height: 700px;">
            <h5 class="text-muted" style="padding-top: 3%;">🎫상품관리 - 헬스장이용권</h5>
            <div class="btn-group2" style="float: right; display: inline-block;">
            <!-- 등록 버튼 -->
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#ProductEnroll">이용권 등록</button>
            <!-- 이용권 등록 Modal -->
            <div class="modal fade" id="ProductEnroll" tabindex="-1" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="modalCenterTitle">🎫상품관리 - 헬스장 이용권</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  </div>
                  <form action="insert.pr" method="post" id="enrollForm">
                  <div class="modal-body">
                  
                    <label for="nameWithTitle" class="form-label">이용권 개월 수</label>
                    <select id="defaultSelect" name="pro" class="form-select" required>
                      <option disabled selected hidden>등록할 이용권 개월수 선택</option>
					 	<c:forEach var="p" items="${month}">
	                      <c:choose>
	                      	<c:when test="${p.proMonth eq p.month}">
	                      		<option value="${p.proMonth}" disabled>${p.proMonth}개월 이용권</option>
	                      	</c:when>
	                      	<c:otherwise>
								<option value="${p.month}">${p.month}개월 이용권</option>
	                      	</c:otherwise>
	                      </c:choose>
	                    </c:forEach>
                    </select><br><br>
                    
                    <label for="nameWithTitle" class="form-label">이용권 가격</label>
                    <input type="text" name="proPrice" id="number" class="form-control" placeholder="금액을 입력하세요" required>
                    <!-- 금액 입력 시 자동으로 천단위 콤마 찍어줌 -->
                    <script type="text/javascript">
                      const input = document.querySelector('#number');
                      input.addEventListener('keyup', function(e){
                        let value = e.target.value;
                        value = Number(value.replaceAll(',', ''));
                        const formatValue = value.toLocaleString('ko-KR');
                        input.value = formatValue;
                      })
                    </script>
                  </div>
                  <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">확인</button>
                    <button type="reset" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
                  </div>
                  </form> 
                </div>
              </div>
            </div>

            <!-- 삭제 버튼 -->
            <button type="button" class="btn btn-danger" onclick="deletePro();">이용권 삭제</button>
            
            <script>
            	// 체크박스 전체선택
            	function checkAll() {
            		if($("#choiceAll").is(':checked')) {
            			$("#proListTBody :checkbox").prop("checked", true);
            		}else {
            			$("#proListTBody :checkbox").prop("checked", false);
            		}
            	}
            </script>
            
            <script>
            	// 삭제버튼 클릭시 실행
	            function deletePro(){
	        		// 체크된 요소가 있는지 확인
	        		let $checked = $(".ckPro:checked"); // 체크상태인 체크박스 요소들 
	        		
	        		// 체크하지 않은 경우
	        		if($checked.length < 1){
	        			alertify.alert("📌 삭제할 이용권을 선택해주세요 📌").set('basic', true);
	        			return false;
	        		}else {
	        			// 선택한 경우
	        			if(confirm("선택한 이용권을 삭제하시겠습니까?")){
	        				let checkArr = [];
	        				
	        				$checked.each(function(){
	        					checkArr.push($(this).val());
	        				}); // [1, 2]
	        				
	        				const ckPro = checkArr.toString(); // "1,2"
	        				//console.log(ckPro);
	        				
	        				$.ajax({
	        					url:"delete.pr",
	        					data:{ckPro : ckPro},
	        					success: function(result){
	        						if(result == 'success'){
	        							alertify.alert("✔ 성공적으로 헬스장 이용권이 삭제되었습니다 ✔").set('basic', true);
	        							location.reload();
	        						}
	        					},
	        					error: function(){
	        						alertify.alert("❌ 헬스장 이용권 삭제에 실패했습니다 ❌\n다시 시도해주세요".set('basic', true));
	        						console.log("헬스장 이용권 삭제 ajax통신 실패");
	        					}
	        				})
	        				
	        			}
	        		}
	        	}
            </script>
          </div>
          <br><br><br><br>

          <div class="card">
            <div class="table-responsive text-nowrap">
            <table class="table">
              <thead class="table-light">
                <tr>
                  <th><input type="checkbox" name="choiceAll" id="choiceAll" onclick="checkAll();"></th>
                  <th>이용권 번호</th>
                  <th>이용권</th>
                  <th>가격(원)</th>
                  <th>이용권 수정</th>
                </tr>
              </thead>
              <tbody class="table-border-bottom-0" id="proListTBody">
              
              <c:choose>
              	<c:when test="${empty list}">
              	<tr>
              		<td colspan="6">현재 등록된 헬스장 이용권이 없습니다.</td>
              	</tr>
              	</c:when>
              	<c:otherwise>
            		<c:forEach var="p" items="${list}">
		              <tr>
		              	<!-- 체크박스 버튼 -->
		                <td><input type="checkbox" class="ckPro" value="${p.proNo}" id="${p.proNo}"></td>
		                <!-- 이용권 번호 -->
		                <td><i class="fab fa-react fa-lg text-info me-3"></i>${p.proNo}</td>
		                <!-- 이용권 -->
		                <td>${p.pro}</td>
		                <!-- 이용권 금액 -->
		                <td>${p.proPrice}</td>
                	    <!-- 수정 버튼 -->
		                <td>
		                  <button type="button" class="btn rounded-pill btn-outline-warning" data-bs-toggle="modal" data-bs-target="#ProductModify${p.proNo}">수정</button>
		                  <!-- 수정 Modal창 띄우기 -->
		                  <div class="modal fade" id="ProductModify${p.proNo}" tabindex="-1" aria-hidden="true">
	                        <div class="modal-dialog modal-dialog-centered" role="document">
	                          <div class="modal-content">
	                            <div class="modal-header">
	                              <h5 class="modal-title" id="modalCenterTitle">🎫상품관리 - 헬스장 이용권</h5>
			                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			                        </div>
			                        <!-- form 자리 -->
		                            <form action="update.pr" method="post" id="postForm">
		                            <!-- 이용권 번호 넘기기 -->
				                 	 <input type="hidden" name="proNo" value="${p.proNo}">
				                        <div class="modal-body">
					                      <label for="nameWithTitle" class="form-label">이용권 개월 수</label>
					                      <input type="text" name="pro" value="${p.pro}" class="form-control" readonly>
					                      <br>
			                              <label for="nameWithTitle" class="form-label">이용권 가격</label>
			                              <input type="text" name="proPrice" value='${ p.proPrice }' id="number2" class="form-control price" required>
			                              	<!-- 금액 입력 시 자동으로 천단위 콤마 찍어줌 -->
						                    <script>
						                      $(".price").keyup(function(){
						                    	  let value = $(this).val();
						                    	  value = Number(value.replaceAll(',', ''));
							                      const formatValue = value.toLocaleString('ko-KR');
							                      $(this).val(formatValue);
						                      })
						                    </script>
				                        </div>
				                        <div class="modal-footer">
				                          <button type="submit" class="btn btn-primary">확인</button>
				                          <button type="reset" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
				                        </div>
				                  	<!-- form 닫는 자리 -->
          							</form>
			                      </div>
			                    </div>
		                  </div>
		                </td>
		              </tr>
		             </c:forEach>
		             </c:otherwise>
	             </c:choose>
            </tbody>
          </table>
        </div>
       </div> <br><br>
       
       <!-- 페이징 -->
   		<nav aria-label="Page navigation">
           <ul class="pagination justify-content-center">
           <c:choose>
	           	<c:when test="${pi.currentPage eq 1}">
	                <li class="page-item disabled">
                   	  <a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevrons-left"></i></a>
	                </li>
	            </c:when>
            	<c:otherwise>
		           	 <li class="page-item prev">
	                   <a class="page-link" href="list.pr?cpage=${pi.currentPage - 1}"><i class="tf-icon bx bx-chevrons-left"></i></a>
	                 </li>
            	</c:otherwise>
       		</c:choose>
         
         	<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
               <li class="page-item"><a class="page-link" href="list.pr?cpage=${p}">${p}</a></li>
			</c:forEach>
		
			<c:choose>
				<c:when test="${pi.currentPage eq pi.maxPage}">                                
	               <li class="page-item disabled">
	                   <a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevrons-right"></i></a>
	               </li>
	            </c:when>
	            <c:otherwise>
	            	<li class="page-item next">
	                	<a class="page-link" href="list.pr?cpage=${pi.currentPage + 1}"><i class="tf-icon bx bx-chevrons-right"></i></a>
	            	</li>
	            </c:otherwise>
       		</c:choose>
         </ul>
        </nav>
        
      </div>
     </div>
    </div>
   </div>
  </div>
</div>
</body>
</html>