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
	#tb3, #tb4{width:94%;}
	#tb3 td{text-align:left;}
	#sel1{
	  width:100px;
	  height:35px;
	  border-radius: 5px;
	}
	.dt{height:35px; border:1px solid gray; border-radius: 5px;}
	.rsn{
	  width:100%; 
	  height:115px; 
	  border:1px solid lightgray;
	  border-radius: 5px;
	  
	}
	.title, .wrt, .con{
	  width:100%; 
	  height:35px; 
	  border:1px solid lightgray;
	  border-radius: 5px;
	}
	.addfile{
	  border:2px dashed lightgray;
	  width:85%;
	  float:right;
	  margin-right:3%;
	  height:35px;
	  text-align: center;
	  padding:3px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	<div class="outer">
		<jsp:include page="sideMenu.jsp"/>
		
		<div class="main">
           <form action="">
             <h4 style="color:rgb(50, 50, 50);">지출결의서</h4><br>

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
               <h5 align="center" style="color:rgb(50, 50, 50);"><b>지출결의서</b></h5>
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
                   <th width="20%" height="40px;">제목</th>
                   <td colspan="3"><input type="text" class="title"></td>
                 </tr>
                 <tr>
                   <th height="40px;">작성자</th>
                   <td width="30%"><input type="text" class="wrt"></td>
                   <th height="40px;" width="20%">작성일자</th>
                   <td><input type="date" class="dt"></td>
                 </tr>
                 <tr>
                   <th height="40px;">금액</th>
                   <td colspan="3"></td>
                 </tr>
                 <tr>
                   <th height="120px;">지출 사유</th>
                   <td colspan="3"><input type="text" class="rsn"></td>
                 </tr>
               </table>
               <table id="tb4">
                 <tr>
                   <th height="30">일자</th>
                   <th>분류</th>
                   <th>금액</th>
                   <th>사용내역</th>
                   <th>비고</th>
                 </tr>
                 <tr>
                   <td height="30" width="130"><input type="date" class="dt"></td>
                   <td width="110">
                     <select name="" id="sel1">
                       <option value="">기구구입비</option>
                       <option value="">비품구입비</option>
                       <option value="">회식비</option>
                     </select>
                   </td>
                   <td><input type="text" class="con"></td>
                   <td width="40%"><input type="text" class="con"></td>
                   <td width="15%"><input type="text" class="con"></td>
                 </tr>
                 <tr>
                   <td colspan="5" height="30">합계 : </td>
                 </tr>
               </table>
               <span style="margin-left:30px;">* 영수증 별도 제출</span><br><br>
               <div>
                 <span style="margin-left:40px;">파일 첨부</span>
                 <div class="addfile"><span style="color:gray; font-size:small;">파일선택</span></div>
               </div>
               <br><br><br>
             </div>
           </form>
         </div>
	</div>
</body>
</html>