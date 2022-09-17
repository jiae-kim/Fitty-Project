 function go(address){
	console.log(address);
	location.href = address;
}

/**
 * employeeEnrollForm 
 */
 $(document).ready(function(){
 
    $("input:radio[name=empGrade]").click(function(){
       paintNoAndMail();
    })

});






/**
 * employeeEnrollForm > ajax 사번, 이메일 자동생성
 */
 

function paintNoAndMail(){
    let empGrade = $('input[name=empGrade]:checked').val();
    let empNo = $('input[name=empNo]');
    let empMail = $('#empMail');

    $.ajax({
        url:"nextEmpNo.emp",
        
        success:function(nextEmpNo){
        	if(empGrade == 'T'){
        		empNo.attr( 'value', 'TRN' + nextEmpNo);
        		empMail.attr( 'value', empNo.val().toLowerCase() + '@fitty.com');
        	} else {
        		empNo.attr( 'value', 'ADM' + nextEmpNo);
        		empMail.attr( 'value', empNo.val().toLowerCase() + '@fitty.com');
        	}
        },
        error:function(){
            console.log("등급 알아오기 ajax 실패");
        }
    })
}



$(function(){
       $('#empPhoto').change(function(){
       let roundPhoto = $('#roundPhoto');
		// AJAX로 파일을 넘기고자 할 경우 가상의 form 요소를 만들어서 담은 후 전달
		// => FormData 객체
		let formData = new FormData();
		let uploadFile = this.files[0]; // 현재 선택된 파일객체 (사용자가 선택한 첨부파일)
		
		formData.append("uploadFile", uploadFile); // 취소버튼 클릭시 undefined가 담김
		formData.append("originalFile", "${e.empPhoto}.val()"); // 기존의 프로필 이미지가 없었을경우 "" 문자열 넘어감
		
		$.ajax({
			url:"uploadProfile.emp",
			data:formData, // 파일자체가 담겨있는 가상의 form 그대로 전달
			processData: false,
			contentType: false,
			type:"POST",
			success:function(e){
				location.reload(e);
				roundPhoto.attr( 'class', 'd-block rounded');
			},
			error:function(){
				console.log("프로필 이미지 파일전송을 위한 ajax 통신 실패");
 			}
		})
	})
})
