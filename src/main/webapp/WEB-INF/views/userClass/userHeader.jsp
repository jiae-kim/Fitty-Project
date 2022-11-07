<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="utf-8" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="../assets/" data-template="vertical-menu-template-free">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
<title>Fitty</title>

<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="resources/bootTemplate/sneat-1.0.0/assets/img/favicon/favicon.ico" />

<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet"/>

<!-- Icons. Uncomment required icon fonts -->
<link rel="stylesheet" href="resources/bootTemplate/sneat-1.0.0/assets/vendor/fonts/boxicons.css" />

<!-- Core CSS -->
<link rel="stylesheet" href="resources/bootTemplate/sneat-1.0.0/assets/vendor/css/core.css" class="template-customizer-core-css" />
<link rel="stylesheet" href="resources/bootTemplate/sneat-1.0.0/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
<link rel="stylesheet" href="resources/bootTemplate/sneat-1.0.0/assets/css/demo.css" />

<!-- Vendors CSS -->
<link rel="stylesheet" href="resources/bootTemplate/sneat-1.0.0/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
<link rel="stylesheet" href="resources/bootTemplate/sneat-1.0.0/assets/vendor/libs/apex-charts/apex-charts.css" />

<!-- Helpers -->
<script src="resources/bootTemplate/sneat-1.0.0/assets/vendor/js/helpers.js"></script>

<!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
<!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
<script src="resources/bootTemplate/sneat-1.0.0/assets/js/config.js"></script>

<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- 구글폰트 notosans -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>	
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<style>
	*{
    	font-family: 'Noto Sans KR', sans-serif;
	}
    	
	#helloMan, #about-time {
    	color:rgb(50, 50, 50);
    	font-size: 11px;
    	margin : 5px;
	}

	#navbar-collapse {
    	margin : 0px;
	}

	#init-btn, #out-btn {
    	margin : 5px;
	}

	.bx-envelope, .bx-envelope-open, .bx-message-rounded-dots, .bx-bell {
    	font-size:25px;
    	color: #696CFF;
    	margin : 2px;
	}

	.big-menu-label{
    	color:rgb(50, 50, 50);
    	font-size: 14px;
	}

    .small-menu-label{
        font-size: 12px;
    }
	
	
	body::-webkit-scrollbar {
	  width: 20px;
	}
	
	body::-webkit-scrollbar-track {
	  background-color: #e4e4e4;
	  border-radius: 100px;
	}
	
	body::-webkit-scrollbar-thumb {
	  border-radius: 100px;
	  border: 6px solid rgba(0, 0, 0, 0.18);
	  border-left: 0;
	  border-right: 0;
	  background-color: #696CFF;
	}
	
	body *::-webkit-scrollbar {
	  width: 10px;
	}
	
	body *::-webkit-scrollbar-track {
	  background-color: #e4e4e4;
	  border-radius: 100px;
	}
	
	body *::-webkit-scrollbar-thumb {
	  border-radius: 100px;
	  border: 6px solid rgba(0, 0, 0, 0.18);
	  border-left: 0;
	  border-right: 0;
	  background-color: #696CFF;
	}
	#socketContent a {
		color:white !important;
	}
    
</style>
<meta name="description" content="" />

<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- 부트스트랩에서 제공하고 있는 스타일
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">-->

<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<!-- alertify cdn, css, themes -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>


</head>
<body>
	<!-- alert -->
	<div
	  id="socketAlert"
	  style="display:none;float:right;position:absolute;top:5%;right:5%;
	  		 background-color:rgba(105, 108, 255, 0.95) !important;"
	  class="bs-toast toast fade show bg-primary"
	  role="alert"
	  aria-live="assertive"
	  aria-atomic="true">
	  <div class="toast-header">
	    <i class="bx bx-bell me-2" style="color:white"></i>
	    <div class="me-auto fw-semibold">알림</div>
	    <small>지금</small>
	    <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
	  </div>
	  <div class="toast-body" id="socketContent"></div>
	</div>

