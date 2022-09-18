<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table *{
          text-align: center;
        }

        table thead, table tfoot{
          background-color: #f8f4fc;
          /* background-color: #e8e4fc; */
        }

        .pagination{
          justify-content: center;
        }

        #dataTable td, #dataTable th{
          padding:0px;
          font-size: 4px;
          height: 23px;
        }

        #workTable td, #workTable th{
          padding:0px;
          font-size: 4px;
          height: 23px;
        }

        #late{ background-color: #fcffe1;}
        #illegal{ background-color: #ffebeb;}
        #approve{ background-color: #e1ffdd;}
        /* #yearVac{ background-color: #e7fdf9;} */
        #vacation{ background-color: #f2f2f2;}
        #plus{ background-color: #c8c9ff;}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js"></script>
</head>
<body>
	<jsp:include page="../common/header.jsp" />

	<!-- uList {userCount 3, userCountMonth 20-06}
		 cList {empNo TRN102, empName 최헬트, clCount 5}
		 pList {userMonth 3(개월), couCount 2}
    -->

	<div class="content-wrapper">
		<div class="container-xxl flex-grow-1 container-p-y" style="padding:0px;">
		  <div class="row">
  
			<div class="col-xl-12">

				<div class="nav-align-top mb-4">
					<div class="tab-content" style="width:100%; height:100%">
					  <div class="tab-pane fade show active" id="navs-pills-justified-home" role="tabpanel">
						<canvas id="myChartOne"></canvas>
						
	
						
					  </div>
					</div>
				</div>
			  
			</div>
		  </div>
		</div>

		<script>
			let myChartOne = document.getElementById('myChartOne').getContext('2d');

			let barChart = new Chart(myChartOne, {
				type : 'bar', //pie, line, doughnut, polarArea
				data : {
					labels : ['학원', '연구원', '출판사', '미디어사', '위니브'],
					datasets : [{
						label : '바울랩 매출액',
						data : [
							10,
							100,
							100,
							200,
							1000
						]
					}]
				}
			})
		</script>

		<!-- Overlay -->
		<div class="layout-overlay layout-menu-toggle"></div>
	</div>


</body>
</html>