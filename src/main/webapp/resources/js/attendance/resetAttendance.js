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
    					value += "<tr><td>등록된 직원이 없습니다.</td></tr>"
    				} else {
    					value += "<tr style='background-color: #f8f4fc;'>"
    						  		+ "<td><input type='checkbox' name='choiceAll' id='choiceAll' onclick='checkAll();'></td>"
    						  		+ "<td colspan='3'></td>"
    						  +	"</tr>"
    					
	    				for(let i=0; i<levelEmpList.length; i++){
	    				  	value += "<tr> "
	    				  		+ "<td><input type='checkbox' name='empNo' value='" +  levelEmpList[i].empNo + "'>"
	    				  		+ "<td><b>  " + levelEmpList[i].empName + "</b></td>" 
	    				  		+ "<td>" + levelEmpList[i].empGrade + "</td>"
	    				  		+ "<td>" + levelEmpList[i].empNo + "</td>"
	    				  		+ "</tr>"
	    				}
    				}
    		
    				
					$(".empList").html(value);
    			},
    			error:function(){
    				console.log("직원리스트 조회용 ajax 통신 실패");
    			}
    		})
}

function checkAll() {
         if($("#choiceAll").is(':checked')) {
            $(".empList :checkbox").prop("checked", true);
         } else {
            $(".empList :checkbox").prop("checked", false);
         }
      }     