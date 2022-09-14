$(function(){
	changeSelect();
    selectAllAttList(1);

})


function selectAllAttList(page){

		$.ajax({
			url: "vacList.att",
			data:{
				// searchType:$("#searchType").val(),
				// searchText:$("#searchText").val(),
				cpage:page,
			},
			type:"post",
			success:function(result){
				let value = "";
				let pageValue = "";
				
				let aList = result.aList;
				let pi = result.pi;

				if(aList.length == 0) {
					value += "<tr>"
						+ "<td colspan='9'> 직원이 없습니다. </td>"
							+ "</tr>";
				} else {
					for(let i=0; i<aList.length; i++){
						
						value += "<tr>"
							+    "<th><input type='checkbox' id='empNoInput' name='empNoInput' value='" + aList[i].empNo + "'></th>"
							+  	 "<td>" +  aList[i].empNo + "</td>"
							+  	 "<td>" +  aList[i].empName + "</td>"
							+  	 "<td>" +  aList[i].grName + "</td>"
							+  	 "<td>" +  aList[i].empEnrollDate.substr(0, 9) + "</td>"
							+  	 "<td>" +  aList[i].workYear + "</td>"
							
							if(aList[i].perYearMonthList[0].perYear === undefined) {
								value +=	"<td colspan='2'>미정</td>"
							} else {
								value +=	"<td>" + aList[i].perYearMonthList[0].perYear + "%</td>"
									   +    "<td>" + aList[i].perYearMonthList[0].perMonth + "%</td>"
							}
							
							if(aList[i].empVacList[0].plusYearVac === undefined) {
								value +=	"<td colspan='4'>미정</td>"
							} else {
								value +=	"<td>" + aList[i].empVacList[0].plusYearVac + "</td>"
									   +    "<td>" + aList[i].empVacList[0].minusYearVac + "</td>"
									   +    "<td>" + aList[i].empVacList[0].plusVac + "</td>"
									   +    "<td>" + aList[i].empVacList[0].minusVac + "</td>"
							}
								}
								
						value += "</tr>";
						
					}

						
					
					if(pi.currentPage == 1){
						// 현재페이지가 1페이지면 < 버튼 disabled
						pageValue += "<li class='page-item prev'><button disabled class='page-link'><i class='tf-icon bx bx-chevron-left'></i></button></li>";
							
					} else {
						// 현재 페이지가 1페이지가 아니면
						pageValue += "<li class='page-item prev'><button class='page-link' onclick='selectAllAttList(" + (pi.currentPage - 1) + ")'><i class='tf-icon bx bx-chevron-left'></i></button></li>";
					}
					
					for(let p=pi.startPage; p<=pi.endPage; p++) { 
						if(p == pi.currentPage) { 
								pageValue += "<li class='page-item'><button class='page-link' disabled>"  + p  + "</button></li>"
						}else {
								pageValue += "<li class='page-item'><button class='page-link' onclick='selectAllAttList(" + p +")'>" + p + "</button></li>"
						} 
					}     
			
					if(pi.currentPage == pi.maxPage) {
						pageValue += "<li class='page-item prev'><button disabled class='page-link'><i class='tf-icon bx bx-chevron-right'></i></button></li>"
					} else {
						pageValue +=	"<li class='page-item next'><button class='page-link' onclick='selectAllAttList(" + (pi.currentPage + 1) + ")'><i class='tf-icon bx bx-chevron-right'></i></button></li>"
						
					}
					
					$("#memListTBody").html(value);
					$(".pagination").html(pageValue);
			}
		,error:function(){
				console.log(" 조회용 ajax통신 실패"); 
		}
	

	})
}



function changeSelect(){
         let orderByWorkTime = $("#orderByWorkTime").val();
         let orderByAtt = $("#orderByAtt").val();
         const memListTBody = $("#memListTBody");
         
      
         
         
          $.ajax({
                   url:"orderByVac.att",
                  data:{
                    orderByWorkTime:orderByWorkTime,
                    orderByAtt:orderByAtt,
                    searchText:$("#searchText").val()
                  },
                  type:"post",
                  success:function(memList){
                    if(memList.length == 0){
                                   // 회원리스트가 비어있다면
                                 let value ='<tr><td colspan="11">존재하는 회원이 없습니다.</td></tr>'
                                 memListTBody.html(value);
                              } else {
                       let value = ""
                       for(let i = 0; i<memList.length; i++) {
                          /* $(function(){
                                if( memList[i].memAdmFlag == 'A') {
                                   $("#adminFlag").val("Admin").attr('selected', 'selected');
                                } else {
                                   $("#adminFlag").val("General").attr('selected', 'selected');
                                }
                             }) */
                          if(memList[i].memAdmFlag == 'A') {
                             memAdmFlag = "관리자"
                          } else {
                             memAdmFlag = "일반"
                          }
                          
                          if (memList[i].grName == "Basic") {
                             grSelectVal = "Basic";
                          } else if  (memList[i].grName == "Silver") {
                             grSelectVal = "Silver";
                          } else {
                             grSelectVal = "Gold";
                          }
                             
                          if (memList[i].memStatus == "Y") {
                             memStatus = "회원"
                          } else if  (memList[i].memStatus == "N") {
                             memStatus = "탈퇴회원"
                          } else {
                             memStatus = "블랙리스트"
                          }
                             
                          value += 
                             '<tr>'
                                     + '      <td><input type="checkbox" name="choice" id="choice" value="' + memList[i].memNo + '"></td> '
                                     + '     <td>' + memList[i].memNo + '</td> '
                                     + '     <td>' + memList[i].memId + '</td> '
                                     + '     <td>' + memList[i].memName + '</td> '
                                     + '     <td>' + memList[i].memPhone + '</td> '
                                     + '     <td>' + grSelectVal  + '</td> '
                                     + '     <td>' + memList[i].rptCount + '</td> '
                                     + '     <td>' + memList[i].likeCount + '</td> '
                                     + '     <td>' + memAdmFlag + '</td> '
                                     + '     <td>' + memStatus + '</td> '
                                     + '     <td>' + memList[i].bookCountMonth + '</td> '
                                     + '     <td><a class="btn btn-primary btn-sm" href="'+contextPath+'/memDetailView.me?no='+ memList[i].memNo +'">상세조회</a></td>'
                                     + '  </tr> '
                                     + '<input type="hidden" value="'+ memList[i].memNo +'">'
                     }
                    //searchText.html("");
                    memListTBody.html(value);
                    
                  }
            },
            error:function(){
              console.log("회원목록 조회용 ajax 통신 실패");
            }
            
         })
   }