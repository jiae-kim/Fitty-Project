$(function(){

	$("#nextBtn").attr("disabled", true);
	$("#rightArrow").css("color", "#DCDADA");
	
	let month = Number($("#thisMonth").val());
    let year = Number($("#thisYear").val());
    let day = Number($("#thisDay").val());

    $(document).ready(function(){
    	$("#nextBtn").on("click",function() {

			if ( (year % 4 == 0 && year % 100 != 0 || year % 400 == 0) && (month == 2) && (day < 29) ) {
				// 윤년이고 2월 평일이라면
				day = day + 1
				$("#thisDay").val(day);	
			} else if ( (year % 4 == 0 && year % 100 != 0 || year % 400 == 0) && (month == 2) && (day == 29) ) {
				day = 1;
				month = month + 1;
				$("#thisDay").val(day);	
				$("#thisMonth").val(month);
			} else if ( (month == 2) && (day < 28) ) {
				day = day + 1
				$("#thisDay").val(day);	
			} else if ( (month == 2) && (day == 28) ) {
				day = 1;
				month = month + 1;
				$("#thisDay").val(day);	
				$("#thisMonth").val(month);
			} else if( ((month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12 ) && day < 31)
				|| ( (month == 4 || month == 6 || month == 9 || month == 11 ) && day < 30 ) ){
				day = day + 1
				$("#thisDay").val(day);	
			} else if ( ((month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12 ) && day == 31)
				|| ((month == 4 || month == 6 || month == 9 || month == 11 ) && day == 30) ) {
				day = 1;
				if(month < 12) {
					month = month + 1;
				} else {
					month = 1;
	    			year = year + 1;
				}
				$("#thisDay").val(day);	
				$("#thisMonth").val(month);
	    		$("#thisYear").val(year);
	    		}
	    		
	    		nowCheck();
    		})
	})
    		
    $(document).ready(function(){
    	$("#backBtn").on("click",function() {
    		
    		if ( (year % 4 == 0 && year % 100 != 0 || year % 400 == 0) && (month == 3) && (day > 1) ) {
				// 윤년이고 2월 평일이라면
				day = day - 1
				$("#thisDay").val(day);	
			} else if ( (year % 4 == 0 && year % 100 != 0 || year % 400 == 0) && (month == 3) && (day == 1) ) {
				day = 29;
				month = month - 1;
				$("#thisDay").val(day);	
				$("#thisMonth").val(month);
			} else if ( (month == 3) && (day > 1) ) {
				day = day - 1 
				$("#thisDay").val(day);	
			} else if ( (month == 3) && (day == 1) ) {
				day = 28;
				month = month - 1;
				$("#thisDay").val(day);	
				$("#thisMonth").val(month);
			} else if( ((month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12 ) && day > 1)
				|| ( (month == 2 ||  month == 4 || month == 6 || month == 9 || month == 11 ) && day > 1 ) ){
				day = day - 1
				$("#thisDay").val(day);	
			} else if ( (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12 ) && day == 1) {
				day = 30;
				if(month > 1) {
					month = month - 1;
				} else {
					month = 12;
	    			year = year - 1;
				}
				$("#thisDay").val(day);	
				$("#thisMonth").val(month);
	    		$("#thisYear").val(year);
	    	} else if ( (month == 2 || month == 4 || month == 6 || month == 9 || month == 11 ) && day == 1) {
				day = 31;
				month = month - 1;
				$("#thisDay").val(day);	
				$("#thisMonth").val(month);
			}
	    		
	    		nowCheck();
    })
})
    
    
})

function nowCheck(){

	let month = Number($("#thisMonth").val());
    let year = Number($("#thisYear").val());
    let day = Number($("#thisDay").val());
    
    let today = new Date();
	
	let nowYear = today.getFullYear();
	let nowMonth = today.getMonth()+1;
	let nowDate = today.getDate();
	
	
    if(year == nowYear && month == nowMonth && nowDate == day) {
    // 같은년월
        //selectAllAttList(1);
        $("#nextBtn").attr("disabled", true);
        $("#rightArrow").css("color", "#DCDADA");
    } else {
    // 다른년월
    	$("#rightArrow").css("color", "#696CFF");
    	$("#nextBtn").attr("disabled", false);
        //selectOtherAttList(1);
    }
    
   
    
}
    		
	
	
	/*
    selectAllAttList(1);
	
	$(document).ready(function(){
		$("#orderByWorkTime").on("change",function(){
			changeSelect();	
		})
	})
	
	$(document).ready(function(){
		$("#searchBtn").on("click",function(){
			changeSelect();	
		})
	})
	
	$(document).ready(function(){
		$('input:radio[name=orderByPercent]').on("click",function(){
			filterPercent();	
		})
	})

	

	
})




})
*/