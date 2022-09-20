/**
 * 
 */
 
 //console.log($("input:hidden[name='invEmpNo']").val());
 //console.log($("input:hidden[id='empNoInput']").val());

 $(function(){
	selectEmpList();

    $(document).ready(function(){
    	$("#searchBtn").on("click",function() {
    		
    		selectEmpList();
    		})
	})
/*
	$(document).ready(function(){
    	$(".empList li").on("click",function() {
    		
    		openChatRoom();
    		})
	})
	*/
})
 
 
 function selectEmpList(){
	
	
 	//$("input:radio[name='orderByPercent']:radio[value='selectAll']").prop('checked', true); 
	
	 $.ajax({
			  url:"chatEmp.ch",
			 data:{
			   searchText:$("#searchText").val()
			 },
			 type:"post",
			 success:function(list){
			  
				//console.log(list);
			    let value = "";
				
				if(list.length == 0) {
					value += "<li>직원이 없습니다</li>"
				} else {
					
					value += "<li>관리자</li>"
								+ "<ul>"
					for(let i=0; i<list.length; i++){
			              if(list[i].empGrade === "C" || list[i].empGrade === "A") {
							 value += "<li><img src='" + list[i].empPhoto + "' alt='Avatar' class='rounded-circle' width='15px;' height='15px;'/>"
							+ "<a href='chatRoom.ch?empNo=" + list[i].empNo + "'> <b>" + list[i].empName + "</b> 🧘‍♂️ " + list[i].grName + "</a></li>"
							//+ "<input type='hidden' value='" + list[i].empNo + "' id='invEmpNo' name='invEmpNo'>"
							+ "<b>" + list[i].empName + "</b> 🧘‍♂️ " + list[i].grName + "</li>"
						  }
						}
						value += "</ul>"
							  + "<li>트레이너</li>"
							  + "<ul>"
					for(let i=0; i<list.length; i++){
								if(list[i].empGrade === "T") {
								   value += "<li><img src='" + list[i].empPhoto + "' alt='Avatar' class='rounded-circle' width='15px;' height='15px;'/>"
								  	 + "<a href='chatRoom.ch?empNo=" + list[i].empNo + "'> <b>" + list[i].empName + "</b> 🏃‍♂️ " + list[i].grName + "</a></li>"
							//	   <b>" + list[i].empName + "</b> 🏃‍♂️ " + list[i].grName + "</li>"K
								}
							  }
						value += "</ul>"
			             
					}

						
					
					
					$(".empList").html(value);

			   
			 }
	   ,
	   error:function(){
		 console.log("회원목록 조회용 ajax 통신 실패");
	   }
	   
	})
}

/*

function openChatRoom(){
	
	
	//$("input:radio[name='orderByPercent']:radio[value='selectAll']").prop('checked', true); 
   
	$.ajax({
			 url:"chatEmp.ch",
			data:{
			  searchText:$("#searchText").val()
			},
			type:"post",
			success:function(list){
			 
			   //console.log(list);
			   let value = "";
			   
			   if(list.length == 0) {
				   value += "<li>직원이 없습니다</li>"
			   } else {
				   
				   value += "<li>관리자</li>"
							   + "<ul>"
				   for(let i=0; i<list.length; i++){
						 if(list[i].empGrade === "C" || list[i].empGrade === "A") {
							value += "<li><img src='" + list[i].empPhoto + "' alt='Avatar' class='rounded-circle' width='15px;' height='15px;'/>"
							+ "<a href='chatRoom.ch?no=" + list[i].empNo + "'> <b>" + list[i].empName + "</b> 🧘‍♂️ " + list[i].grName + "</li>"
						 }
					   }
					   value += "</ul>"
							 + "<li>트레이너</li>"
							 + "<ul>"
				   for(let i=0; i<list.length; i++){
							   if(list[i].empGrade === "T") {
								  value += "<li><img src='" + list[i].empPhoto + "' alt='Avatar' class='rounded-circle' width='15px;' height='15px;'/><b>" + list[i].empName + "</b> 🏃‍♂️ " + list[i].grName + "</li>"
							   }
							 }
					   value += "</ul>"
						
				   }

					   
				   
				   
				   $(".empList").html(value);

			  
			}
	  ,
	  error:function(){
		console.log("회원목록 조회용 ajax 통신 실패");
	  }
	  
   })
}
*/