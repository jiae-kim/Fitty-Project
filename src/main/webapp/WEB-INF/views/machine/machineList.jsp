<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table * {
	text-align: center;
}

table thead, table tfoot {
	background-color: #f8f4fc;
	/* background-color: #e8e4fc; */
}

.pagination {
	justify-content: center;
}

#dataTable td, #dataTable th {
	padding: 0px;
	font-size: 4px;
	height: 23px;
}

#workTable td, #workTable th {
	padding: 0px;
	font-size: 4px;
	height: 23px;
}

#late {
	background-color: #fcffe1;
}

#illegal {
	background-color: #ffebeb;
}

#approve {
	background-color: #e1ffdd;
}
/* #yearVac{ background-color: #e7fdf9;} */
#vacation {
	background-color: #f2f2f2;
}

#plus {
	background-color: #c8c9ff;
}

.card-machine {
	display: inline;
}

#machine-area td {
	padding: 12px;
}

.page-color{
	background-color:#696cff;
	color:white;
}

.mc-div{
          position: relative;
        }
.mc-ck{
    position:absolute;
    top:5px;
    right: 5px;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />

	<div class="content-wrapper">
		<div class="container-xxl flex-grow-1 container-p-y">
			<div class="row">
				<div class="col-xl-12">
					<div class="nav-align-top mb-4">
						<ul class="nav nav-pills mb-3 nav-fill" role="tablist">
							<li class="nav-item">
								<a type="button" class="nav-link active" href="list.mc">
									
									🏋️‍♀️ 전체&nbsp기구</a>
							</li>
							<li class="nav-item">
								<a type="button" class="nav-link" role="tab" href="ckList.mc">
									✔ 기구&nbsp점검
								</a>
							</li>
							<li class="nav-item">
								<a type="button" class="nav-link" role="tab" href="">
									🛠 고장난&nbsp기구
								</a>
							</li>
						</ul>
						<div class="tab-content" style="width: 100%; height: 100%">
							<form action="delete.mc">
							<div class="tab-pane fade show active"
								id="navs-pills-justified-home" role="tabpanel">
								<div style="height: 20px"></div>
								<table class="pull-right">
									<tr>
										<td width="22px"></td>
										<td>
											<h3>
												전체기구<span>(${ pi.listCount })</span>
											</h3>
										</td>
										
										<!--<td width="760px"></td> -->
										<td style="width:87%; text-align:right">
											<a class="btn btn-primary" href="enrollForm.mc">기구등록</a>
											<button type="submit" class="btn btn-secondary">기구삭제</button>
										</td>
									</tr>
								</table>

								<br>
								
								<div id="machine-area" style="width: 100%; height: 100%">

									<table>
										<c:choose>
											<c:when test="${ empty list }">
												<tr style="height:50%">
													<td colspan="5">현재 등록기구가 없습니다.</td>
												</tr>
											</c:when>
											<c:otherwise>
											<tr style="height:50%">
												<c:forEach var="i" begin="0" end="4" step="1">
													
													<td style="width:20%; margin-right:10px">
														<c:if test="${not empty list[i] }">
															<div class="card h-100" data-bs-toggle="modal">
																<input class="form-check-input mc-ck" type="checkbox" name="ckMachine" value="${ list[i].mcNo }" id="defaultCheck1">
																<img class="card-img-top"
																	src="${list[i].mcImg }"
																	art="Card image cap">
																<div class="card-body">
																	<h5 class="card-title">${ list[i].mcName }</h5>
																	<p class="card-text">
															          ${ list[i].mcEnrollDate }
															        </p>
																</div>
															</div>
															</c:if>
													</td>
													
												</c:forEach>
											</tr>

											<tr style="height:50%"> 
												<c:forEach var="i" begin="5" end="9" step = "1">
													
													<td style="width:20%; margin-right:10px">
														<c:if test="${not empty list[i] }">
															<div class="card h-100" data-bs-toggle="modal">
																<input class="form-check-input mc-ck" type="checkbox" value="" id="defaultCheck1">
																<img class="card-img-top"
																	src="${list[i].mcImg }"
																	art="Card image cap">
																<div class="card-body">
																	<h5 class="card-title">${ list[i].mcName }</h5>
																	<p class="card-text">
															          ${ list[i].mcEnrollDate }
															        </p>
																</div>
															</div>
															</c:if>
													</td>
													
												</c:forEach>
											</tr>
											</c:otherwise>
										</c:choose>
									</table>


								</div>
								
								<br>
								<br>

							</div>
							</form>
							<div>
								<div>
									<div>
										<!-- Basic Pagination -->
										<nav aria-label="Page navigation pageNav">
											<ul class="pagination">
												<c:choose>
													<c:when test="${pi.currentPage eq 1 }">
														<li class="page-item prev disabled"><a class="page-link"><i class="tf-icon bx bx-chevron-left"></i
                              ></a></li>
													</c:when>
													<c:otherwise>
														<li class="page-item prev"><a class="page-link" href="list.mc?cpage=${ pi.currentPage - 1 }"><i class="tf-icon bx bx-chevron-left"></i
                              ></a></li>
													</c:otherwise>
												</c:choose>
												
												<c:forEach var="p" begin="${pi.startPage }" end="${ pi.endPage }">
													<li class="page-item"><a class="page-link page-color" href="list.mc?cpage=${ p }">${ p }</a></li>
												</c:forEach>
												
												<c:choose>
													<c:when test="${pi.currentPage eq pi.maxPage }">
														<li class="page-item next disabled"><a class="page-link"><i class="tf-icon bx bx-chevron-right"></i
                              ></a></li>
													</c:when>
													<c:otherwise>
														<li class="page-item next"><a class="page-link" href="list.mc?cpage=${ pi.currentPage + 1 }"><i class="tf-icon bx bx-chevron-right"></i></a></li>
													</c:otherwise>
												</c:choose>
											</ul>
										</nav>
										<!--/ Basic Pagination -->
									</div>
								</div>
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