<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  .sideMenu{
    width:15%;
    height:750px;
    float:left;
    background-color:white;
    margin-top:30px;
    border-radius:6px;
    box-shadow: 0 0 0.375rem 0.25rem rgb(161 172 184 / 15%);
  }
  #s-btn1{
    width:130px;
    height:40px;
    border:1px solid rgb(105, 108, 255);
    color:rgb(105, 108, 255);
    background-color: white;
    border-radius: 5px;
    margin-top:30px;
    margin-left:20%;
  }
  .list{
    margin-top:50px;
    margin-left:20px;
    color:rgb(51, 51, 51);
  }
  .list li{
    list-style-type: none;
    margin-top:5px;
    font-size:14px;
  }
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
  }
  .topBox{
    border:1px solid lightgray;
    width:300px;
    height:200px;
    float:left;
    border-radius: 5px;
    margin:30px;
  }
  .purple{
    width:50px;
    height:20px;
    border-radius:5px;
    background-color:rgb(105, 108, 255);
    color:white;
    font-size:11px;
    float:left;
    margin-left: 10px;
    margin-top:10px;
    text-align:center;
    padding-top:2px;
  }
  .topBox span{
    margin-left:10px;
    margin-top:10px;
  }
  .topBox hr{
    margin-top:13px;
    margin-bottom:13px;
    color:lightgray;
  }
  .s1{font-size:12px;}
  #appr{
    font-size:14px;
    font-weight:bold;
    padding-bottom:10px;
  }
  .mMiddle{float:left; width:95%;}
  .mMiddle>span{margin-left:30px;}
  .mBox{
    border:1px solid lightgray;
    width:100%;
    height:180px;
    border-radius: 5px;
    margin-left:30px;
    margin-top:10px;
  }
  .t1>td{font-size:13px; text-align:center; border-bottom: 1px solid lightgray;}
  .t2>td{font-size:13px; text-align:center; padding-top:5px;}
  .mBottom{margin-top:30px;float:left; width:95%;}
  .mBottom>span{margin-left:30px;}
  .selType{
    border:1px solid lightgray;
    border-radius: 5px;
    padding:15px;
    float:left;
    font-size:13px;
    color:rgb(50, 50, 50);
    width:150px;
  }
  .selthumbnail{
    border:1px solid lightgray;
    border-radius: 5px;
    float:right;
    color:rgb(50, 50, 50);
    width:340px;
    height:400px;
  }
  .list a{color:rgb(51, 51, 51);}
  .ing{
    width:50px;
    height:20px;
    border-radius:5px;
    background-color:rgb(105, 108, 255);
    color:white;
    font-size:11px;
    padding:2px;
    margin:auto;
  }
  .fin{
    width:50px;
    height:20px;
    border-radius:5px;
    background-color:rgb(133, 146, 163);
    color:white;
    font-size:11px;
    padding:2px;
    margin:auto;
  }
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
	<div class="outer">
       <div class="sideMenu">
           <button id="s-btn1" data-bs-toggle="modal" data-bs-target="#newAppModal">새 결재 진행</button>

         <div class="list">
           <span><b>결재하기</b></span>
           <ul>
             <li><a href="결재대기문서.html">결재 대기 문서</a></li>
             <li><a href="결재예정문서.html">결재 예정 문서</a></li>
           </ul>
           <span><b>개인 문서함</b></span>
           <ul>
             <li><a href="기안문서함.html">기안 문서함</a></li>
             <li><a href="임시저장함.html">임시 저장함</a></li>
             <li><a href="결재문서함.html">결재 문서함</a></li>
           </ul>
         </div>
       </div>
       <div class="main">
         <div class="mTop">
           <div class="topBox">
             <div class="purple">진행중</div> <br><br>
             <span>휴가신청</span> <br>
             <span class="s1">기안자 : 김구디 트레이너</span><br>
             <span class="s1">기안일 : 2022-08-25</span><br>
             <span class="s1">결재양식 : 휴가신청</span>
             <hr>
             <div id="appr" align="center"><a>결재하기</a></div>
           </div>
         </div>
         <br><br>

         <div class="mMiddle">
           <span>기안 진행 문서</span>
           <div class="mBox">
             <table>
               <tr class="t1">
                 <td width="110">기안일</td>
                 <td width="110">결재양식</td>
                 <td width="800">제목</td>
                 <td width="110">결재상태</td>
               </tr>
               <tr class="t2">
                 <td>2022-09-05</td>
                 <td>휴가신청</td>
                 <td>휴가신청</td>
                 <td><div class="ing">진행</div></td>
               </tr>
             </table>
           </div>
         </div>
         <br><br>

         <div class="mBottom">
           <span>완료 문서</span>
           <div class="mBox">
             <table>
               <tr class="t1">
                 <td width="110">기안일</td>
                 <td width="110">결재양식</td>
                 <td width="630">제목</td>
                 <td width="140">문서번호</td>
                 <td width="110">결재상태</td>
               </tr>
               <tr class="t2">
                 <td>2022-07-26</td>
                 <td>휴가신청</td>
                 <td>휴가신청</td>
                 <td>fitty-2022-0008</td>
                 <td><div class="fin">완료</div></td>
               </tr>
             </table>
           </div>
         </div>
       </div>
     </div>

     <div
       class="modal fade"
       id="newAppModal"
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
             <div class="selType">
               - 휴가신청 <br><br>
               - 연장근무신청 <br><br>
               - 지출결의서
             </div>
             <div class="selthumbnail">
               
             </div>
           </div>
           <div class="modal-footer">
             <button class="btn btn-primary">확인</button>
             <button class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
           </div>
         </div>
       </div>
     </div>

</body>
</html>