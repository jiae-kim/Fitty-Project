/**
 * employeeEnrollForm 
 */
 $(document).ready(function()
{
    $("input:radio[name=empGrade]").click(function()
    {
       getValue();
    })
});



 /**
 * employeeEnrollForm > ajax 프로필 사진 올리기
 => 로그인유저가 아니라서 수정 필요함!!!!!
 */
 $(function(){
	$("#profileImgFile").change(function(){
	
		// AJAX로 파일을 넘기고자 할 경우 가상의 form 요소를 만들어서 담은 후 전달
		// => FormData 객체
		let formData = new FormData();
		let uploadFile = this.files[0]; // 현재 선택된 파일객체 (사용자가 선택한 첨부파일)
		console.log(uploadFile);
		
		formData.append("uploadFile", uploadFile); // 취소버튼 클릭시 undefined가 담김
		formData.append("userId", "${loginUser.userId}"); // userId는 문자열이기때문에 자스에서도 문자열이려면 "" 필요
		formData.append("originalFile", "${loginUser.profileImg}"); // 기존의 프로필 이미지가 없었을경우 "" 문자열 넘어감
		
		
		$.ajax({
			url:"uploadProfile.me",
			data:formData, // 파일자체가 담겨있는 가상의 form 그대로 전달
			contentType:false, // 파일 넘길 때 꼭 필요한 속성
			processData:false, // 파일 넘길 떄 꼭 필요한 속성 : 폼데이터를 String으로 바꿔줌 => false 해야 파일 자체가 넘어감
			type:"POST",
			success:function(){
				location.reload();
			},
			error:function(){
				console.log("프로필 이미지 파일전송을 위한 ajax 통신 실패");
			}
		})
	})
})



/**
 * employeeEnrollForm > ajax 사번, 이메일 자동생성
 */
 

function getValue(){
    let empGrade = $('input[name=empGrade]:checked').val();

    let empNo = $('#empNo');
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