<!-- Layout wrapper -->
	<c:if test="${ not empty alertMsg }">
		<script>
			alertify.alert("${ alertMsg }");
		</script>
		<!-- 1회성 메시지 지우기 -->
		<c:remove var="alertMsg" scope="session"/>
	</c:if>
    <div class="layout-wrapper layout-content-navbar" style="position:relative">
      <div class="layout-container">
        <!-- Menu -->

        <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
          <div class="app-brand demo">
            <a href="index.html" class="app-brand-link">
              <span class="app-brand-logo demo">
                <svg
                  width="25"
                  viewBox="0 0 25 42"
                  version="1.1"
                  xmlns="http://www.w3.org/2000/svg"
                  xmlns:xlink="http://www.w3.org/1999/xlink"
                >
                  <defs>
                    <path
                      d="M13.7918663,0.358365126 L3.39788168,7.44174259 C0.566865006,9.69408886 -0.379795268,12.4788597 0.557900856,15.7960551 C0.68998853,16.2305145 1.09562888,17.7872135 3.12357076,19.2293357 C3.8146334,19.7207684 5.32369333,20.3834223 7.65075054,21.2172976 L7.59773219,21.2525164 L2.63468769,24.5493413 C0.445452254,26.3002124 0.0884951797,28.5083815 1.56381646,31.1738486 C2.83770406,32.8170431 5.20850219,33.2640127 7.09180128,32.5391577 C8.347334,32.0559211 11.4559176,30.0011079 16.4175519,26.3747182 C18.0338572,24.4997857 18.6973423,22.4544883 18.4080071,20.2388261 C17.963753,17.5346866 16.1776345,15.5799961 13.0496516,14.3747546 L10.9194936,13.4715819 L18.6192054,7.984237 L13.7918663,0.358365126 Z"
                      id="path-1"
                    ></path>
                    <path
                      d="M5.47320593,6.00457225 C4.05321814,8.216144 4.36334763,10.0722806 6.40359441,11.5729822 C8.61520715,12.571656 10.0999176,13.2171421 10.8577257,13.5094407 L15.5088241,14.433041 L18.6192054,7.984237 C15.5364148,3.11535317 13.9273018,0.573395879 13.7918663,0.358365126 C13.5790555,0.511491653 10.8061687,2.3935607 5.47320593,6.00457225 Z"
                      id="path-3"
                    ></path>
                    <path
                      d="M7.50063644,21.2294429 L12.3234468,23.3159332 C14.1688022,24.7579751 14.397098,26.4880487 13.008334,28.506154 C11.6195701,30.5242593 10.3099883,31.790241 9.07958868,32.3040991 C5.78142938,33.4346997 4.13234973,34 4.13234973,34 C4.13234973,34 2.75489982,33.0538207 2.37032616e-14,31.1614621 C-0.55822714,27.8186216 -0.55822714,26.0572515 -4.05231404e-15,25.8773518 C0.83734071,25.6075023 2.77988457,22.8248993 3.3049379,22.52991 C3.65497346,22.3332504 5.05353963,21.8997614 7.50063644,21.2294429 Z"
                      id="path-4"
                    ></path>
                    <path
                      d="M20.6,7.13333333 L25.6,13.8 C26.2627417,14.6836556 26.0836556,15.9372583 25.2,16.6 C24.8538077,16.8596443 24.4327404,17 24,17 L14,17 C12.8954305,17 12,16.1045695 12,15 C12,14.5672596 12.1403557,14.1461923 12.4,13.8 L17.4,7.13333333 C18.0627417,6.24967773 19.3163444,6.07059163 20.2,6.73333333 C20.3516113,6.84704183 20.4862915,6.981722 20.6,7.13333333 Z"
                      id="path-5"
                    ></path>
                  </defs>
                  <g id="g-app-brand" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                    <g id="Brand-Logo" transform="translate(-27.000000, -15.000000)">
                      <g id="Icon" transform="translate(27.000000, 15.000000)">
                        <g id="Mask" transform="translate(0.000000, 8.000000)">
                          <mask id="mask-2" fill="white">
                            <use xlink:href="#path-1"></use>
                          </mask>
                          <use fill="#696cff" xlink:href="#path-1"></use>
                          <g id="Path-3" mask="url(#mask-2)">
                            <use fill="#696cff" xlink:href="#path-3"></use>
                            <use fill-opacity="0.2" fill="#FFFFFF" xlink:href="#path-3"></use>
                          </g>
                          <g id="Path-4" mask="url(#mask-2)">
                            <use fill="#696cff" xlink:href="#path-4"></use>
                            <use fill-opacity="0.2" fill="#FFFFFF" xlink:href="#path-4"></use>
                          </g>
                        </g>
                        <g
                          id="Triangle"
                          transform="translate(19.000000, 11.000000) rotate(-300.000000) translate(-19.000000, -11.000000) "
                        >
                          <use fill="#696cff" xlink:href="#path-5"></use>
                          <use fill-opacity="0.2" fill="#FFFFFF" xlink:href="#path-5"></use>
                        </g>
                      </g>
                    </g>
                  </g>
                </svg>
              </span>
              <a class="app-brand-text demo menu-text fw-bolder ms-2" href="userPage.cl">My Fitty</span>
            </a>

            <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
              <i class="bx bx-chevron-left bx-sm align-middle"></i>
            </a>
          </div>

          <div class="menu-inner-shadow"></div>

          <ul class="menu-inner py-1">

            <!-- Layouts -->
			<li class="menu-item">
			  <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class='menu-icon tf-icons bx bx-calendar'></i>
                <div data-i18n="Authentications"  class="big-menu-label">스케줄 관리</div>
           	  </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="listSchedule.sc" class="menu-link">
                    <div data-i18n="Account" class="small-menu-label">스케줄 조회 및 수업 예약</div>
                  </a>
                </li>
              </ul>
            </li>
            
            <script>
            	let td = new Date();
            	
            	ty = td.getFullYear().toString().substring(2);
            	tm = td.getMonth()+1;
            	td = td.getDate();
            	
            	tdate = ty + "/" + tm + "/" + td;
            	
            	
            </script>
            
            <li class="menu-item">
              <a href="userDiDetail.cl?classNo=${classNo}&exDate=' + tdate +'" class="menu-link menu-toggle">
                <i class='menu-icon tf-icons bx bxs-camera'></i>
                <div data-i18n="Account Settings" class="big-menu-label">식단일기</div>
              </a>
            </li>
            
            <li class="menu-item">
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class='menu-icon tf-icons bx bxs-book-heart'></i>
                <div data-i18n="Account Settings" class="big-menu-label">운동일지</div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="userEx.cl?classNo=${loginU.classNo }" class="menu-link">
                    <div data-i18n="Account" class="small-menu-label">#</div>
                  </a>
                </li>
                <!-- <li class="menu-item">
                  <a href="centerAtt.att" class="menu-link">
                    <div data-i18n="Notifications" class="small-menu-label">#</div>
                  </a>
                </li> -->
              </ul>
            </li>
           
        </aside>
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page"  style="margin-top: 20px;">
          <!-- Navbar -->

          <nav
            class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
            id="layout-navbar"
          >
            <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
              <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                <i class="bx bx-menu bx-sm"></i>
              </a>
            </div>

            <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse"> 
              <!-- Search -->
              <div class="navbar-nav align-items-center">
                <div class="nav-item d-flex align-items-center" id="navbar-profile-btns">
                    <!-- User -->
                    <!-- <li class="nav-item navbar-dropdown dropdown-user dropdown">
                        <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                        <div class="avatar avatar-online">
                            <img src="resources/bootTemplate/sneat-1.0.0/assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle" />
                        </div>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end">
                        <li>
                            <a class="dropdown-item" href="#">
                            <div class="d-flex">
                                <div class="flex-shrink-0 me-3">
                                <div class="avatar avatar-online">
                                    <img src="resources/bootTemplate/sneat-1.0.0/assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle" />
                                </div>
                                </div>
                            </div>
                            </a>
                        </li>
                        </ul>
                    </li> -->
                  <!--/ User -->
                  <label id="helloMan" style='font-size:15px'>${loginU.userName} 회원님 환영합니다 😍</label>

                </div>
              </div>
              
               
              <!-- /Search -->

              <ul class="navbar-nav flex-row align-items-center ms-auto">
                <!-- Place this tag where you want the button to render. -->
                <li class="nav-item lh-1 me-3" id="about-time">
                  
                </li>
                <li class="nav-item lh-1 me-3">
                    <button type="button" class="btn btn-sm btn-info" onclick="logOut();">로그아웃</button>
                </li>
                <li class="nav-item lh-1 me-3">
                    <a href="#"><i class='bx bx-envelope'></i></a>
                </li>
                <li class="nav-item lh-1 me-3">
                    <i class='bx bx-bell' ></i>
                </li>
				
              </ul>
            </div>
          </nav>

          <!-- / Navbar -->

        

          <div class="content-wrapper">
          	<div class="container-xxl flex-grow-1 container-p-y">
          	
    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="resources/bootTemplate/sneat-1.0.0/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="resources/bootTemplate/sneat-1.0.0/assets/vendor/libs/popper/popper.js"></script>
    <script src="resources/bootTemplate/sneat-1.0.0/assets/vendor/js/bootstrap.js"></script>
    <script src="resources/bootTemplate/sneat-1.0.0/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="resources/bootTemplate/sneat-1.0.0/assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->
    <script src="resources/bootTemplate/sneat-1.0.0/assets/vendor/libs/apex-charts/apexcharts.js"></script>

    <!-- Main JS -->
    <script src="resources/bootTemplate/sneat-1.0.0/assets/js/main.js"></script>

    <!-- Page JS -->
    <script src="resources/bootTemplate/sneat-1.0.0/assets/js/dashboards-analytics.js"></script>

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
    
    <!-- SockJs -->
    <script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
    
    <script>
    var socket = null;
    
	$(function(){
		connectWS();
	})
	
	
	function connectWS(){
		
		var ws = new SockJS("/fitty/echo");
	 	socket = ws;
	 	
	 	ws.onopen = onOpen;
	
		ws.onmessage = onMessage;
	
		ws.onclose = onClose;
	    
		ws.onerror = onError;
		
		   
		function onOpen(){
	   		console.log('Info: connection opened.');
		}
		
		function onMessage(evt){
			console.log('Info: connection onmessage.');
	   		console.log("ReceiveMessage:" , event.data+'\n');
	   		
	   		let $socketAlert = $("#socketAlert");
	   		let $socketContent = $("#socketContent");
	   		
	   		$socketContent.html(evt.data);
	   		$socketAlert.css("display", "block");
	   		
	   		setTimeout(function(){
	   			$socketAlert.css('display', 'none');
	   		}, 7000);
	   		
		}
		
		function onClose(evt){
			console.log('Info: connection closed');
			//setTimeout(function(){connect();}, 1000); // retry connection!!
		}
		
		function onError(err){
			console.log('Error:', err);
		}
	}	
	
	
	</script>
	
</body>
</html>