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

.card-machine {
	display: inline;
}

#machine-area td {
	padding: 12px;
}

.mc-div {
	position: relative;
}

.mc-ck {
	position: absolute;
	top: 5px;
	right: 5px;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div class="content-wrapper">
		<div class="container-xxl flex-grow-1 container-p-y" style="padding:0px">
			<div class="row">

				<!-- <h5 class="py-3 my-4">근태관리 페이지</h5> -->
				<div class="col-xl-12">
					<!-- <h6 class="text-muted">Filled Pills</h6> -->
					<div class="nav-align-top mb-4">
						<ul class="nav nav-pills mb-3 nav-fill" role="tablist">
							<li class="nav-item"><a class="nav-link" href="list.mc">
									<!-- <i class="tf-icons bx bx-home"></i> Home --> 🏋️‍♀️
									전체&nbsp기구
							</a></li>
							<li class="nav-item"><a type="button" class="nav-link"
								href="ckList.mc"> <!-- <i class="tf-icons bx bx-user"></i> Profile -->
									✔ 기구&nbsp;점검
							</a></li>
							<li class="nav-item"><a type="button"
								class="nav-link active" href="bklist.mc"> <!-- <i class="tf-icons bx bx-message-square"></i> Messages -->
									🛠 고장난&nbsp기구
							</a></li>
						</ul>
						<div class="tab-content" style="width: 100%; height: 100%">
							<form action="repair.mc">
								<div class="tab-pane fade show active"
									id="navs-pills-justified-home" role="tabpanel">
									<div style="height: 20px"></div>
									<table class="pull-right" style="width: 100%">
										<tr style="width: 100%; text-align: right">
											<td style="width: 12%;">
												<h3>
													고장난 기구<span>(${ pi.listCount })</span>
												</h3>
											</td>

											<!--<td width="760px"></td> -->
											<td style="width: 88%; text-align: right">
												<button type="submit" class="btn btn-info">수리완료</button>
											</td>
										</tr>
									</table>

									<br>

									<div id="machine-area" style="width: 100%; height: 100%">

										<table>
											<c:choose>
												<c:when test="${ empty list }">
													<tr style="height: 50%">
														<td colspan="5">현재 고장난 기구가 없습니다.</td>
													</tr>
												</c:when>
												<c:otherwise>
													<tr style="height: 50%">
														<c:forEach var="i" begin="0" end="4" step="1">

															<td style="width: 20%; margin-right: 10px"><c:if
																	test="${not empty list[i] }">
																	<div class="card h-100" data-bs-toggle="modal">
																		<input class="form-check-input mc-ck" type="checkbox"
																			name="ckMachine" value="${ list[i].mcNo }"
																			id="defaultCheck1"> <img class="card-img-top"
																			src="${list[i].mcImg }" art="Card image cap">
																		<div class="card-body">
																			<h5 class="card-title">${ list[i].mcName }</h5>
																			<p class="card-text">${ list[i].mcEnrollDate }</p>
																		</div>
																	</div>
																</c:if></td>

														</c:forEach>
													</tr>

													<tr style="height: 50%">
														<c:forEach var="i" begin="5" end="9" step="1">

															<td style="width: 20%; margin-right: 10px"><c:if
																	test="${not empty list[i] }">
																	<div class="card h-100" data-bs-toggle="modal">
																		<input class="form-check-input mc-ck" type="checkbox"
																			value="${ list[i].mcNo }" id="defaultCheck1"
																			name="ckMachine"> <img class="card-img-top"
																			src="${list[i].mcImg }" art="Card image cap">
																		<div class="card-body">
																			<h5 class="card-title">${ list[i].mcName }</h5>
																			<p class="card-text">${ list[i].mcEnrollDate }</p>
																		</div>
																	</div>
																</c:if></td>

														</c:forEach>
													</tr>
												</c:otherwise>
											</c:choose>
										</table>


									</div>

									<br> <br>

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
														<li class="page-item prev disabled"><a
															class="page-link"><i
																class="tf-icon bx bx-chevron-left"></i></a></li>
													</c:when>
													<c:otherwise>
														<li class="page-item prev"><a class="page-link"
															href="bkList.mc?cpage=${ pi.currentPage - 1 }"><i
																class="tf-icon bx bx-chevron-left"></i></a></li>
													</c:otherwise>
												</c:choose>

												<c:forEach var="p" begin="${pi.startPage }"
													end="${ pi.endPage }">
													<li class="page-item"><a class="page-link page-color"
														href="bkList.mc?cpage=${ p }">${ p }</a></li>
												</c:forEach>

												<c:choose>
													<c:when test="${pi.currentPage eq pi.maxPage }">
														<li class="page-item next disabled"><a
															class="page-link"><i
																class="tf-icon bx bx-chevron-right"></i></a></li>
													</c:when>
													<c:otherwise>
														<li class="page-item next"><a class="page-link"
															href="bkList.mc?cpage=${ pi.currentPage + 1 }"><i
																class="tf-icon bx bx-chevron-right"></i></a></li>
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