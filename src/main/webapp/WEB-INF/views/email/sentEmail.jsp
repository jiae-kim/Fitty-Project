<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="resources/css/mail.css" />
</head>
<body>
		<jsp:include page="../common/header.jsp"/>
          <div class="content-wrapper">
            <div class="container-xxl flex-grow-1 container-p-y" style="padding : 0px;">
              <div class="row">
                  <!-- 메일 리스트 -->
                  <div class="col-md-2 ">
                    <div class="card mb-4 vacDetailDiv">
                        <h2 class="card-header"><b>E-MAIL</b></h2>
                        <div class="card-body">
			              <a href="insert.em" type="button" class="btn btn-primary modifyBtn">메일 쓰기</a>	
                          <br><br><br>
                          
                          <div class="mailList">
                           <div class="mail-content" style="border: 0px;">
                            <br>
                            <a href="received.em" type="button" class="btn btn-outline-primary" style="border: 0px;">받은메일함</a>
                            <a href="sent.em" type="button" class="btn btn-outline-primary" style="border: 0px;">보낸메일함</a>
                            <a href="stm.em" type="button" class="btn btn-outline-primary" style="border: 0px;">내게쓴메일함</a>
                            <a href="tem.em" type="button" class="btn btn-outline-primary" style="border: 0px;">임시보관함</a><br>
                            <a href="trash.em" type="button" class="btn btn-outline-primary" style="border: 0px;">휴지통</a>
                            <br><br>
                           </div>
                          
                          
                          </div>
                      
                        </div>
                    </div>
                  </div>
                
                  <!-- 보낸메일함 -->
                  <div class="col-md-10 ">
                    <div class="card mb-4 vacDetailDiv checkbox-group"><br>
                      <h2><b>&nbsp;&nbsp;📩 보낸메일함</span></b></h2>
                      <div class="demo-inline-spacing">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        
                          <input class="form-check-input" type="checkbox" value="" id="checkAll" />
                          <!-- <label class="form-check-label" for="defaultCheck1"></label> -->
                        
                        <button type="button" class="btn btn-sm btn-primary">읽음</button>
                        <button type="button" class="btn btn-sm btn-danger">삭제</button>
                        <button type="button" class="btn btn-sm btn-info">답장</button>
                        <button type="button" class="btn btn-sm btn-warning">전달</button>
                      </div>
                      <br>
                      <div class="table-responsive text-nowrap">
                        <table class="table card-table">
                       
                          <tbody class="table-border-bottom-0">
                          
                          <c:forEach var="m" items="${ mList }">
                            <tr>
                              <td><input class="form-check-input selectedCheck" type="checkbox" value="" id="defaultCheck1" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class='bx bx-envelope'></i></td>
                              <td>${ m.emRecipient }</td>
                              <td>
                                <span>${ m.emTitle }</span>
                              </td>
                              <td><span class="badge bg-label-primary me-1">${ m.emSdate }</span></td>
                            </tr>
                     		</c:forEach>
                     		
                          </tbody>
                        </table>
                      </div>
                   
                    </div>
                  </div>


          </div>
      </div>
      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>

<script type="text/javascript" src="resources/js/mail.js"></script>

</body>
</html>