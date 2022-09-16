$(function(){

    selectAllAttList(1);
	
	$(document).ready(function(){
		$("#orderByWorkTime").on("change",function(){
			changeSelect();	
		})
	})
	
	$(document).ready(function(){
		$("#searchBtn").on("click",function(){
			changeSelect();	
		})
	})
	
	$(document).ready(function(){
		$('input:radio[name=orderByPercent]').on("click",function(){
			filterPercent();	
		})
	})
	
})

function checkAll() {
         if($("#choiceAll").is(':checked')) {
            $("#memListTBody :checkbox:not(:disabled)").prop("checked", true);
            $("tfoot :checkbox").prop("checked", true);
         } else {
            $("#memListTBody :checkbox:not(:disabled)").prop("checked", false);
            $("tfoot :checkbox").prop("checked", false);
         }
      }  

function selectAllAttList(page){
		
		$("input:radio[name='orderByPercent']:radio[value='selectAll']").prop('checked', true); 
		
		$.ajax({
			url: "vacList.att",
			data:{
				addSql : $("#orderByWorkTime").val(),
				sqlEmpName :$("#searchText").val(),
				searchFlag : "N",
				cpage:page
			},
			type:"post",
			success:function(result){
			
			
				let value = "";
				let pageValue = "";
				
				let aList = result.aList;
				let pi = result.pi;
				

				if(aList.length == 0) {
					value += "<tr>"
						+ "<td colspan='12'> 직원이 없습니다. </td>"
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
					$("#selectAll").attr("checked", true);
			}
		,error:function(){
				console.log("페이지 로딜 리스트 조회용 ajax통신 실패"); 
		}
	

	})
}



function changeSelect(){
	let orderByWorkTime = $("#orderByWorkTime").val();
	let orderByAtt = $("#orderByAtt").val();
	let memListTBody = $("#memListTBody");
	
 	$("input:radio[name='orderByPercent']:radio[value='selectAll']").prop('checked', true); 
	
	 $.ajax({
			  url:"orderByVac.att",
			 data:{
			   orderByWorkTime:orderByWorkTime,
			   //orderByAtt:orderByAtt,
			   searchText:$("#searchText").val()
			 },
			 type:"post",
			 success:function(result){
			    let value = "";
		  	    let pageValue = "";
		   
				let aList = result.aList;
				let pi = result.pi;
				
				
				
				if(aList.length == 0) {
					value += "<tr>"
						+ "<td colspan='12'> 직원이 없습니다. </td>"
							+ "</tr>";
				} else {
					for(let i=0; i<aList.length; i++){
						
						value += "<tr>"
							+    "<th><input type='checkbox' id='empNoInput' name='empNoInput' value='" + aList[i].empNo + "'></th>"
							+  	 "<td>" +  aList[i].empNo + "</td>"
							+  	 "<td>" +  aList[i].empName + "</td>"
							+  	 "<td>" +  aList[i].grName + "</td>"
							+  	 "<td>" +  aList[i].empEnrollDate.substr(0, 10) + "</td>"
							+  	 "<td>" +  aList[i].workYear + "</td>"
							
							if(aList[i].perYearMonthList[0].perYear === undefined) {
								value +=	"<td colspan='2'>미정</td>"
							} else {
								value +=	"<td>" + aList[i].perYearMonthList[0].perYear + "%<input type='hidden' value='" + (i) + "'></td>"
									  +     "<td>" + aList[i].perYearMonthList[0].perMonth + "%<input type='hidden' value='" + (i) + "'></td>"
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
					$("#selectAll").attr("checked", true);
			   
			 }
	   ,
	   error:function(){
		 console.log("회원목록 조회용 ajax 통신 실패");
	   }
	   
	})
}


function filterPercent(){
	
	let orderByPercent = $('input:radio[name=orderByPercent]:checked').val();
	
	
	
	if(orderByPercent == "over80"){
		$("#memListTBody tr th" ).css( 'background-color', 'white' );
		$("#memListTBody tr th input" ).removeAttr( 'disabled' );
		
		 let perYear = $("#memListTBody tr td:nth-child(7)").text();
		 const perYearArr = perYear.split("%");
		 let value = "";
		 for(let i=0; i<perYearArr.length-1; i++){
		 	if(Number(perYearArr[i]) < 80) {
				value += i + "%";
		 	}
		 }
		 $("#invalidNoYear").val(value);
		 let disabledNo = ($("#invalidNoYear").val().split("%"));
		 for(let i=0; i<disabledNo.length-1; i++){
		  $("#memListTBody tr th" ).eq( disabledNo[i] ).css( 'background-color', '#f0f0f0' );
		  $("#memListTBody tr th input" ).eq( disabledNo[i] ).attr( 'disabled', 'true' );
		 }
		 
	} else if(orderByPercent == "over100") {
		$("#memListTBody tr th" ).css( 'background-color', 'white' );
		$("#memListTBody tr th input" ).removeAttr( 'disabled' );
	
		let perMonth = $("#memListTBody tr td:nth-child(8)").text();
		const perMonthArr = perMonth.split("%");
		 
		 let value = "";
		 
		 for(let i=0; i<perMonthArr.length-1; i++){
		 	if(Number(perMonthArr[i]) != 80) {
				value += i + "%";
		 	}
		 }
		 $("#invalidNoMon").val(value);
		 let disabledNo = ($("#invalidNoMon").val().split("%"));
		 for(let i=0; i<disabledNo.length-1; i++){
		  $("#memListTBody tr th" ).eq( disabledNo[i] ).css( 'background-color', '#f0f0f0' );
		  $("#memListTBody tr th input" ).eq( disabledNo[i] ).attr( 'disabled', 'true' );
         }
	} else {
		$("#memListTBody tr th" ).css( 'background-color', 'white' );
		$("#memListTBody tr th input" ).removeAttr( 'disabled' );
	}

	
}



function openVacationModal(){
		let strInsertVacListEmpNo = "";
   
	   $("#memListTBody :checkbox:checked").each(function(){
	     strInsertVacListEmpNo += "'" + $(this).val() + "',";
	   })
	   
	   strInsertVacListEmpNo = strInsertVacListEmpNo.substring(0, strInsertVacListEmpNo.lastIndexOf(","));
	   $("#strInsertVacListEmpNo").val(strInsertVacListEmpNo);
	   
	   //console.log(strInsertVacListEmpNo);
	   //console.log($("#strInsertVacListEmpNo").val());
	   
		$.ajax({
			url: "openVacModal.vac",
			data:{
				empNo : $("#strInsertVacListEmpNo").val()
			},
			type:"post",
			success:function(empList){
			
				let empValue = "";
				let empNoValue = "";
				
				if(empList.length == 0) {
					$("#modalEmpList").val("선택된 직원이 없습니다.");
				} else {
					for(let i=0; i<empList.length; i++){
						empValue += empList[i].empName
								 + ", " 
						empNoValue += empList[i].empNo
								 + ", " 
					}
				 empValue = empValue.substring(0, empValue.lastIndexOf(","));
				 empNoValue = empNoValue.substring(0, empNoValue.lastIndexOf(","));
				 $("#modalEmpList").val(empValue);
				 $("#modalEmpNoList").val(empNoValue);
				}
			}
		,error:function(){
				console.log("페이지 로딜 리스트 조회용 ajax통신 실패"); 
		}
	

	})
}


function openVacationModal(){
		let strInsertVacListEmpNo = "";
   
	   $("#memListTBody :checkbox:checked").each(function(){
	     strInsertVacListEmpNo += "'" + $(this).val() + "',";
	   })
	   
	   strInsertVacListEmpNo = strInsertVacListEmpNo.substring(0, strInsertVacListEmpNo.lastIndexOf(","));
	   $("#strInsertVacListEmpNo").val(strInsertVacListEmpNo);
	   
	   
		$.ajax({
			url: "openVacModal.emp",
			data:{
				empNo : $("#strInsertVacListEmpNo").val()
			},
			type:"post",
			success:function(empList){
			
				let empValue = "";
				let empNoValue = "";
				
				if(empList.length == 0) {
					$("#modalEmpList").val("선택된 직원이 없습니다.");
				} else {
					for(let i=0; i<empList.length; i++){
						empValue += empList[i].empName
								 + ", " 
						empNoValue += empList[i].empNo
								 + ", " 
					}
				 empValue = empValue.substring(0, empValue.lastIndexOf(","));
				 empNoValue = empNoValue.substring(0, empNoValue.lastIndexOf(","));
				 $("#modalEmpList").val(empValue);
				 $("#modalEmpNoList").val(empNoValue);
				}
			}
		,error:function(){
				console.log("페이지 로딜 리스트 조회용 ajax통신 실패"); 
		}
	

	})
}

function insertVac(){

$.ajax({
			url: "insertVac.vac",
			data:{
				empNo : $("#empNo").val(),
				vacNormal : $("#vacNormal").val(),
				vacOper : $("#vacOper").val()
			},
			type:"post",
			success:function(empList){
			
				let empValue = "";
				let empNoValue = "";
				
				if(empList.length == 0) {
					$("#modalEmpList").val("선택된 직원이 없습니다.");
				} else {
					for(let i=0; i<empList.length; i++){
						empValue += empList[i].empName
								 + ", " 
						empNoValue += empList[i].empNo
								 + ", " 
					}
				 empValue = empValue.substring(0, empValue.lastIndexOf(","));
				 empNoValue = empNoValue.substring(0, empNoValue.lastIndexOf(","));
				 $("#modalEmpList").val(empValue);
				 $("#modalEmpNoList").val(empNoValue);
				}
			}
		,error:function(){
				console.log("페이지 로딜 리스트 조회용 ajax통신 실패"); 
		}
	

	})

}
