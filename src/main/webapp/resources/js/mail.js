
      // 체크박스 전체선택 가능한 함수
	    $(".checkbox-group").on("click", "#checkAll", function(){
        	$(this).parents(".checkbox-group").find("input").prop("checked", $(this).is(":checked"));
        	
        });
        
	    $(".checkbox-group").on("click", ".selectedCheck", function(){
	        var isChecked = true;
	
	        $(".checkbox-group .selectedCheck").each(function(){
	            isChecked = isChecked && $(this).is(":checked");
	        });
	
	        $("#checkAll").prop("checked", isChecked);
	
	      });
