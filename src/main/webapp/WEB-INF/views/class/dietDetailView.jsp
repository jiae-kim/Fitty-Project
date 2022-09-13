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
          <div class="content-wrapper" style="margin-top: -20px;">
            <div class="container-xxl flex-grow-1 container-p-y">
              <div class="row">
                <div class="col-xl-12">

                  <div class="nav-align-top mb-4">

                    <!-- <div align="center">
                      <a href="" style="color:#696CFF; font-size:30px">◀️</a> &nbsp;&nbsp;
                            
                      <label style="font-weight: 700; font-size:25px;">2022년 8월 12일 (금)</label> 
                      &nbsp;&nbsp;

                      <a href="" style="color:#696CFF; font-size:30px">▶️</a>
                    </div> -->

                    <br>


                    <div class="row">
                      <div class="col-md-2 col-12 mb-md-0 mb-4">
                        <div class="card" align="center">

                          <div class="card-header">회원정보</div>
                          <div class="card-body" >
                            <!-- Connections -->
                            
                            <!-- /Connections -->
                          </div>
                        </div>
                      </div>




                      <!-- 내용위에 분류버튼 (* 수정해도 되는 부분) -->
                      <div class="col-md-10">
                      <div class="nav-align-top mb-4">
                      <ul class="nav nav-pills mb-3 nav-fill" role="tablist">
                        <li class="nav-item">
                          <button
                            type="button"
                            class="nav-link active"
                            role="tab"
                            data-bs-toggle="tab"
                            data-bs-target="#navs-pills-justified-home"
                            aria-controls="navs-pills-justified-home"
                            aria-selected="true"
                            style="text-weight:700"
                          >
                            🔥 오늘의 운동
                            <span class="badge rounded-pill badge-center h-px-20 w-px-20 bg-danger">3</span>
                          </button>
                        </li>
                        <li class="nav-item">
                          <button
                            type="button"
                            class="nav-link"
                            role="tab"
                            data-bs-toggle="tab"
                            data-bs-target="#navs-pills-justified-profile"
                            aria-controls="navs-pills-justified-profile"
                            aria-selected="false"
                          >
                            🌮 식단관리
                          </button>
                        </li>
                        <li class="nav-item">
                          <button
                            type="button"
                            class="nav-link"
                            role="tab"
                            data-bs-toggle="tab"
                            data-bs-target="#navs-pills-justified-messages"
                            aria-controls="navs-pills-justified-messages"
                            aria-selected="false"
                          >
                            ✏️ 출결확인
                          </button>
                        </li>
                      </ul>
                      <!-- / 내용위에 분류버튼 -->


                    
                      <div class="tab-content" style="height: 695px;">

                        <!-- 내용 넣을 부분 (* 수정해도 되는 부분)-->
                        <!-- 오늘의운동 -->
                        <div class="tab-pane fade show active" id="navs-pills-justified-home" role="tabpanel">
                        </div>
                        <!-- / -->



                        <!-- 오늘의식단 -->
                        <div class="tab-pane fade" id="navs-pills-justified-profile" role="tabpanel">

                          <div class="di-date" align="center">
                            <!-- <a href="" style="color:#696CFF; font-size:30px">◀️</a> &nbsp;&nbsp;
                            
                            <label style="font-weight: 700; font-size:25px;">2022년 8월 12일 (금)</label> 
                            &nbsp;&nbsp;

                            <a href="" style="color:#696CFF; font-size:30px">▶️</a> -->

                            <div class="row row-cols-1 row-cols-md-3 g-4 mb-5">

                              <div class="col">
                                <div class="card h-100">
                                  <img class="card-img-top di_bf_img" src="3.png" style="object-fit: cover;"/>
                                  <div class="card-bodyy di_bf_content">
                                    <!-- <h5 class="card-title">아침</h5> -->
                                    <p class="card-text">
                                      토마토
                                      우유
                                    </p>
                                  </div>
                                </div>
                              </div>

                              <div class="col">
                                <div class="card h-100">
                                  <img class="card-img-top" src="3.png" style="object-fit: cover;"/>
                                  <div class="card-bodyy">
                                    <!-- <h5 class="card-title">아침</h5> -->
                                    <p class="card-text">
                                      토마토
                                      우유
                                    </p>
                                  </div>
                                </div>
                              </div>

                              <div class="col">
                                <div class="card h-100">
                                  <img class="card-img-top" src="3.png" style="object-fit: cover;"/>
                                  <div class="card-bodyy">
                                    <!-- <h5 class="card-title">아침</h5> -->
                                    <p class="card-text">
                                      토마토
                                      우유
                                    </p>
                                  </div>
                                </div>
                              </div>
                            </div>

                          </div>

                          <br><br>
                          <!-- 댓글 -->
                          <div class="reply-wrap">
                            <label>댓글 (3)</label><br>

                            <div class="reply">
                              <div class="reply-content">
                                <label id="writer">김연아 트레이너</label> &nbsp; <label id="date">2022.08.12</label><br>
                                <label id="content">내ㅛ오오오오오오오</label>
                              </div>
                              <div class="reply-like">🤍</div>
                            </div>
                            

                            <script>
                              $(function(){
                                selectReplyList();

                              })

                              function selectReplyList(){
                                $.ajax({
                                  url:"rlist.di",
                                  data: {no:"${dietNo}"},
                                  success:function(list){

                                    console.log(list);

                                  },
                                  error:function(){
                                    console.log("댓글 리스트 조회용 ajax통신 실패");
                                  }
                                })
                              }
                            </script>

                            
                            <!-- 댓글입력 -->
                            <form id="postForm" action="" method="post" >
                              <input type="hidden" name="no" value="">
                              
                            </form>
                            
                            <c:choose>
                              <c:when test="${ empty loginUser }">
                                  <div class="reply-input">
                                      <textarea class="form-control" rows="2" readonly>로그인 후 이용 가능한 서비스입니다.</textarea>
                                      <button disabled>등록</button>
                                  </div>
                              </c:when>
                              <c:otherwise>
                                  <div class="reply-input">
                                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="2" placeholder="댓글을 입력해주세요."></textarea>
                                    <button>등록</button>
                                  </div>
                              </c:otherwise>
                            </c:choose>
                            <!-- /댓글입력 -->
                          </div>
                        </div>



                        <!-- 출결 -->
                        <div class="tab-pane fade" id="navs-pills-justified-messages" role="tabpanel">

                        </div>
                        <!-- / 내용 넣을 부분 -->
                      </div>

                      </div>
                      </div>
                    </div>

                  </div>

                </div>
              </div>
            </div>
          </div>
          <!-- /내용 감싸는 전체 wrap -->
	
	

</body>
</html>