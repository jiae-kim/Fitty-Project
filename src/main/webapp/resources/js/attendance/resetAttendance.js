/*  reset attendance */
 $(function(){

	selectEmpList();
	
	$(document).on("click",".empList>tbody>tr",function(){
				let strInsertListEmpNo = "";
			
				 $(".empList :checkbox:checked").each(function(){
			                          strInsertListEmpNo += "'" + $(this).val() + "',";
			                       })
			                  
			     strInsertListEmpNo = strInsertListEmpNo.substring(0, strInsertListEmpNo.lastIndexOf(","));
			     console.log(strInsertListEmpNo); 
			     $("#strInsertListEmpNo").val(strInsertListEmpNo);
    		})
    
    
    $(document).ready(function(){
    	$("#addEmpList").on("click",function() {
    		checkEmpNoList();
    		})
    })
    
    
    $(document).on("click",".printEmpList>tbody>tr>td>button",function(){
				let deleteEmpNo = "'" + $(this).val() + "'";
			     $("#deleteEmpNo").val(deleteEmpNo);
			    deleteEmpNoList(deleteEmpNo);
    		})
        
})


function checkAll() {
         if($("#choiceAll").is(':checked')) {
            $(".empList :checkbox").prop("checked", true);
             $("tfoot :checkbox").prop("checked", true);
         } else {
            $(".empList :checkbox").prop("checked", false);
            $("tfoot :checkbox").prop("checked", false);
         }
      }  

function selectEmpList(){
    		$.ajax({
    			url:"reset.att",
    			success:function(levelEmpList){
    				let value="";
    				
    				if(levelEmpList.length == 0) {
    					value += "<tr><td>등록된 직원이 없습니다.</td></tr>"
    				} else {
    					value += "<thead>"
    						  +		"<tr>"
    						  +			"<th><input type='checkbox' name='choiceAll' id='choiceAll' onclick='checkAll();'></th>" 
    						  +			"<th>이름</th>"
    						  +			"<th>직급</th>"
    						  +			"<th>사번</th>"
    						  +		"</tr>"
    						  +  "</thead>"
							  +  "<tbody>"
	    				for(let i=0; i<levelEmpList.length; i++){
	    				  	value += "<tr> "
	    				  		+ "<td><input type='checkbox' name='empNo' value='" +  levelEmpList[i].empNo + "'></td>"
	    				  		+ "<td><b>  " + levelEmpList[i].empName + "</b></td>" 
	    				  		+ "<td>" + levelEmpList[i].empGrade + "</td>"
	    				  		+ "<td>" + levelEmpList[i].empNo + "</td>"
	    				  		+ "</tr>"
	    				}
	    					value += "</tbody>"
    				}
					$(".empList").html(value);
					$(".empList :checkbox").prop("checked", false);
    			},
    			error:function(){
    				console.log("직원리스트 조회용 ajax 통신 실패");
    			}
    		})
}




function checkEmpNoList(){

		let strInsertListEmpNo = "";
		
		$(".empList :checkbox:checked").each(function(){
		     strInsertListEmpNo += "'" + $(this).val() + "',";
		})
		   
		strInsertListEmpNo = strInsertListEmpNo.substring(0, strInsertListEmpNo.lastIndexOf(","));
		$("#strInsertListEmpNo").val(strInsertListEmpNo);
		
    		$.ajax({
    			type: "post",
    			url:"listInsert.att",
    			data : {strInsertListEmpNo : $("#strInsertListEmpNo").val()},
    			success:function(checkEmpList){
    				let value="";
    				if(checkEmpList.length == 0) {
    					value += "<tr><td>선택된 직원이 없습니다.</td></tr>"
    				} else {
    					value += "<thead>"
    						  +		"<tr>"
    						  +			"<th>이름</th>"
    						  +			"<th>직급</th>"
    						  +			"<th>사번</th>"
    						  +			"<th>삭제</th>" 
    						  +		"</tr>"
    						  +  "</thead>"
							  +  "<tbody>"
	    				for(let i=0; i<checkEmpList.length; i++){
	    				  	value += "<tr> "
	    				  		+ "<td><b>  " + checkEmpList[i].empName + "</b></td>" 
	    				  		+ "<td>" + checkEmpList[i].empGrade + "</td>"
	    				  		+ "<td>" + checkEmpList[i].empNo + "</td>"
	    				  		+ "<td><button type='button' class='btn btn-sm btn-danger' value='"+checkEmpList[i].empNo+"' id='deleteListBtn'>삭제</button></td>"
	    				  		+ "</tr>"
	    				}
	    					value += "</tbody>"
    				}
					$(".printEmpList").html(value);
					$("#afterEmpNoList").val($("#strInsertListEmpNo").val());
    			},
    			error:function(){
    				console.log("선택된 직원리스트 조회용 ajax 통신 실패");
    			}
    		})
}



function deleteEmpNoList(deleteEmpNo){

    		$.ajax({
    			type: "post",
    			url:"listDelete.att",
    			data : {
    				strInsertListEmpNo : $("#strInsertListEmpNo").val(),
    				deleteEmpNo : deleteEmpNo
    				},
    			success:function(result){
    				
    				let value="";
    				let deleteEmpNoList = result.deleteEmpNoList;
    				let afterEmpNoList = result.empNo;
    				
    				
    				if(deleteEmpNoList.length == 0) {
    					value += "<tr><td>등록된 직원이 없습니다.</td></tr>"
    				} else {
    					value += "<thead>"
    						  +		"<tr>"
    						  +			"<th>이름</th>"
    						  +			"<th>직급</th>"
    						  +			"<th>사번</th>"
    						  +			"<th>삭제</th>" 
    						  +		"</tr>"
    						  +  "</thead>"
							  +  "<tbody>"
	    				for(let i=0; i<deleteEmpNoList.length; i++){
	    				  	value += "<tr> "
	    				  		+ "<td><b>  " + deleteEmpNoList[i].empName + "</b></td>" 
	    				  		+ "<td>" + deleteEmpNoList[i].empGrade + "</td>"
	    				  		+ "<td>" + deleteEmpNoList[i].empNo + "</td>"
	    				  		+ "<td><button type='button' class='btn btn-sm btn-danger' value='"+deleteEmpNoList[i].empNo+"' id='deleteListBtn'>삭제</button></td>"
	    				  		+ "</tr>"
	    				}
	    					value += "</tbody>"
    				}
					$(".printEmpList").html(value);
					$("#strInsertListEmpNo").val(afterEmpNoList);
					$("#afterEmpNoList").val(afterEmpNoList);
    			},
    			error:function(){
    				console.log("선택된 직원리스트 조회용 ajax 통신 실패");
    			}
    		})
    		
    		
}
function resetAttBtn(){
	
	const ask = alertify.confirm("근태초기화는 되돌릴 수 없습니다. 정말 초기화 하시겠습니까?").setHeader('');;
	
	const askAgain = alertify.confirm("직원 초기화를 진행합니다.").setHeader('');;
	
	if(ask == true) {
            if(askAgain) {
             $("#resetForm").submit();
            } else {
             alertify.alert("초기화 취소, 다시 직원명단을 만들어주세요").setHeader('');;
             
            }
        } else {
             alertify.alert("초기화 취소, 다시 직원명단을 만들어주세요").setHeader('');;
        }
}

   