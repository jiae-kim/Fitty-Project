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
	#tb2, #tb3{width:100px; height:120px; float:right;}
	#tb5{width:175px; height:120px; float:right;}
	#tb4{width:94%;}
	#tb4 td{text-align:left;}
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
	#appr-mem1{border-left:1px solid gray; height:64px;}
	#appr-mem2{border-left:1px solid gray; height:37px;}
	.wd{border-bottom:1px solid gray; width:11px; height:10px; float:left;}
	.addlist th{border-bottom:1px solid lightgray;}
	.addlist td{border-bottom:1px solid lightgray; text-align: center;}
	.addlist button, #appr-mem1 button, #appr-mem2 button{border:none; background-color:white;}
	#mem{width:283px; height:80px; table-layout:fixed; border-bottom:1px solid lightgray;}
	#insert{height:75px; width:40px;}
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
           <button class="f-btn" onclick="cancel();" type="button">
             <i class='bx bxs-x-circle'></i>
             취소
           </button>
           <button class="f-btn" data-bs-toggle="modal" data-bs-target="#addMem" type="button">
             <i class='bx bx-error-circle'></i>
             결재정보
           </button>
           <button class="f-btn" style="float:right;" type="button" onclick="location.href='draftList.ap'">
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
                       	 <c:forEach var="e" items="${ list }">
	                       	 <c:if test="${ e.empGrade ne 'T' }">
		                         <li><div class="wd"></div><i class='bx bxs-user'></i><button type="button" onclick="clickMem(this)" value="${e.grApprGrade }">${ e.empName }</button></li>
	                         </c:if>
	                       	 	
                         </c:forEach>
                         <li><div class="wd"></div><button class="membtn" type="button"><i class='bx bx-add-to-queue'></i></button>트레이너
                           <ul>
                             <div id="appr-mem2" style="display:none;">
                               <c:forEach var="e" items="${ list }">
                                <c:if test="${ e.empGrade eq 'T' }">
                               		<li><div class="wd"></div><i class='bx bxs-user'></i><button type="button" onclick="clickMem(this)" value="${e.grApprGrade }">${ e.empName }</button></li>
                               	</c:if>
                               </c:forEach>
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
                         <td width="110">이름</td>
                         <td width="100">직급</td>
                         <td width="30"><button><i class='bx bxs-trash'></i></button></td>
                       </tr>
                       <tr>
                         <th colspan="5" height="30" style="background:rgba(211, 211, 211, 0.5);">&nbsp;신청</th>
                       </tr>
                       <tr>
                         <td height="40" style="background:rgba(211, 211, 211, 0.3);"><button type="button" style="background:rgba(211, 211, 211, 0);"><i class='bx bx-chevrons-right'></i></button></td>
                         <td>기안</td>
                         <td>${ loginUser.empName }</td>
                         <c:choose>
                         	<c:when test="${ loginUser.empGrade eq 'C' }">
                         		<td>대표</td>
                         	</c:when>
                         	<c:when test="${ loginUser.empGrade eq 'A' }">
                         		<td>팀장</td>
                         	</c:when>
                         	<c:otherwise>
                         		<td>사원</td>
                         	</c:otherwise>
                         </c:choose>
                         <td></td>
                       </tr>
                       <tr>
                         <th colspan="5" height="30" style="background:rgba(211, 211, 211, 0.5);">&nbsp;승인</th>
                       </tr>
                       
                     </table>
                     
                     <div id="plus" width="40" style="float:left;">
                     	<table>
                     		<tr class="addmem">
		                         <td height="80" width="40" style="background:rgba(211, 211, 211, 0.3);">
			                         <button style="background:rgba(211, 211, 211, 0);" type="button" id="insert" onclick="none();">
			                         	<i class='bx bx-chevrons-right'></i>
			                         </button>
			                     </td>
	                        </tr>
                     	</table>
                     </div>
                     <div id="mem" style="float:right;">
                     	<table>
                     		
                     	</table>
                     </div>
                   </div>
                 </div>
                 <script>
                   $(function(){
                     $('.membtn').click( function() {
                       $('#appr-mem2').slideToggle(20);
                     } );
                     
                     let today = new Date();
                     let year = today.getFullYear();
                     let month = today.getMonth()+1;
                     let date = today.getDate();
                     
                     today = year + "-" + month + "-" + date;
                     
                     $("#tb1").children().children().eq(1).children().eq(1).append(today);
                   })
                   
                   function cancel(){
                	   alertify.confirm('현재 작성 중인 내용을 저장하지 않고 나가시겠습니까?', function(){ location.replace("apprMain.ap"); }
                       ).set('basic', true);
                   }
                   
                   function none(){
                	   alertify.alert("결재 승인자를 선택해주세요.").set('basic', true);
                   }
                   
                   function clickMem(btn){
                	  let val1 = $(btn).text();
                	  let val2 = $(btn).val();
             		  $("#insert").attr("onclick", "insertMem(this)");
             		  $("#insert").attr("value1", val1);
             		  $("#insert").attr("value2", val2);
                   }
                   
                   function insertMem(btn){
                	   let name = $()
                	   
                	   if($("#mem tr").length<2){	   
	                	   var value = "";
	                	   
                		   value += "<tr><td height='40' width='50'>결재</td>"
	                 	     	   + "<td width='110'>" + $(btn).attr("value1")
	                 	     	   + "</td><td width='100'>"+ $(btn).attr("value2") + "</td>"
	                 	     	   + "<td width='30'>"
	                 	     	   + "<button type='button' onclick='delete1st(this);'>"
	                 	     	   + "<i class='bx bxs-trash'></i>"
	                 	     	   + "</button></td></tr>";
	                 	     	   
                		   $("#mem>table").append(value);
                		   $("#insert").removeAttr("value");
	                 	   $("#insert").removeAttr("onclick");
	                	   
                	   }else{
                		   alertify.alert("승인자는 2명까지만 선택 가능합니다.").setHeader('');
                	   }
                   }
                   
                   function delete1st(btn){
               		   $(btn).parents("tr").remove();
               		   $(btn).parents("tr").removeAttr("value");
                	   
                   }
                   
                 </script>
                 <div class="modal-footer">
                   <button class="btn btn-primary" type="button" data-bs-dismiss="modal" id="aa" onclick="insertApprLine();">확인</button>
                   <button class="btn btn-secondary" type="button" data-bs-dismiss="modal">취소</button>
                 </div>
               </div>
             </div>
           </div>
           <script>
           		function insertApprLine(){
           			$("#tb3").show();
           			
           			if($("#mem tr").length == 1){
           				$("#tb5").hide();
           				$("#tb2 td").empty();
	           			$("#tb2").show();
	           			
	           			let value1 = $("#mem").children().children().children().eq(2).text();
	           			$("#tb2").children().children().eq(0).children().eq(1).append(value1);
	           			
	           			let value2 = $("#mem").children().children().children().eq(1).text();
	           			$("#tb2").children().children().eq(1).children().eq(0).append(value2);
           			}else{
           				$("#tb2").hide();
           				$("#tb5 td").empty();
           				$("#tb5").show();
           				
           				let value1 = $("#mem").children().children().eq(0).children().eq(2).text();
	           			$("#tb5").children().children().eq(0).children().eq(1).append(value1);
           				
	           			let value2 = $("#mem").children().children().eq(0).children().eq(1).text();
	           			$("#tb5").children().children().eq(1).children().eq(0).append(value2);
	           			
	           			let value3 = $("#mem").children().children().eq(1).children().eq(2).text();
	           			$("#tb5").children().children().eq(0).children().eq(2).append(value3);
	           			
	           			let value4 = $("#mem").children().children().eq(1).children().eq(1).text();
	           			$("#tb5").children().children().eq(1).children().eq(1).append(value4);
           			}
           		}
           </script>

           <div class="app-form1">
             <br>
             <h5 align="center" style="color:rgb(50, 50, 50);"><b>연차 신청서</b></h5>
             <br><br>
             <table id="tb1">
               <tr>
                 <th width="40%">기안자</th>
                 <td>${ loginUser.empName }</td>
               </tr>
               <tr>
                 <th>기안일</th>
                 <td></td>
               </tr>
               <tr>
                 <th>문서번호</th>
                 <td></td>
               </tr>
             </table>
             <table id="tb2" style="display:none;">
               <tr>
                 <th rowspan="3" width="25%">승인</th>
                 <td height="24px"></td>
               </tr>
               <tr>
                 <td></td>
               </tr>
               <tr>
                 <td height="24px"></td>
               </tr>
             </table>
             <table id="tb5" style="display:none;">
               <tr>
                 <th rowspan="3" width="25px">승인</th>
                 <td height="24px" width="75px"></td>
                 <td></td>
               </tr>
               <tr>
                 <td></td>
                 <td></td>
               </tr>
               <tr>
                 <td height="24px"></td>
                 <td></td>
               </tr>
             </table>
             <table id="tb3" style="display:none;">
               <tr>
                 <th rowspan="3" width="25%;">신청</th>
                 <td height="24px">사원</td>
               </tr>
               <tr>
                 <td>${loginUser.empName }</td>
               </tr>
               <tr>
                 <td height="24px"></td>
               </tr>
             </table>
             
             <table id="tb4">
               <tr>
                 <th width="20%" height="40px;">휴가 종류</th>
                 <td>
                   <select name="" id="sel1">
                     <option value="">연차</option>
                     <option value="">휴가</option>
                     <option value="">조퇴</option>
                   </select>
                 </td>
               </tr>
               <tr>
                 <th height="40px;">기간 및 일시</th>
                 <td>
                   <input type="date" class="dt"> &nbsp;~ <input type="date" class="dt">&nbsp;&nbsp;&nbsp;
                   선택일수 : <input type="text" class="dnum" value="1" readonly>
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
                   잔여연차 : <input type="text" class="dnum" value="NaN" readonly>&nbsp;&nbsp;&nbsp;
                   신청연차 : <input type="text" class="dnum" value="1" readonly>
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