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
        #plus{ background-color: rgb(200, 201, 255);}
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


			<div class="col-lg-8 mb-4 order-0">

				<div class="col-xl-12">
				
					<div class="nav-align-top mb-4">
						<div class="tab-content" style="width:100%; height:100%">
						<div class="tab-pane fade show active" id="navs-pills-justified-home" role="tabpanel">
						<h5>연간 헬스장 회원 수 추이</h5>
							<canvas id="myChart3"></canvas>
							
		
							
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
								<h5>이용권 개월별 선호도</h5>
								<canvas id="myChart2"></canvas>
								<br>


							</div>
						</div>
					</div>

				</div>
			</div>


			<div class="col-lg-12 col-md-4 order-1">
				<div class="col-xl-12">

					<div class="nav-align-top mb-4">
						<div class="tab-content " style="width: 100%; height: 100%">
							<div class="tab-pane fade show active"
								id="navs-pills-justified-home" role="tabpanel">
								<h5>트레이너별 누적 수업 수</h5>
								<canvas id="myChart1"></canvas>



							</div>
						</div>
					</div>
					
				
				</div>
			</div>
		  </div>
		</div>

		<!-- uList {userCount 3, userCountMonth 20-06}
		 cList {empNo TRN102, empName 최헬트, clCount 5}
		 pList {userMonth 3(개월), couCount 2}
    	-->
		<script>

			$(function(){
				getGraph();
			});

			function getGraph(){
				let userCountMonth = [];
				let userCount = [];

				let empName = [];
				let classCount = [];

				let userMonth = [];
				let couCount = [];

				$.ajax({
					url:"ulist.st",
					type:"post",
					success:function(list1){
						//console.log("ajax1 성공");
						for(let i=0; i<list1.length; i++){
							userCountMonth.push(list1[i].userCountMonth);
							userCount.push(list1[i].userCount);
						}
						
						let myChart3 = document.getElementById('myChart3').getContext('2d');
						const gradientFill = myChart3.createLinearGradient(0,0,0,200);
    					gradientFill.addColorStop(0, 'rgb(200, 201, 255, 1)');
    					gradientFill.addColorStop(1, 'rgb(200, 201, 255, 0.1)');
						let lineChart = new Chart(myChart3, {

							type : 'line', //pie, line, doughnut, polarArea
							data : {
								labels : userCountMonth,
								datasets : [{
									label : '회원 수 추이',
									data : userCount,
									backgroundColor:'rgb(200, 201, 255, 0.3)',
									fill:true,
									borderColor : '#696cff',
									borderJoinStyle : 'round',
									pointRadius:3.5,
									lineTension:0.35

								}]
							},
							options: {
								display:true,
								text : '2021-2022 회원 수 추이',
								fontSize:30
								
							}

						})
					},
					error:function(){
						console.log("ajax1 실패");
					}


				})

				$.ajax({
					url:"clist.st",
					type:"post",
					success:function(list2){
						console.log(list2);
						for(let i=0; i<list2.length; i++){
							empName.push(list2[i].empName);
							classCount.push(list2[i].classCount);
						}
						//console.log(empName);

						new Chart(document.getElementById('myChart1').getContext('2d'),{

							type : 'bar', //pie, line, doughnut, polarArea
							data : {
								labels : empName,
								datasets : [{
									label : '트레이너별 누적 수업 수',
									data : classCount,
									backgroundColor:['rgb(105, 108, 255, 0.5)',
										'rgb(3, 195, 236, 0.5)',
										'rgb(255, 171, 0, 0.5)',
										'rgb(32, 201, 151, 0.5)'
									]
								}]
							}

						})
					},
					error:function(){
						console.log("ajax2 실패");
					}

				})

				$.ajax({
					url:"plist.st",
					type:"post",
					success:function(list3){
						//console.log("ajax3 성공");
						for(let i=0; i<list3.length; i++){
							userMonth.push(list3[i].userMonth);
							couCount.push(list3[i].couCount);
						}

						new Chart(document.getElementById('myChart2').getContext('2d'),{

							type : 'doughnut', //pie, line, doughnut, polarArea
							data : {
								labels : userMonth,
								datasets : [{
									label : '개월별 이용권 비율',
									data : couCount,
									backgroundColor:[
										'rgb(255, 171, 0)',
										'rgb(113, 221, 55)',
										'rgb(32, 201, 151)',
										'rgb(3, 195, 236)',
										'rgb(105, 108, 255)',
										'rgb(102, 16, 242)',
										'rgb(253, 126, 20)',
										'rgb(0, 123, 255)'
									]
								}]
							}

						})
					},
					error:function(){
						console.log("ajax3 실패");
					}
				})
			}

		</script>

		<!-- Overlay -->
		<div class="layout-overlay layout-menu-toggle"></div>
	</div>


</body>
</html>