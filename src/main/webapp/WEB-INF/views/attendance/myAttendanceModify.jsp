<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fitty 개인 근태 수정</title>
<link type="text/css" rel="stylesheet" href="resources/css/attendance.css" />
<script type="text/javascript" src="resources/js/attendance.js"></script>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="row">
   <!-- 수정요청관리 -->
   <div class="col-md-2 ">
     <div class="card mb-4 vacDetailDiv">
         <h5 class="card-header"><b>📜 내 수정요청</b></h5>
         <div class="card-body">
           <button class="simple">
             <div class="profileDiv">
               <i class='bx bxs-user-circle'></i>
               <span class="profileName"><b>홍길동</b></span>
               <span class="profileName">트레이너</span>
             </div>
             <div>
               <table class="modifyList">
                 <tr>
                   <th>변경요청일</th>
                   <td>2022.08.16</td>
                 </tr>
                 <tr>
                   <th>비고</th>
                   <td>출근수정</td>
                 </tr>
                 <tr>
                   <td colspan="2" style="text-align:center"><button class="btn btn-sm btn-secondary">대기중</button></td>
                 </tr>
               </table>
             </div>
           </button>
           <button class="simple">
             <div class="profileDiv">
               <i class='bx bxs-user-circle'></i>
               <span class="profileName"><b>홍길동</b></span>
               <span class="profileName">트레이너</span>
             </div>
             <div>
               <table class="modifyList">
                 <tr>
                   <th>변경요청일</th>
                   <td>2022.08.16</td>
                 </tr>
                 <tr>
                   <th>비고</th>
                   <td>출근수정</td>
                 </tr>
                 <tr>
                   <td colspan="2" style="text-align:center"><button class="btn btn-sm btn-primary">승인됨</button></td>
                 </tr>
               </table>
             </div>
           </button>
         </div>
         <div class="endDiv">
           <button class="btn btn-primary">📝 새 수정요청</button>
           <!-- Basic Pagination 최대를 3으로 하던가ㅜㅜ-->
           <div aria-label="Page navigation pageNav">
             <ul class="pagination">
               <li class="page-item prev">
                 <a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevron-left"></i></a>
               </li>
               <li class="page-item">
                 <a class="page-link" href="javascript:void(0);">1</a>
               </li>
               <li class="page-item">
                 <a class="page-link" href="javascript:void(0);">2</a>
               </li>
               <li class="page-item active">
                 <a class="page-link" href="javascript:void(0);">3</a>
               </li>
               <li class="page-item next">
                 <a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevron-right"></i></a>
               </li>
             </ul>
           </div>
           <!--/ Basic Pagination -->
         </div>
     </div>
     
   </div>
 
   <!-- 휴가관리 -->
   <div class="col-md-10 ">
     <div class="card mb-4 vacDetailDiv">
         <h5 class="card-header" style="margin-bottom : 20px"><b>📝 근태 수정요청서 작성</b></h5>
         <div class="card-body" style="width: 95%;">
           <form id="formAccountSettings" method="POST" onsubmit="return false">
             <div class="row">
               <div class="mb-3 col-md-6">
                 <label for="firstName" class="form-label">수정요청일</label>
                 <input class="form-control" type="date" id="modifyDate" name="modifyDate" value="" autofocus required/>
               </div>
               <div class="mb-3 col-md-6">
                 <label for="organization" class="form-label">수정요청 상태</label>
                 <div style="height : 10px"></div>
                 <input class="form-check-input"  type="radio" name="change" value="workIn">&nbsp출근수정&nbsp&nbsp&nbsp&nbsp&nbsp
                 <input class="form-check-input"  type="radio" name="change" value="workOut">&nbsp퇴근수정&nbsp&nbsp&nbsp&nbsp&nbsp
                 <input class="form-check-input"  type="radio" name="change" value="etc">&nbsp기타수정&nbsp&nbsp&nbsp&nbsp&nbsp
               </div>
               <div class="mb-3 col-md-12" style="margin-top: 20px;">
                  <label for="reason" class="form-label" >수정 요청사유</label><br>
                  <textarea class="reasonArea" autofocus required></textarea>
                </div>
              </div>
              <div class="mt-2 attModifyFormBtnDiv">
                <button type="submit" class="btn btn-primary me-2">직원등록</button>
                <button type="button" class="btn btn-secondary me-2">목록으로</button>
              </div>
            </form>
          </div>
      </div>
    </div>
  </div>
</div>

</body>
</html>