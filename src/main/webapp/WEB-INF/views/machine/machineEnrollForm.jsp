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

	<jsp:include page="../common/header.jsp"/>
	
	<div class="content-wrapper">
      <div class="container-xxl flex-grow-1 container-p-y">
        <div class="row">

          <div class="col-xl-12">

            <div class="nav-align-top mb-4">

              <div class="tab-content">
                <div class="tab-pane fade show active" id="navs-pills-justified-home" role="tabpanel">
                  <div style="height : 20px"></div>
                  
                  <h3>기구 등록</h3>

                  <form id="enrollForm" method="post" action="insert.mc" enctype="multipart/form-data">
                    <br>
                    <table>
                      <tr>
                        <tr>
                          <td rowspan="2" style="padding-right:40px;">
                            <img src="resources/images/thumbImg.png" alt="user-avatar" class="d-block rounded" height="350" width="350" id="uploadedAvatar">
                          </td>
                          <td width="100%">
                            <div class="mb-3">
                              <label for="formFile" class="form-label">사진등록</label>
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
                            			$("#uploadedAvatar").attr("src", "resources/images/thumbImg.png");
                            		}
                            	}
                            </script>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <div class="mb-3">
                              <label for="defaultFormControlInput" class="form-label">기구이름</label>
                              <input type="text" class="form-control" id="defaultFormControlInput" placeholder="기구이름을 입력하세요" name="mcName">
                            </div>
                          </td>
                        </tr>
                      </tr>
                      <tr>

                      </tr>

                    </table>

                    <br><br>

                    <div class="mt-2 btnDiv" style="text-align:center;">
                      <button type="submit" class="btn btn-primary me-2">기구등록</button>
                      <button type="button" class="btn btn-secondary me-2">이전으로</button>
                    </div>

                    <br>


                  </form>

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