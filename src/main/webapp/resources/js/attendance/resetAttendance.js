/*  reset attendance */
 $(function(){

	selectEmpList();
        
})

function selectEmpList(){
    		$.ajax({
    			url:"reset.att",
    			success:function(levelEmpList){
    				let value="";
    				
    				if(levelEmpList.length == 0) {
    					value += "<li>등록된 직원이 없습니다.</li>"
    				} else {
    					value += "<li><input type='checkbox' name='choiceAll' id='choiceAll' onclick='checkAll();'>전체선택</li>"
    					
	    				for(let i=0; i<levelEmpList.length; i++){
	    				  	value += "<li><input type='checkbox' name='empNo' value='" +  levelEmpList[i].empNo + "'><b>  " + levelEmpList[i].empName + "</b>  " + levelEmpList[i].empGrade + "  (" + levelEmpList[i].empNo + ")</li>"
	    				}
    				}
    		
    				
					$(".empList").html(value);
    			},
    			error:function(){
    				console.log("직원리스트 조회용 ajax 통신 실패");
    			}
    		})
    	}