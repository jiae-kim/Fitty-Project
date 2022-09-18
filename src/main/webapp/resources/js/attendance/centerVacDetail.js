/**
 * 
 */
 
 

		
 $(function(){
 	vacList();
 	console.log($("#empNoInput").val());
 	
 	
 	$(document).ready(function(){
		$("#orderByYear").on("change",function(){
			changeYearTable();
			vacList();	
		})
	})
 	
 	$(document).ready(function(){
		$("#orderByVac").on("change",function(){
			changeVacTable();
			vacList();	
		})
	})
	
 })
 
function changeYearTable(){
  let value= "";


 	if($("#orderByYear").val() === "all"){
		value += "<tr>"
				+  "<th>지급/차감</th>"
				+  "<th>요청일</th>"
				+  "<th>종류</th>"
				+  "<th>사유</th>"
				+  "<th>일수</th>"
			  +  "</tr>"
	} else if($("#orderByYear").val() === "give"){
		value += "<tr>"
				+  "<th>지급일</th>"
				+  "<th>종류</th>"
				+  "<th>사유</th>"
				+  "<th>일수</th>"
			  +  "</tr>"
	} else {
		value += "<tr>"
				+  "<th>시작일</th>"
				+  "<th>종료일</th>"
				+  "<th>종류</th>"
				+  "<th>사유</th>"
				+  "<th>일수</th>"
			  +  "</tr>"
	}
	console.log(value)
	$("#yearVacThead").html(value);
	$("#yearVacTfoot").html(value);
 }
 
 
function changeVacTable(){
  let value= "";


 	if($("#orderByVac").val() === "all"){
		value += "<tr>"
				+  "<th>지급/차감</th>"
				+  "<th>요청일</th>"
				+  "<th>종류</th>"
				+  "<th>사유</th>"
				+  "<th>일수</th>"
			  +  "</tr>"
	} else if($("#orderByVac").val() === "give"){
		value += "<tr>"
				+  "<th>지급일</th>"
				+  "<th>종류</th>"
				+  "<th>사유</th>"
				+  "<th>일수</th>"
			  +  "</tr>"
	} else {
		value += "<tr>"
				+  "<th>시작일</th>"
				+  "<th>종료일</th>"
				+  "<th>종류</th>"
				+  "<th>사유</th>"
				+  "<th>일수</th>"
			  +  "</tr>"
	}
	console.log(value)
	$("#realVacThead").html(value);
	$("#realVacTfoot").html(value);
 }
 
 
  function vacList(){

		$.ajax({
			url: "vacList.vac",
			data:{
				empNo : $("#empNoInput").val(),
				orderByYear :$("#orderByYear").val(),
				orderByVac:$("#orderByVac").val()
			},
			type:"post",
			success:function(resultMap){
			
				let yearVacUse = ""
				let realVacUse = ""
				
				let yearVacList = resultMap.yearVacList;
				let realVacList = resultMap.realVacList;
				console.log(resultMap);
				console.log(yearVacList);
				console.log(realVacList);
				
				if($("#orderByYear").val() === "all"){
					for(let i = 0; i<yearVacList.length; i++) {
						yearVacUse += "<tr>"
							if(yearVacList[i].vacStatus === "P") {
								yearVacUse += "<td><span class='badge rounded-pill bg-label-success'>지급</span></td>"
							} else {
								yearVacUse += "<td><span class='badge rounded-pill bg-label-danger'>차감</span></td>"
							}
								yearVacUse +=  "<td>" + yearVacList[i].vacCreateDate + "</td>"
										   +   "<td>" + yearVacList[i].vacNormal + "</td>"
										   +   "<td>" + yearVacList[i].attStatus + "</td>"
										   +  "<td>" + yearVacList[i].vacOper + "</td>"
								   + "</tr>"
								   }
				} else if ($("#orderByYear").val() === "give") {
					for(let i = 0; i<yearVacList.length; i++) {
						yearVacUse += "<tr>"
										+  "<td>" + yearVacList[i].vacCreateDate + "</td>"
										+  "<td>" + yearVacList[i].vacNormal + "</td>"
										+  "<td>" + yearVacList[i].attStatus + "</td>"
										+  "<td>" + yearVacList[i].vacOper + "</td>"
								+ "</tr>"
					}
				} else {
					for(let i = 0; i<yearVacList.length; i++) {
						yearVacUse += "<tr>"
							+  "<td>" + yearVacList[i].vacStart + "</td>"
							+  "<td>" + yearVacList[i].vacEnd + "</td>"
							+  "<td>" + yearVacList[i].vacNormal + "</td>"
							+  "<td>" + yearVacList[i].attStatus + "</td>"
							+  "<td>" + yearVacList[i].vacOper + "</td>"
					+ "</tr>"
					}
				}


				if($("#orderByVac").val() === "all"){
					for(let i = 0; i<realVacList.length; i++) {
						realVacUse += "<tr>"
							if(realVacList[i].vacStatus === "P") {
								realVacUse += "<td><span class='badge rounded-pill bg-label-success'>지급</span></td>"
							} else {
								realVacUse += "<td><span class='badge rounded-pill bg-label-danger'>차감</span></td>"
							}
								realVacUse +=  "<td>" + realVacList[i].vacCreateDate + "</td>"
										   +   "<td>" + realVacList[i].vacNormal + "</td>"
										   +   "<td>" + realVacList[i].attStatus + "</td>"
										   +   "<td>" + realVacList[i].vacOper + "</td>"
										+ "</tr>" 
									}
				} else if ($("#orderByYear").val() === "give") {
					for(let i = 0; i<realVacList.length; i++) {
						realVacUse += "<tr>"
										+ "<td>" + realVacList[i].vacCreateDate + "</td>"
										+   "<td>" + realVacList[i].vacNormal + "</td>"
										+   "<td>" + realVacList[i].attStatus + "</td>"
										+   "<td>" + realVacList[i].vacOper + "</td>"
									+ "</tr>"
					}
				} else {
					for(let i = 0; i<realVacList.length; i++) {
						realVacUse += "<tr>"
							+   "<td>" + realVacList[i].vacStart + "</td>"
							+   "<td>" + realVacList[i].vacEnd + "</td>"
							+   "<td>" + realVacList[i].vacNormal + "</td>"
							+   "<td>" + realVacList[i].attStatus + "</td>"
							+   "<td>" + realVacList[i].vacOper + "</td>"
						+ "</tr>"
					}
				}
				
				
				
				$("#yearVacTbody").html(yearVacUse);
				$("#realVacTbody").html(realVacUse);
				
		}
			
		,error:function(){
				console.log("페이지 로딜 리스트 조회용 ajax통신 실패"); 
		}
	

	})
	
}
