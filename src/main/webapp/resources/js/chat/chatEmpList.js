/**
 * 
 */
 
 
 $(function(){
	selectEmpList();
	})
 
 
 
 function selectEmpList(){
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
			 success:function(list){
			  
			    let value = "";
				
				if(list.length == 0) {
					value += "<li>직원이 없습니다</li>"
				} else {
					
					value += "<li>관리자</li>"
								+ "<ul>"
					for(let i=0; i<list.length; i++){
			              if(list.empGrade === "C" || list.empGrade === "A") {
							 value += "<li><img src='" + list.empPhoto + ">' alt='Avatar' class='rounded-circle' width='10px;' height='15px;'/><b>" + list.empName + "</b> 🧘‍♂️ " + list.grName + "</li>"
						  }
						}
						value += "</ul>"
							  + "<li>트레이너</li>"
							  + "<ul>"
					for(let i=0; i<list.length; i++){
								if(list.empGrade === "T") {
								   value += "<li><img src='" + list.empPhoto + ">' alt='Avatar' class='rounded-circle' width='10px;' height='15px;'/><b>" + list.empName + "</b> 🏃‍♂️ " + list.grName + "</li>"
								}
							  }
						value += "</ul>"
			             
					}

						
					
					
					$("#vacDetailDiv").html(value);

			   
			 }
	   ,
	   error:function(){
		 console.log("회원목록 조회용 ajax 통신 실패");
	   }
	   
	})
}