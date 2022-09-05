/**
 * centerAttendance 페이지 서블릿 주소
 */
 function go(address){
	console.log(address);
	location.href = address;
}


/**
 * centerAllAttendance 페이지
 */
 $(function(){
      		
	selectAllAttList(1);

        
})

function selectAllAttList(page){
	
	$.ajax({        			
		url: "attList.att",
		data:{
		    searchType:$("#searchType").val(),
		    searchText:$("#searchText").val(),
			// booktype: $("#booktype").val(),
		    // bookOrderBy: $("#bookOrderBy").val(),
		  	cpage:page 
		},
		type:"post",
		success:function(mv){
			// let contextPath = "<%= contextPath %>"
			console.log(mv);
			let value = "";
			let pageValue = "";
			
			let empList = mv.empList; // [{}, {}, {}, ...]
			let pi = mv.pi; // { }
			
			if(empList.length == 0){
				value += "<tr>"
				       + "<td colspan='32'> 직원이 없습니다. </td>"
                         + "</tr>";
			}else{
				
				for(let i=0; i<empList.length; i++){
					
				value += "<tr>"
					   +    "<th><input type='checkbox' name='choiceAll' id='choiceAll' onclick='checkAll();'></th>"
                       +  	"<td>" +  empList[i].empName + "</td>"
                       
                	for(let k=0; i<empList[i].attList[k].length; k++){
                value += 	"<td>" +  empList[i].attList[k].attStatus + "</td>"
                	}
                       
                       
                value += "</tr>";
                     
				}
				
				if(pi.currentPage != 1){
        			pageValue += "<li class='page-item prev'><button class='page-link' onclick='selectAllAttList(" + (pi.currentPage - 1) + ")'><i class='tf-icon bx bx-chevron-left'></i></button></li>"
        				
        		}
        		
        		for(let p=pi.startPage; p<=pi.endPage; p++) { 
				   
		   			if(p == pi.currentPage) { 
				   			pageValue += "<li class='page-item'><button class='page-link' disabled>"  + p  + "</button></li>"
				   	}else {
				   			pageValue += "<li class='page-item'><button class='page-link' onclick='selectAllAttList(" + p +")'>" + p + "</button></li>"
		           	} 
		         }     
         
		         if(pi.currentPage != pi.maxPage) {
		        	  pageValue +=	"<li class='page-item next'><button class='page-link' onclick='selectAllAttList(" + (pi.currentPage + 1) + ")'><i class='tf-icon bx bx-chevron-left'></i></button></li>"
		        	  
		         } 
			}
			
			$("#memListTBody").html(value);
			$(".pagination").html(pageValue);
			
			
		},
		error:function(){
			console.log("관리자 예약내역리스트 조회용 ajax통신 실패");
		}
		
	});
	
}



