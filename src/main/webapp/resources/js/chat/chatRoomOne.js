$(function(){
    		selectAlertList();
    	
    	})
    	
    	function selectAlertList(){
    		$.ajax({
    			url:"alist.at",
    			data:{
    				alRecip:'${ loginUser.empNo }'
    			},
    			success:function(list){
    				
    				console.log(list);
					
    				let value = "";
    				let value2 = "";
    				if(list.length == 0){
    					value += 
    						'<div style="text-align:center;">신규 알림 내용이 없습니다.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
    				         + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
    				         + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
    				         + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
    				         + '</div>'
    				         + 	'<br><br><br>';
    				    value2 += '<label id="alertLabel" style="display:none;"></label>';
    				    	 
    				}else{
    					for(let i=0; i<list.length; i++){
    						value +=
    							  '<div>'
    							+ '<span>' +  list[i].alMsg +'</span>'
    				  		  	+ '&nbsp;&nbsp;<span class="badge bg-label-secondary">' + list[i].alDate + '</span>'
    				  		  	+ '</div><br>';
    					}
    						value2 += '<label id="alertLabel"></label>';
    					
    				}
    				$('#alertList').html(value);
    				$('#alertIcon').append(value2);
    				
    				
    			},
    			error:function(){
    				console.log("알림리스트 조회용 ajax통신 실패");
    				}
    			})
    		}