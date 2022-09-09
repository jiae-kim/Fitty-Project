<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.mb-3 label, .card-header{
          color: #696CFF;
          font-weight: 600;
        }

        .btnDiv{
          display: flex;
        }

        .btnDiv {
          align-items: center;
          margin: auto;
          margin-top:40px;
          justify-content: center;
        }

        .profileDiv{
          height: 759px;
        }

        .secondHeader{
          margin-top: 50px;
          margin-bottom: 30px;
        }
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	 <div class="content-wrapper">
      <div class="container-xxl flex-grow-1 container-p-y" style="padding:0px">
        <div class="row">

          <div class="col-xl-12">

            <div class="nav-align-top mb-4">

              <div class="tab-content">
                <div class="tab-pane fade show active" id="navs-pills-justified-home" role="tabpanel">
                  <div style="height : 20px"></div>
                  
                  <h3>기구 점검 작성</h3>
                  
                  <form action="ckInsert.mc" method="post" enctype="multipart/form-data">
                  	<input type="hidden" name="empNo" value="${ loginUser.empNo}">
                    <br>
                    <table>
                      <tr>
                        <tr>
                          <td rowspan="4" style="padding-right:40px;">
                            <img src="resources/images/basicImg.jpg" alt="user-avatar" class="d-block rounded" height="350" width="350" id="uploadedAvatar">
                          </td>
                          <td width="100%">
                            <div class="mb-3">
                              <label for="formFile" class="form-label">첨부파일</label>
                              <input class="form-control" type="file" id="formFile" name="upfile" onchange="loadImg(this);">
                            </div>
                            
                            <script>
                            	function loadImg(inputFile){
                            		console.log(inputFile);
                            		if(inputFile.files.length == 1){
                            			const reader = new FileReader();
                            			
                            			reader.readAsDataURL(inputFile.files[0])
                            			
                            			reader.onload = function(e){
                            				$("#uploadedAvatar").attr("src", e.target.result);
                            			}
                            		}else{
                            			$("#uploadedAvatar").attr("src", "resources/images/basicImg.jpg");
                            		}
                            	}
                            </script>
                            
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="mb-3">
                              <label for="defaultFormControlInput" class="form-label">점검 기구</label>
                              <select class="form-select" id="exampleFormControlSelect1" aria-label="Default select example" name="mcNo">
                              	<c:forEach var="m" items="${ list }">
                                	<option value="${ m.mcNo }">${ m.mcName }</option>
                                </c:forEach>
                              </select>
                            </div>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="mb-3">
                              <label for="defaultFormControlInput" class="form-label">점검 제목</label>
                              <input type="text" class="form-control" id="defaultFormControlInput" name="ckTitle" placeholder="점검 제목을 입력하세요" required>
                            </div>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="mb-3">
                              <label for="defaultFormControlInput" class="form-label">점검 내용</label>
                              <textarea class="form-control" id="exampleFormControlTextarea1" name="ckContent" rows="6" style="resize:none; height:100px;" required></textarea>
                            </div>
                          </td>
                        </tr>

                    </table>

                    <br><br>

                    <div class="mt-2 btnDiv">
                      <button type="submit" class="btn btn-primary me-2">등록하기</button>
                      <a type="button" class="btn btn-secondary me-2" href="ckList.mc">이전으로</a>
                    </div>

                    <br>


                  </form>

              
                </div>
              </div>
            </div>
          </div>
            

        </div>
      </div>
      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->
</body>
</html>