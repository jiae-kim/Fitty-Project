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
	.cmt2{
	  text-align:left; 
	  padding:10px;
	  font-size:13px;
	}
	.rsn{
	  width:100%; 
	  height:115px; 
	  border:1px solid lightgray;
	  border-radius: 5px;
	}
	#tb4{width:94%;}
	.dt, .ti{height:30px; border:1px solid gray; border-radius: 5px;  margin-left:5px;}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	<div class="outer">
		<jsp:include page="sideMenu.jsp"/>
		
		<div class="main">
           <form action="">
             <h4 style="color:rgb(50, 50, 50);">연장근무신청</h4><br>

             <button class="f-btn">
               <i class='bx bxs-edit'></i>
               결재요청
             </button>
             <button class="f-btn">
               <i class='bx bx-download'></i>
               임시저장
             </button>
             <button class="f-btn">
               <i class='bx bxs-x-circle'></i>
               취소
             </button>
             <button class="f-btn">
               <i class='bx bx-error-circle'></i>
               결재정보
             </button>
             <button class="f-btn" style="float:right;" type="button" onclick="location.href='draftList.ap'">
               <i class='bx bx-menu'></i>
               목록
             </button>
             <br><br>

             <div class="app-form1">
               <br>
               <h5 align="center" style="color:rgb(50, 50, 50);"><b>연장근무신청서</b></h5>
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
                   <th width="20%" height="40px;">근무 일시</th>
                   <td>
                     <input type="date" class="dt"> &nbsp;&nbsp;&nbsp;
                     <input type="time" class="ti"> &nbsp;~ <input type="time" class="ti">
                   </td>
                 </tr>
                 <tr>
                   <th height="40px;">근무 시간</th>
                   <td>
                     
                   </td>
                 </tr>
                 <tr>
                   <td colspan="2" height="80px;" class="cmt2">
                     * 주간 근무시간 - 근무일이 포함된 한 주<br>
                      정상근무시간 + 연장근무 승인 요청에 대한 결재가 완료된 총 시간입니다. <br>
                     근태관리에서 시간 수정이 가능하므로 주간 근무시간은 상이해질 수 있습니다.
                   </td>
                 </tr>
                 <tr>
                   <th height="120px;">신청 사유</th>
                   <td><input type="text" class="rsn"></td>
                 </tr>
               </table>
               <div align="center">
                 <button type="button" class="btn btn-sm btn-secondary">추가</button>
                 <button type="button" class="btn btn-sm btn-secondary">삭제</button>
               </div>
               <table id="tb4">
                 <tr>
                   <td colspan="5" style="text-align:left;" height="30"><b>&nbsp;신청 내역</b></td>
                 </tr>
                 <tr>
                   <th width="15%" height="30">근무구분</th>
                   <th width="15%">근무일시</th>
                   <th width="20%">근무시간</th>
                   <th colspan="2">신청사유</th>
                 </tr>
                 <tr>
                   <td height="80">연장</td>
                   <td style="font-size:12px;">
                     2022-09-01 <br>
                     (00:00~00:00)
                   </td>
                   <td style="font-size:12px;">
                     기본 : 0h 0m 0s <br>
                     연장 : 0h 0m 0s <br>
                     야간 : 0h 0m 0s <br>
                   </td>
                   <td colspan="2"></td>
                 </tr>
                 <tr>
                   <th height="30">주 근무시간</th>
                   <th colspan="2"></th>
                   <th width="15%">월 근무시간</th>
                   <th></th>
                 </tr>
               </table>

             </div>
           </form>
         </div>
	</div>
</body>
</html>