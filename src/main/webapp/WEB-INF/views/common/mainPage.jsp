<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fitty</title>
<link type="text/css" rel="stylesheet" href="resources/css/chat.css" />
<script type="text/javascript" src="resources/js/chat.js"></script>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<a href="userPage.cl">회원 전용 사이트 (테스트 링크)</a>

	<div class="content-wrapper">
		<div class="container-xxl flex-grow-1 container-p-y" style="padding: 0px;">
			<div class="row">
				<div class="col-lg-8 mb-4 order-0">

					<div class="col-xl-12">

						<div class="nav-align-top mb-4">
							<div class="tab-content " style="width: 100%; height: 100%">
								<div class="tab-pane fade show active"
									id="navs-pills-justified-home" role="tabpanel">
									<canvas id="myChartOne"></canvas>



								</div>
							</div>
						</div>

					</div>
				</div>

				<div class="col-lg-4 col-md-4 order-1">

					<div class="col-xl-12">

						<div class="nav-align-top mb-4">
							<div class="tab-content " style="width: 100%; height: 100%">
								<div class="tab-pane fade show active"
									id="navs-pills-justified-home" role="tabpanel">
									<canvas id="myChartOne"></canvas>



								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		</div>
</body>
</html>