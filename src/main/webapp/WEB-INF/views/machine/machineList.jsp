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
								<button type="button" class="nav-link active" role="tab"
									data-bs-toggle="tab"
									data-bs-target="#navs-pills-justified-home"
									aria-controls="navs-pills-justified-home" aria-selected="true">
									🏋️‍♀️ 전체&nbsp기구</button>
							</li>
							<li class="nav-item">
								<button type="button" class="nav-link" role="tab"
									data-bs-toggle="tab"
									data-bs-target="#navs-pills-justified-messages"
									aria-controls="navs-pills-justified-messages"
									aria-selected="false">
									<!-- <i class="tf-icons bx bx-user"></i> Profile -->
									✔ 기구&nbsp점검
								</button>
							</li>
							<li class="nav-item">
								<button type="button" class="nav-link" role="tab"
									data-bs-toggle="tab"
									data-bs-target="#navs-pills-justified-messages"
									aria-controls="navs-pills-justified-messages"
									aria-selected="false">
									<!-- <i class="tf-icons bx bx-message-square"></i> Messages -->
									🛠 고장난&nbsp기구
								</button>
							</li>
						</ul>
						<div class="tab-content" style="width: 100%; height: 100%">
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
										<td style="width:87%; text-align:right"><a class="btn btn-primary" href="enrollForm.mc">기구등록</a></td>
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
																<img class="card-img-top"
																	src="${list[i].mcImg }"
																	art="Card image cap">
																<div class="card-body">
																	<h5 class="card-title" style="display: inline">${ list[i].mcName }</h5>
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
																<img class="card-img-top"
																	src="${list[i].mcImg }"
																	art="Card image cap">
																<div class="card-body">
																	<h5 class="card-title" style="display: inline">${ list[i].mcName }</h5>
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

							<div>
								<div>
									<div>
										<!-- Basic Pagination -->
										<nav aria-label="Page navigation pageNav">
											<ul class="pagination">
												<c:choose>
													<c:when test="${pi.currentPage eq 1 }">
														<li class="page-item disabled"><a class="page-link">&lt;</a></li>
													</c:when>
													<c:otherwise>
														<li class="page-item"><a class="page-link" href="list.mc?cpage=${ pi.currentPage - 1 }">&lt;</a></li>
													</c:otherwise>
												</c:choose>
												
												<c:forEach var="p" begin="${pi.startPage }" end="${ pi.endPage }">
													<li class="page-item"><a class="page-link page-color" href="list.mc?cpage=${ p }">${ p }</a></li>
												</c:forEach>
												
												<c:choose>
													<c:when test="${pi.currentPage eq pi.maxPage }">
														<li class="page-item disabled"><a class="page-link">&gt;</a></li>
													</c:when>
													<c:otherwise>
														<li class="page-item"><a class="page-link" href="list.mc?cpage=${ pi.currentPage + 1 }">&gt;</a></li>
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