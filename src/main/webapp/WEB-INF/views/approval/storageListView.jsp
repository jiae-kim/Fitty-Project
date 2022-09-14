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
	.select{font-weight:bold;color:#696CFF;}
	#dTable{
	  font-size:13px;
	  width:100%;
	  text-align:center;
	  accent-color:#696CFF;
	}
	#dTable tr{border-bottom:1px solid lightgray;}
	#sel1, #sel2{
	  width:80px; 
	  font-size:13px; 
	  height:30px;
	  border:1px solid lightgray;
	  border-radius:5px;
	}
	#search{
	  width:250px;
	  font-size:13px; 
	  height:30px;
	  border:1px solid lightgray;
	  border-top-left-radius:5px;
	  border-bottom-left-radius:5px;
	  border-right:0px;
	
	}
	#s-btn{
	  width:35px;
	  height:30px;
	  border:1px solid lightgray;
	  border-top-right-radius:5px;
	  border-bottom-right-radius:5px;
	  border-left:0px;
	}
	.m-btn{
	  border:0px;
	  background-color:white;
	  font-size:13px;
	  font-weight:bold;
	  margin-bottom:5px;
	  color:gray;
	}
	#sta4{
	  background-color: rgb(41, 204, 249);
	  color:white;
	  font-size:12px;
	  width:60px;
	  height:20px;
	  border-radius: 5px;
	}
	#del-btn{
	  border:0px;
	  background-color:white;
	  font-size:14px;
	}
	.check{accent-color:rgb(105, 108, 255);}
</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"/>
	
	<div class="outer">
		<jsp:include page="sideMenu.jsp"/>
		
		<div class="main">
	          <h4 style="color:rgb(50, 50, 50);">임시 저장함</h4><br>
	          <button id="del-btn">
	            <i class='bx bxs-trash'></i>
	            문서 삭제
	          </button><br><br>
	          <table id="dTable" align="center">
	            <tr style="background:rgb(231, 231, 255)">
	              <th><input type="checkbox" class="check"></th>
	              <th>기안일</th>
	              <th>결재양식</th>
	              <th width="35%;">제목</th>
	              <th>첨부파일</th>
	              <th>문서번호</th>
	              <th height="30" width="7%;">결재상태</th>
	            </tr>
	            
	            <c:choose>
		            <c:when test="${ not empty list }">
		            	<c:forEach var="s" items="${ list }">		            	
				            <tr>
				              <td><input type="checkbox" class="check"></td>
				              <td>${ s.apprEnrollDate }</td>
				              <c:choose>
					              <c:when test="${ s.apprDocType eq 1 }">
					              	<td>휴가신청</td>
					              </c:when>
					              <c:when test="${ s.apprDocType eq 2 }">
					              	<td>연장근무신청</td>
					              </c:when>
					              <c:otherwise>
					              	<td>지출결의서</td>
					              </c:otherwise>
				              </c:choose>
				              <td>${ s.apprTitle }</td>
				              <td></td>
				              <td>${ s.apprNo }</td>
				              <td height="30" align="center"><div id="sta4">임시저장</div></td>
				            </tr>
		            	</c:forEach>
		            </c:when>
		            <c:otherwise>
		            	<tr>
		            		<td colspan=7 height="30">문서가 없습니다.</td>
		            	</tr>
		            </c:otherwise>
	            </c:choose>
	          </table>
	          <br><br>
			
				<div class="paging-area">
					<nav aria-label="Page navigation">
		              <ul class="pagination justify-content-center">
		              
		              	<c:choose>
		              		<c:when test="${ pi.currentPage eq 1 }">
		              			<li class="page-item prev disabled">
				                  <a class="page-link"
				                    ><i class="tf-icon bx bx-chevron-left"></i
				                  ></a>
				                </li>
		              		</c:when>
		              		<c:otherwise>
		              			<li class="page-item prev">
				                  <a class="page-link" href="storageList.ap?cpage=${ pi.currentPage-1 }"
				                    ><i class="tf-icon bx bx-chevron-left"></i
				                  ></a>
				                </li>
		              		</c:otherwise>
		                </c:choose>
		                
		                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		                	<c:choose>
		                		<c:when test="${ p eq currentPage }">
					                <li class="page-item active disabled">
					                  <a class="page-link" href="storageList.ap?cpage=${ p }">${ p }</a>
					                </li>
					            </c:when>
					            <c:otherwise>
					            	<li class="page-item">
					                  <a class="page-link" href="storageList.ap?cpage=${ p }">${ p }</a>
					                </li>
					            </c:otherwise>
			                </c:choose>
		                </c:forEach>
		                
		                <c:choose>
		              		<c:when test="${ pi.currentPage eq pi.maxPage }">
		              			<li class="page-item next disabled" >
				                  <a class="page-link"
				                    ><i class="tf-icon bx bx-chevron-right"></i
				                  ></a>
				                </li>
		              		</c:when>
		              		<c:otherwise>
		              			<li class="page-item next">
				                  <a class="page-link" href="storageList.ap?cpage=${ pi.currentPage+1 }"
				                    ><i class="tf-icon bx bx-chevron-right"></i
				                  ></a>
				                </li>
		              		</c:otherwise>
		                </c:choose>
		                
		              </ul>
		            </nav>
	            </div>
	            <br>
	          <div align="center">
	            <select name="" id="sel1">
	              <option value="">전체기간</option>
	              <option value="">1개월</option>
	              <option value="">6개월</option>
	              <option value="">1년</option>
	            </select>
	            <select name="" id="sel2">
	              <option value="">제목</option>
	              <option value="">결재양식</option>
	              <option value="">기안자</option>
	            </select>
	            <input type="text" id="search"><button id="s-btn">
	              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
	              <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
	              </svg>
	            </button>
	          </div>
	        </div>
	</div>

</body>
</html>