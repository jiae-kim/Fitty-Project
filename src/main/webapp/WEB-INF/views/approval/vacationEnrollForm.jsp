<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.main{
	  width:83%;
	  height:750px;
	  float:left;
	  background-color:white;
	  margin-left:27px;
	  margin-top:30px;
	  border-radius:6px;
	  box-shadow: 0 0 0.375rem 0.25rem rgb(161 172 184 / 15%);
	  color:rgb(51, 51, 51);
	  padding:30px;
	}
	.f-btn{
	  border:0px;
	  background-color:white;
	  font-size:14px;
	}
	.app-form1{
	  border:1px solid black;
	  height:580px;
	  overflow-y:scroll;
	}
	.app-form1 table{
	  border:1px solid rgba(51, 51, 51, 0.5);
	  font-size:14px;
	  margin:3%;
	  text-align: center;
	}
	.app-form1 th, .app-form1 td{border:1px solid rgba(51, 51, 51, 0.5);}
	.app-form1 th{background-color: rgba(211, 211, 211, 0.5);}
	#tb1{width:300px; height:120px; float:left;}
	#tb2{width:100px; height:120px; float:right;}
	#tb3{width:94%;}
	#tb3 td{text-align:left;}
	.cmt1{
	  text-align:left; 
	  background-color:rgba(211, 211, 211, 0.5); 
	  padding:5px;
	  font-size:13px;
	}
	#sel1{
	  width:80px;
	  height:30px;
	  border-radius: 5px;
	  margin-left:5px;
	}
	.dt{height:30px; border:1px solid gray; border-radius: 5px; margin-left:5px;}
	.dnum{width:50px; height:30px; border:1px solid gray; border-radius: 5px; text-align: right;}
	.hsel{accent-color:rgb(105, 108, 255); margin-left:5px;}
	.rsn{
	  width:100%; 
	  height:115px; 
	  border:1px solid lightgray;
	  border-radius: 5px;
	  
	}
	.memlist{
	  border:1px solid lightgray;
	  border-radius:5px;
	  width:34%;
	  height:400px;
	  float:left;
	  font-size:small;
	  padding-top:5px;
	}
	.addlist{
	  border:1px solid lightgray;
	  border-radius:5px;
	  width:64%;
	  height:400px;
	  float:right;
	  font-size:small;
	}
	.memlist li{list-style-type: none; margin-top:5px;}
	#appr-mem1{border-left:1px solid gray; height:61px;}
	.wd{border-bottom:1px solid gray; width:11px; height:10px; float:left;}
	#appr-mem2{border-left:1px solid gray; height:61px;}
	.addlist th{border-bottom:1px solid lightgray;}
	.addlist td{border-bottom:1px solid lightgray; text-align: center;}
	.addlist button, #appr-mem1 button, #appr-mem2 button{border:none; background-color:white;}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
	<div class="outer">
       <jsp:include page="sideMenu.jsp"/>
       <div class="main">
         <form action="">
           <h4 style="color:rgb(50, 50, 50);">휴가신청</h4><br>

           <button class="f-btn">
             <i class='bx bxs-edit'></i>
             결재요청
           </button>
           <button class="f-btn">
             <i class='bx bx-download'></i>
             임시저장
           </button>
           <button class="f-btn" onclick="history.go(-1)">
             <i class='bx bxs-x-circle'></i>
             취소
           </button>
           <button class="f-btn" data-bs-toggle="modal" data-bs-target="#addMem" type="button">
             <i class='bx bx-error-circle'></i>
             결재정보
           </button>
           <button class="f-btn" style="float:right;">
             <i class='bx bx-menu'></i>
             목록
           </button>
           <br><br>
           <div
             class="modal fade"
             id="addMem"
             aria-labelledby="modalToggleLabel"
             tabindex="-1"
             style="display: none"
             aria-hidden="true"
           >
             <div class="modal-dialog modal-dialog-scrollable">
               <div class="modal-content">
                 <div class="modal-header">
                   <h5 class="modal-title" id="modalToggleLabel" style="color:rgb(51, 51, 51);">결재양식 선택</h5>
                   <button
                     type="button"
                     class="btn-close"
                     data-bs-dismiss="modal"
                     aria-label="Close"
                   ></button>
                 </div>
                 <div class="modal-body">
                   <div class="memlist">
                     <span style="margin-left:10px;">조직도</span>
                     <hr>
                     <ul>
                       <div id="appr-mem1">
                         <li><div class="wd"></div><i class='bx bxs-user'></i><button type="button" id="ceo">최대표 대표</button></li>
                         <li><div class="wd"></div><i class='bx bxs-user'></i><button type="button" id="adm">이팀장 팀장</button></li>
                         <li><div class="wd"></div><button class="membtn" type="button"><i class='bx bx-add-to-queue'></i></button>트레이너
                           <ul>
                             <div id="appr-mem2" style="display:none;">
                               <li><div class="wd"></div><i class='bx bxs-user'></i><button type="button" id="trn1">김구디</button></li>
                               <li><div class="wd"></div><i class='bx bxs-user'></i><button type="button" id="trn2">박구디</button></li>
                               <li><div class="wd"></div><i class='bx bxs-user'></i><button type="button" id="trn3">최구디</button></li>
                             </div>
                           </ul>
                         </li>
                       </div>
                     </ul>
                   </div>
                   <div class="addlist">
                     <table>
                       <tr>
                         <td width="40" height="30"></td>
                         <td width="50">타입</td>
                         <td width="150">이름</td>
                         <td width="60"></td>
                         <td width="30"><button><i class='bx bxs-trash'></i></button></td>
                       </tr>
                       <tr>
                         <th colspan="5" height="30" style="background:rgba(211, 211, 211, 0.5);">&nbsp;신청</th>
                       </tr>
                       <tr>
                         <td height="40" style="background:rgba(211, 211, 211, 0.3);"><button type="button" style="background:rgba(211, 211, 211, 0);"><i class='bx bx-chevrons-right'></i></button></td>
                         <td>기안</td>
                         <td>김구디</td>
                         <td></td>
                         <td></td>
                       </tr>
                       <tr>
                         <th colspan="5" height="30" style="background:rgba(211, 211, 211, 0.5);">&nbsp;승인</th>
                       </tr>
                       <tr>
                         <td height="40" style="background:rgba(211, 211, 211, 0.3);">
	                         <button style="background:rgba(211, 211, 211, 0);" type="button" onclick="">
	                         	<i class='bx bx-chevrons-right'></i>
	                         </button>
                         </td>
                         <td>결재</td>
                         <td>김구디</td>
                         <td></td>
                         <td><button type="button" onclick=""><i class='bx bxs-trash'></i></button></td>
                       </tr>
                     </table>
                   </div>
                 </div>
                 <script>
                   $(function(){
                     $('.membtn').click( function() {
                       $('#appr-mem2').slideToggle(20);
                     } );
                   })
                   
                 </script>
                 <div class="modal-footer">
                   <button class="btn btn-primary">확인</button>
                   <button class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                 </div>
               </div>
             </div>
           </div>

           <div class="app-form1">
             <br>
             <h5 align="center" style="color:rgb(50, 50, 50);"><b>연차 신청서</b></h5>
             <br><br>
             <table id="tb1">
               <tr>
                 <th width="40%">기안자</th>
                 <td>김구디</td>
               </tr>
               <tr>
                 <th>기안일</th>
                 <td>2022-09-01</td>
               </tr>
               <tr>
                 <th>문서번호</th>
                 <td></td>
               </tr>
             </table>
             <table id="tb2">
               <tr>
                 <th rowspan="3" width="25%;">신청</th>
                 <td height="20%">팀장</td>
               </tr>
               <tr>
                 <td height="60%">김ㅇㅇ</td>
               </tr>
               <tr>
                 <td></td>
               </tr>
             </table>
             <table id="tb2">
               <tr>
                 <th rowspan="3" width="25%;">승인</th>
                 <td height="20%">사원</td>
               </tr>
               <tr>
                 <td height="60%">김구디</td>
               </tr>
               <tr>
                 <td></td>
               </tr>
             </table>
             
             <table id="tb3">
               <tr>
                 <th width="20%" height="40px;">휴가 종류</th>
                 <td>
                   <select name="" id="sel1">
                     <option value="">연차</option>
                     <option value="">조퇴</option>
                     <option value="">병가</option>
                   </select>
                 </td>
               </tr>
               <tr>
                 <th height="40px;">기간 및 일시</th>
                 <td>
                   <input type="date" class="dt"> &nbsp;~ <input type="date" class="dt">&nbsp;&nbsp;&nbsp;
                   선택일수 : <input type="text" class="dnum" value="1" disabled>
                 </td>
               </tr>
               <tr>
                 <th height="40px;">반차 여부</th>
                 <td>
                   <input type="radio" name="hour" class="hsel"> 오전&nbsp;&nbsp;&nbsp;
                   <input type="radio" name="hour" class="hsel"> 오후
                 </td>
               </tr>
               <tr>
                 <th height="40px;">연차 일수</th>
                 <td style="padding-left:5px;">
                   잔여연차 : <input type="text" class="dnum" value="NaN" disabled>&nbsp;&nbsp;&nbsp;
                   신청연차 : <input type="text" class="dnum" value="1" disabled>
                 </td>
               </tr>
               <tr>
                 <th height="120px;">휴가 사유</th>
                 <td><input type="text" class="rsn"></td>
               </tr>
               <tr>
                 <td colspan="2" height="80px;" class="cmt1">
                   연차의 사용은 근로기준법에 따라 전년도에 발생한 개인별 잔여 연차에 한하여 사용함을 원칙으로 한다. 
                   단, 최초 입사시에는 근로 기준법에 따라 발생 예정된 연차를 차용하여 월 1회 사용 할 수 있다.
                 </td>
               </tr>
             </table>
           </div>
         </form>
       </div>
     </div>

</body>
</html>