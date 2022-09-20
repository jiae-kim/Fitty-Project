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
	
	$(document).ready(function(){
	$(".empList li[class = dataLi]").click(function(){
            		selectChatRoom( $(this).children("#invEmpNo").val() );
            	})
 	})
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
							 value += "<li class='dataLi'><img src='" + list[i].empPhoto + "' alt='Avatar' class='rounded-circle' width='15px;' height='15px;'/>"
							//+ "<a href='chatRoom.ch?empNo=" + list[i].empNo + "'> <b>" + list[i].empName + "</b> 🧘‍♂️ " + list[i].grName + "</a></li>"
							+ "<input type='hidden' value='" + list[i].empNo + "' id='invEmpNo' name='invEmpNo'><b>" + list[i].empName + "</b> 🧘‍♂️ " + list[i].grName + "</li>"
							//+ "<b>" + list[i].empName + "</b> 🧘‍♂️ " + list[i].grName + "</li>"
						  }
						}
						value += "</ul>"
							  + "<li>트레이너</li>"
							  + "<ul>"
					for(let i=0; i<list.length; i++){
								if(list[i].empGrade === "T") {
								   value += "<li class='dataLi'><img src='" + list[i].empPhoto + "' alt='Avatar' class='rounded-circle' width='15px;' height='15px;'/>"
								   + "<input type='hidden' value='" + list[i].empNo + "' id='invEmpNo' name='invEmpNo'><b>" + list[i].empName + "</b> 🏃‍♂️ " + list[i].grName + "</li>"
								//  	 + "<a href='chatRoom.ch?empNo=" + list[i].empNo + "'> <b>" + list[i].empName + "</b> 🏃‍♂️ " + list[i].grName + "</a></li>"
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


function selectChatRoom(invEmpNo){
	
	const empNo = $("#empNoInput").val();
	console.log("로그인유저 : " + empNo);
	console.log("상대방 : " + invEmpNo);
	//$("input:radio[name='orderByPercent']:radio[value='selectAll']").prop('checked', true); 
   
	$.ajax({
		    url:"bubbleList.ch",
			data:{
			 invEmpNo:invEmpNo,
			 empNo:empNo
			},
			type:"post",
			success:function(list){
			 
			   //console.log(list);
			   let value = ""

			   // 해줘야 하는것 : 리스트말고 invEmpno, name, empPhoto, grname 객체 하나가 필요함, 즉 리턴할때 map으로 리턴해야함 ㅜㅜ
			   
			 
			 value +=  "<h5 class='card-header' style='margin-bottom : 20px; margin-top:20px;'>"
				   +   "<img src='"+ list[0].invEmpNo +"' alt='Avatar' class='rounded-circle' width='30px;' height='30px;'/>"
				   +   "<b>" + list[0].grName + "</b></h5>"
				   +   "<input type='hidden' id='id' value='" + list[0].invEmpNo + "'>"
			   
			   if(list.length == 0) {
				   value += "<div>" + list[0].invEmpName + "님과의 새로운 대화가 시작되었습니다.</div>"
			   } else {
				   
				   value +=  "<div>"
				   		 +		   "<div id='chatarea' class='card-header' style='width: 80%; height: 600px;'>"
						 +			   "<div id='chatTextArea'>"
						 +				   "<table class='yourTable'>"
						 +					   "<tr>"
						 +						   "<td rowspan='2'><img src='${loginUser.empPhoto}' alt='Avatar' class='rounded-circle col-md-1' width='30px;' height='30px;'/></td>"
						 +						   "<td rowspan='2' class='textTd'><div class='noStyle' id='yourText'></div></td>"
						 +						   "<td width='150px;'>트레이너이름</td>"
						 +					   "</tr>"
						 +					   "<tr>"
						 +						   "<td>2022-30-44</td>"
						 +					   "</tr>"
						 +				   "</table>"
						 +				   "<table class='myTable'>"
						 +					   "<tr>"
						 +						   "<td width='150px;'>트레이너이름</td>"
						 +						   "<td rowspan='2' class='textTd'><div class='noStyle' id='yourText'></div></td>"
						 +						   "<td rowspan='2'><img src='${loginUser.empPhoto}' alt='Avatar' class='rounded-circle col-md-1' width='30px;' height='30px;'/></td>"
						 +					   "</tr>"
						 +					   "<tr>"
						 +						   "<td>2022-30-44</td>"
						 +					   "</tr>"
						 +				   "</table>"
						 +			   "</div>"
						 +			   "<form>"
						 +				   "<textarea id='message' /></textarea>"
						 +				   "<input type='button' class='btn btn-primary' style='margin-top:-42px; height : 50px;' id='send' value='보내기' />"
						 +		   		"</form>"
						 +		   "</div>"
						 +	   "</div>"

					   
				   
				   
				   $(".vacDetailDiv").html(value);
			   }
			  
			}
	  ,
	  error:function(){
		console.log("회원목록 조회용 ajax 통신 실패");
	  }
	  
   })
}
