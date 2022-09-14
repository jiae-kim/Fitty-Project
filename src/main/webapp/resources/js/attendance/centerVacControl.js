$(function(){

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
							+    "<td>" + aList[i].perYearMonthList[0].perYear + "%</td>"
							+    "<td>" + aList[i].perYearMonthList[0].perMonth + "%</td>"
							+    "<td>" + aList[i].empVacList[0].plusYearVac + "</td>"
							+    "<td>" + aList[i].empVacList[0].minusYearVac + "</td>"
							+    "<td>" + aList[i].empVacList[0].plusVac + "</td>"
							+    "<td>" + aList[i].empVacList[0].minusVac + "</td>"
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