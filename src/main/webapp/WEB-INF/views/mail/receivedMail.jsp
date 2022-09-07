<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.bx-envelope-open {
	  font-size:25px;
	    color: #696CFF;
	    margin : 2px;
	}
	
	.vacDetailDiv{
	  height: 759px;
	}
	
	.card-header{
	  padding: 35px 25px 20px 25px;
	  text-align: center;
	  justify-content: center;
	  margin: auto;
	  align-items: center;
	}
	
	
	
	#todayWork{
	  margin-top: 20px;
	  font-size: 12px;
	}
	
	
	.card-header{
	  color: #696CFF;
	}
	
	.vacSimple{
	    display: flex;
	    height: 130px;
	    width: 95%;
	    margin: auto;
	}
	
	.vacSimple *{
	  line-height:1.1;
	  align-items: center;
	  margin: auto;
	  text-align: center;
	}
	
	.bxs-user-circle{
	  font-size: 70px;
	  color: #696CFF;
	  margin-bottom: 5px;
	}
	
	.profileName{
	  font-size: 12px;
	}
	
	
	#workTime{
	  font-size: 48px;
	  color: #696CFF;
	}
	
	
	#todayWork td{
	  text-align: right;
	}
	
	.workChange{
	  margin-top: 30px;
	  width: 100%;
	  margin-bottom: 10px;
	}
	
	.modifyBtn, .exelDownBtn{
	  width: 100%;
	  margin-bottom: 10px;
	}
	
	.mailList{
	    display: flex;
	    width:100%;
	    height: 200px;
	    background-color:#F5F5F9;
	    font-size: 12px;
	    border-radius: 10px;
	    align-items: center;
	    text-align: center;
	}
	
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
          <div class="content-wrapper">
            <div class="container-xxl flex-grow-1 container-p-y">
              <div class="row">
                  <!-- 메일 리스트 -->
                  <div class="col-md-2 ">
                    <div class="card mb-4 vacDetailDiv">
                        <h2 class="card-header"><b>E-MAIL</b></h2>
                        <div class="card-body">
                          <button class="btn btn-primary modifyBtn">메일 쓰기</button>

                          <br><br><br>
                          
                          <div class="mailList">
                           <div class="mail-content" style="border: 0px;">
                            <br>
                            <button type="button" class="btn btn-outline-primary" style="border: 0px;">받은메일함</button>
                            <button type="button" class="btn btn-outline-primary" style="border: 0px;">보낸메일함</button>
                            <button type="button" class="btn btn-outline-primary" style="border: 0px;">내게쓴메일함</button>
                            <button type="button" class="btn btn-outline-primary" style="border: 0px;">임시보관함</button><br>
                            <button type="button" class="btn btn-outline-primary" style="border: 0px;">휴지통</button>
                            <br><br>
                           </div>
                          
                          
                          </div>
                      
                        </div>
                    </div>
                  </div>
                
                  <!-- 받은메일함 -->
                  <div class="col-md-10 ">
                    <div class="card mb-4 vacDetailDiv"><br>
                      <h2><b>&nbsp;&nbsp;📨 받은메일함</span></b></h2>
                      <div class="demo-inline-spacing">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        
                          <input class="form-check-input" type="checkbox" value="" id="defaultCheck1" />
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
                            <tr>
                              <td><input class="form-check-input" type="checkbox" value="" id="defaultCheck1" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class='bx bx-envelope-open'></i></td>
                              <td>보낸사람</td> <!--이 자리에 사원이름을 넣을건지 이메일을 넣을건지 고민-->
                              <td>메일제목이 들어갈 자리 메일제목이 들어갈 자리 </td>
                              <td>받은날짜시간</td>
                              
                            </tr>
                            <tr>
                              <td><input class="form-check-input" type="checkbox" value="" id="defaultCheck1" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class='bx bx-envelope'></i></td>
                              <td>Barry Hunter</td>
                              <td>
                                <span>메일제목이 들어갈 자리 메일제목이 들어갈 자리</span>
                              </td>
                              <td><span class="badge bg-label-primary me-1">20:18:17</span></td>
                     
                            </tr>
                            <tr>
                              <td><input class="form-check-input" type="checkbox" value="" id="defaultCheck1" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class='bx bx-envelope-open'></i></td>
                              <td>Trevor Baker</td>
                              <td>
                                <span>메일제목이 들어갈 자리 메일제목이 들어갈 자리</span>
                              </td>
                              <td><span class="badge bg-label-primary me-1">20:45:22</span></td>
                    
                            </tr>
                            <tr>
                              <td>
                                <input class="form-check-input" type="checkbox" value="" id="defaultCheck1" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class='bx bx-envelope-open'></i></strong>
                              </td>
                              <td>Jerry Milton</td>
                              <td>
                                <span>메일제목이 들어갈 자리 메일제목이 들어갈 자리</span>
                              </td>
                              <td><span class="badge bg-label-primary me-1">22:59:10</span></td>
                        
                            </tr>
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

</body>
</html>