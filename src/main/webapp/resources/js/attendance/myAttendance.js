/**
 * 
 */
 
 //selectInAttendance를 setInterval로 호출하면 됨 ajax로..
 
 $(function(){
 	
 	
 	if($("#loginUserAttin").val() === 0 || $("#loginUserAttin").val() === "0"){
 		 $("#intervalTime").html("<span style='font-size : 20px;' class='badge rounded-pill bg-label-primary'>출근전</span>");
 	} else if ($("#loginUserAttOut").val() === 0 || $("#loginUserAttOut").val() === "0"){
 		let interval = setInterval(getWorkTimeOneSec, 1000);
 	} else {
 		getLastWorkTime();
 		//$("#intervalTime").html("<span style='font-size : 20px;' class='badge rounded-pill bg-label-success'>퇴근완료</span>");
 	}
 	
 })
 
 function getWorkTimeOneSec(){
 	
 	let loginUserEmp = $("#loginUserEmp").val();
 	//console.log("셋인터벌 실행중" + loginUserEmp);
 
 
    $.ajax({
        url: "getWorkTimeOneSec.att",
		data:{
		    empNo : loginUserEmp
		},
        type:"post",
        success:function(att){
        
	            $("#hour").html(att.gapHour);
	            $("#minute").html(att.gapMinute);
	            $("#second").html(att.gapSecond);

        },
        error:function(){
            console.log("관리자 예약내역리스트 조회용 ajax통신 실패"); 
        }
    })

}

function getLastWorkTime(){
	let loginUserEmp = $("#loginUserEmp").val();
 	//console.log("셋인터벌 실행중" + loginUserEmp);
 
 
    $.ajax({
        url: "getLastWorkTime.att",
		data:{
		    empNo : loginUserEmp
		},
        type:"post",
        success:function(att){
          		
			  $("#hour").html(att.gapHour);
	            $("#minute").html(att.gapMinute);
	            $("#second").html(att.gapSecond);
			
        },
        error:function(){
            console.log("관리자 예약내역리스트 조회용 ajax통신 실패"); 
        }
    })

}