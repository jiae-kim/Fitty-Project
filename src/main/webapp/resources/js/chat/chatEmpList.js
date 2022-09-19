/**
 * 
 */
 
 
 $(function(){
	$("#nextBtn").attr("disabled", true);
	$("#rightArrow").css("color", "#DCDADA");
    selectAllAttList(1);

    let month = Number($("#thisMonth").val());
    let year = Number($("#thisYear").val());

    $(document).ready(function(){
    	$("#nextBtn").on("click",function() {
    		
    		if(month < 12) {
    			month = month + 1;
    			$("#thisMonth").val(month);	
    		    nowCheck();
    		} else {
    			month = 1;
    			year = year + 1;
    			$("#thisMonth").val(month);
    			$("#thisYear").val(year);
    		    nowCheck();
    		}
    		})
})
 
 
 
 function changeSelect(){
	let orderByWorkTime = $("#orderByWorkTime").val();
	let orderByAtt = $("#orderByAtt").val();
	let memListTBody = $("#memListTBody");
	
 	$("input:radio[name='orderByPercent']:radio[value='selectAll']").prop('checked', true); 
	
	 $.ajax({
			  url:"chatEmp.ch",
			 data:{
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
							+    "<th><input type='checkbox'  class='no' id='empNoInput' name='empNoInput' value='" + aList[i].empNo + "'></th>"
							+  	 "<td>" +  aList[i].empNo + "</td>"
							+  	 "<td>" +  aList[i].empName + "</td>"
							+  	 "<td>" +  aList[i].grName + "</td>"
							+  	 "<td>" +  aList[i].empEnrollDate.substr(0, 11) + "</td>"
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
										+    "<td>" + "잔여연월차" + "</td>"
										+    "<td>" + aList[i].empVacList[0].plusVac + "</td>"
										+    "<td>" + aList[i].empVacList[0].minusVac + "</td>"
										+    "<td>" + "잔여휴가" + "</td>"
										+    "<td>" + "<a class='btn btn-sm rounded-pill btn-outline-primary' href='detail.vac?no='" + aList[i].empNo + "'>조회</td>"
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