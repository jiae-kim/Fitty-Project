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
    
    $(document).ready(function(){
    	$("#backBtn").on("click",function() {
    		
    		if(month > 1) {
    			month = month - 1;
    			$("#thisMonth").val(month);	
    		    nowCheck();
    		} else {
    			month = 12;
    			year = year - 1;
    			$("#thisMonth").val(month);
    			$("#thisYear").val(year);
    		    nowCheck();
    		}
    		})
    })

})

function nowCheck(){

	let month = Number($("#thisMonth").val());
    let year = Number($("#thisYear").val());
    let today = new Date();
	let nowYear = today.getFullYear();
	let nowMonth = today.getMonth()+1;
	
	
    if(year == nowYear && month == nowMonth) {
    // 같은년월
        selectAllAttList(1);
        $("#nextBtn").attr("disabled", true);
        $("#rightArrow").css("color", "#DCDADA");
    } else {
    // 다른년월
    	$("#rightArrow").css("color", "#696CFF");
    	$("#nextBtn").attr("disabled", false);
        selectOtherAttList(1);
    }
    
   
    
}

function selectAllAttList(page){

    $.ajax({
        url: "attList.att",
		data:{
		    // searchType:$("#searchType").val(),
		    // searchText:$("#searchText").val(),
		    cpage:page,
		    thisMonth : $("#thisMonth").val(),
		    thisYear : $("#thisYear").val()
		  	
		},
        type:"post",
        success:function(result){
            let value = "";
            let countValue = "";
            let pageValue = "";

            let empList = result.empList;
            let countList = result.countList;
            let pi = result.pi;

            if(empList.length == 0) {
                value += "<tr>"
				       + "<td colspan='32'> 직원이 없습니다. </td>"
                         + "</tr>";
            } else {
                for(let i=0; i<empList.length; i++){
					
                    value += "<tr>"
                        +    "<th><input type='checkbox' name='choiceAll' id='choiceAll' onclick='checkAll();'></th>"
                        +  	"<td>" +  empList[i].empName + "</td>"
                        
                        for(var k in empList[i].attList) {
                               // value += 	"<td>" + empList[i].attList[k].attStatus + "</td>"
                                value += 	"<td style='color:" + empList[i].attList[k].attStatus + ";'><i class='bx bxs-circle'></i></td>"
                            }
                            
                
                        
                    value += "</tr>";
                     
				}

                if(empList.length == 0){
                    countValue += "<tr>"
                                       + "<td colspan='5'> 직원이 없습니다. </td>"
                                  + "</tr>";
                }else{
                    
                    for(let i=0; i<empList.length; i++){
                        
                    countValue += "<tr>"
                           
                                   + 	"<td><button type='button' value='" + empList[i].empNo + "' id='listedEmpNoBtn'>" + empList[i].countList[i].countX + "</button></td>"
                                 + 	"<td><button type='button' value='" + empList[i].empNo + "' id='listedEmpNoBtn' >" + empList[i].countList[i].countL + "</button></td>"
                                 + 	"<td><button type='button' value='" + empList[i].empNo + "' id='listedEmpNoBtn'>" + empList[i].countList[i].countE + "</button></td>"
                                 + 	"<td><button type='button' value='" + empList[i].empNo + "'  id='listedEmpNoBtn'>" + empList[i].countList[i].countYH + "</button></td>"
                                 + 	"<td><button type='button' value='" + empList[i].empNo + "' id='listedEmpNoBtn' >" + empList[i].countList[i].countV + "</button></td>"
                                 + 	"<td><button type='button' value='" + empList[i].empNo + "' id='listedEmpNoBtn' >" + empList[i].countList[i].countPtime + "</button></td>"
                            }
                           
                    countValue += "</tr>";
                         
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
                 $("#countListTBody").html(countValue);
                 $(".pagination").html(pageValue);
            }
        },
        error:function(){
            console.log("관리자 예약내역리스트 조회용 ajax통신 실패"); 
        }
    })

}


function selectOtherAttList(page){
    $.ajax({
        url: "otherAttList.att",
		data:{
		    // searchType:$("#searchType").val(),
		    // searchText:$("#searchText").val(),
		    cpage:page,
		    thisMonth : $("#thisMonth").val(),
		    thisYear : $("#thisYear").val()
		  	
		},
        type:"post",
        success:function(result){
            let value = "";
            let countValue = "";
            let pageValue = "";

            let empList = result.empList;
            let countList = result.countList;
            let pi = result.pi;

            if(empList.length == 0) {
                value += "<tr>"
				       + "<td colspan='32'> 직원이 없습니다. </td>"
                         + "</tr>";
            } else {
                for(let i=0; i<empList.length; i++){
					
                    value += "<tr>"
                        +    "<th><input type='checkbox' name='choiceAll' id='choiceAll' onclick='checkAll();'></th>"
                        +  	"<td>" +  empList[i].empName + "</td>"
                        
                        for(var k in empList[i].attList) {
                               // value += 	"<td>" + empList[i].attList[k].attStatus + "</td>"
                               value += 	"<td style='color:" + empList[i].attList[k].attStatus + ";'><i class='bx bxs-circle'></i></td>"
                            }
                            
                
                        
                    value += "</tr>";
                     
				}

                if(empList.length == 0){
                    countValue += "<tr>"
                                       + "<td colspan='5'> 직원이 없습니다. </td>"
                                  + "</tr>";
                }else{
                    
                    for(let i=0; i<empList.length; i++){
                        
                    countValue += "<tr>"
                           
                                   + 	"<td><button type='button' value='" + empList[i].empNo + "' id='listedEmpNoBtn'>" + empList[i].countList[i].countX + "</button></td>"
                                 + 	"<td><button type='button' value='" + empList[i].empNo + "' id='listedEmpNoBtn'>" + empList[i].countList[i].countL + "</button></td>"
                                 + 	"<td><button type='button' value='" + empList[i].empNo + "' id='listedEmpNoBtn'>" + empList[i].countList[i].countE + "</button></td>"
                                 + 	"<td><button type='button' value='" + empList[i].empNo + "' id='listedEmpNoBtn'>" + empList[i].countList[i].countYH + "</button></td>"
                                 + 	"<td><button type='button' value='" + empList[i].empNo + "' id='listedEmpNoBtn'>" + empList[i].countList[i].countV + "</button></td>"
                                 + 	"<td><button type='button' value='" + empList[i].empNo + "' id='listedEmpNoBtn'>" + empList[i].countList[i].countPtime + "</button></td>"
                            }
                           
                    countValue += "</tr>";
                         
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
                 $("#countListTBody").html(countValue);
                 $(".pagination").html(pageValue);
            }
        },
        error:function(){
            console.log("관리자 예약내역리스트 조회용 ajax통신 실패"); 
        }
    })

}