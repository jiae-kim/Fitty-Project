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

	 $(document).on("click", ".empList button", function(){ // on 이벤트로 변경
		selectChatRoom( $(this).children("#invEmpNo").val() );
	});


	$(document).on("click", "#send", function(){ // on 이벤트로 변경
		send();
	});

})
 
 
 function selectEmpList(){
	
	
 	//$("input:radio[name='orderByPercent']:radio[value='selectAll']").prop('checked', true); invEmpNo
	
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
							 value += "<li class='dataLi'><button type='button' style='border : none; background-color : white;'><img src='" + list[i].empPhoto + "' alt='Avatar' class='rounded-circle' width='15px;' height='15px;'/>"
							+ "<input type='hidden' value='" + list[i].empNo + "' id='invEmpNo' name='invEmpNo'><b>" + list[i].empName + "</b> 🧘‍♂️ " + list[i].grName + "</button></li>"
						  }
						}
						value += "</ul>"
							  + "<li>트레이너</li>"
							  + "<ul>"
					for(let i=0; i<list.length; i++){
								if(list[i].empGrade === "T") {
									value += "<li class='dataLi'><button type='button' style='border : none; background-color : white;'><img src='" + list[i].empPhoto + "' alt='Avatar' class='rounded-circle' width='15px;' height='15px;'/>"
									+ "<input type='hidden' value='" + list[i].empNo + "' id='invEmpNo' name='invEmpNo'><b>" + list[i].empName + "</b> 🏃‍♂️ " + list[i].grName + "</button></li>"
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
	//console.log("로그인유저 : " + empNo);
	//console.log("상대방 : " + invEmpNo);
	
	$.ajax({
		    url:"bubbleList.ch",
			data:{
			 invEmpNo:invEmpNo,
			 empNo:empNo
			},
			type:"post",
			success:function(invMap){
				//console.log("ddddd")
				let invC = invMap.invC;
				let bubbleList = invMap.bubbleList;
			  // console.log(invMap);
			   let value = ""

			   // 해줘야 하는것 : 리스트말고 invEmpno, name, empPhoto, grname 객체 하나가 필요함, 즉 리턴할때 map으로 리턴해야함 ㅜㅜ
			   
			 
			 value +=  "<h5 class='card-header' style='margin-bottom : 20px; margin-top:20px;'>"
				   +   "<img src='"+ invC.empPhoto +"' alt='Avatar' class='rounded-circle' width='30px;' height='30px;'/>"
				   +   "<b>" + invC.empName + " " + invC.grName + "</b></h5>"
				   +   "<input type='hidden' id='id' value='" + invC.empName + "'>"
				   +   "<input type='hidden' id='photo' value='" + invC.empPhoto + "'>"
			   
			   if(bubbleList.length == 0) {
				   value += "<div id='chatarea' class='card-header' style='width: 80%; height: 600px;'>"
						 + 		   "<div id='chatTextArea' style='text-align:center'>" + invC.empName + "님과의 새로운 대화가 시작되었습니다.</div>"
						 +		   "</div>"
						 +	"</div>"
						 
			   } else {
				   
				   value +=  "<div>"
				   		 +		   "<div id='chatarea' class='card-header' style='width: 80%; height: 600px;'>"
						 +			   "<div id='chatTextArea'>"
						 for(let i=0; i<bubbleList.length; i++){
							if(bubbleList[i].empNo === invC.empNo){
								value +=  		   "<table class='yourTable'>"
								+					   "<tr>"
								+						   "<td rowspan='2'><img src='" + bubbleList[i].empPhoto + "' alt='Avatar' class='rounded-circle col-md-1' width='30px;' height='30px;'/></td>"
								+						   "<td rowspan='2' class='textTd'><div class='noStyle' id='yourText'>" + bubbleList[i].bblContent + "</div></td>"
								+						   "<td width='150px;'>" + bubbleList[i].empName  + "</td>"
								+					   "</tr>"
								+					   "<tr>"
								+						   "<td>" + bubbleList[i].bblDate  + "</td>"
								+					   "</tr>"
								+				   "</table>"
							} else {
								value += 		   "<table class='myTable'>"
								+					   "<tr>"
								+						   "<td width='150px;'>" + bubbleList[i].empName + "</td>"
								+						   "<td rowspan='2' class='textTd'><div class='noStyle' id='yourText'>" + bubbleList[i].bblContent + "</div></td>"
								+						   "<td rowspan='2'><img src='" + bubbleList[i].empPhoto + "' alt='Avatar' class='rounded-circle col-md-1' width='30px;' height='30px;'/></td>"
								+					   "</tr>"
								+					   "<tr>"
								+						   "<td>" + bubbleList[i].bblDate  + "</td>"
								+					   "</tr>"
								+				   "</table>"
							}
						 }
						

					   
						 
						}

						value +=  		"<form>"
						+				   "<textarea id='message' style='width:740px; margin-left:107px;'></textarea>"
						+				   "<input type='button' class='btn btn-primary' style='margin-top:-42px; height : 50px;' id='send' value='보내기' />"
						+		   		"</form>"
						+		   "</div>"
						+	   "</div>"
						console.log(value);
						$(".vacDetailDiv").html(value);
			  
			}
	  ,
	  error:function(){
		console.log("회원목록 조회용 ajax 통신 실패");
	  }
	  
   })
}


	// ##### 입장~~~!!
	let websocket;
	$(function(){
		
		
	connect();
	})
	
	function connect(){
// 		websocket = new WebSocket("ws://본인 아이 피주소/www/chat-ws");
		//websocket = new WebSocket("ws://172.30.1.52/www/chat-ws");
		websocket = new SockJS("/fitty/chat-ws");
			//웹 소켓에 이벤트가 발생했을 때 호출될 함수 등록
			websocket.onopen = onOpen;
			websocket.onmessage = onMessage;
			//http://localhost:8765/fitty/chatEcho
	}
	
	// ##### 연결 되었습니다!
	function onOpen(){
		//id = document.getElementById("id").value;
		//websocket.send(id + "님과의 대화입니다.");
		console.log("연결됨")
	}
	
	// ##### 메세지 보내기 버튼 클릭!
	/*
	document.getElementById("send").addEventListener("click", function() {
		send();
	});
	*/
	function send(){
		const date = new Date();

		const year = date.getFullYear();
		const month = ('0' + (date.getMonth() + 1)).slice(-2);
		const day = ('0' + date.getDate()).slice(-2);
		const dateStr = year + '-' + month + '-' + day;

		const hours = ('0' + date.getHours()).slice(-2);
		const minutes = ('0' + date.getMinutes()).slice(-2);
		const seconds = ('0' + date.getSeconds()).slice(-2);
		const timeStr = hours + ':' + minutes + ':' + seconds;


		id = document.getElementById("empNameInput").value;
		photo = document.getElementById("empPhotoInput").value;
		msg = document.getElementById("message").value;

		//websocket.send(/*css 소스 + */id + ":"+ msg);
		websocket.send(
										"<table class='myTable'>"
								+ 					  "<tr>"
								+						   "<td rowspan='2'><img src='" + photo + "' alt='Avatar' class='rounded-circle col-md-1' style='width:30px; height:30px;'/></td>"
								+						   "<td rowspan='2' class='textTd'><div class='noStyle' id='yourText' style='text-align:left; color : grey'>" + msg + "</div></td>"
								+						   "<td width='150px;' style='text-align:right;'>" + id  + "</td>"
								+					   "</tr>"
								+					   "<tr>"
								+						   "<td style='font-size : 10px; text-align:right;'>" + dateStr + " " + timeStr + "</td>"
								+					   "</tr>"
								+ 			"</table>"

		)
		document.getElementById("message").value = "";
	}
	
	function onMessage(evt){
		console.log('Info: connection onmessage.');
	   	console.log("ReceiveMessage:" , evt.data +'\n');
	   		
	   	
		//data= evt.data;
		//chatTextArea = document.getElementById("chatTextArea");
		//chatTextArea.innerHTML =  evt.data;
		$("#chatTextArea").html(  $("#chatTextArea").html() + "<div style='height:20px;'></div>" + evt.data);
	}
	/*
	// ##### 연결을 해제합니다!
	document.getElementById("exit").addEventListener("click", function() {
		disconnect();
	});

	function disconnect(){
		id = document.getElementById("id").value;
		websocket.send(id+"님이 퇴장하셨습니다");
		websocket.close();
	}
	*/
	