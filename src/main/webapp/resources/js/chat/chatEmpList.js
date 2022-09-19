/**
 * 
 */
 
 
 $(function(){
	$("#nextBtn").attr("disabled", true);
	$("#rightArrow").css("color", "#DCDADA");
    selectAllAttList(1);

    let month = Number($("#thisMonth").val());
    let year = Number($("#thisYear").val());

    $(document).ready(function(){
    	$("#nextBtn").on("click",function() {
    		
    		if(month < 12) {
    			month = month + 1;
    			$("#thisMonth").val(month);	
    		    nowCheck();
    		} else {
    			month = 1;
    			year = year + 1;
    			$("#thisMonth").val(month);
    			$("#thisYear").val(year);
    		    nowCheck();
    		}
    		})
})
 
 
 
 function changeSelect(){
	let orderByWorkTime = $("#orderByWorkTime").val();
	let orderByAtt = $("#orderByAtt").val();
	let memListTBody = $("#memListTBody");
	
 	$("input:radio[name='orderByPercent']:radio[value='selectAll']").prop('checked', true); 
	
	 $.ajax({
			  url:"chatEmp.ch",
			 data:{
			   searchText:$("#searchText").val()
			 },
			 type:"post",
			 success:function(list){
			  
			    let value = "";
				
				if(list.length == 0) {
					value += "<li>직원이 없습니다</li>"
				} else {
					
					value += "<li>관리자</li>"
								+ "<ul>"
					for(let i=0; i<list.length; i++){
			              if(list.empGrade === "C" || list.empGrade === "A") {
							 value += "<li><img src='" + list.empPhoto + ">' alt='Avatar' class='rounded-circle' width='10px;' height='15px;'/><b>" + list.empName + "</b> 🧘‍♂️ " + list.grName + "</li>"
						  }
						}
					value += "</ul>"
			               <li><img src="${loginUser.empPhoto}>" alt="Avatar" class="rounded-circle" width="15px;" height="15px;"/><b>최사장</b> 🧘‍♂️ 대표</li>
			               <li><img src="${loginUser.empPhoto}>" alt="Avatar" class="rounded-circle" width="15px;" height="15px;"/><b>최사장</b> 🧘‍♂️ 관리자</li>
			             </ul>
			           <li>트레이너</li>
			             <ul>
			               <li><img src="${loginUser.empPhoto}>" alt="Avatar" class="rounded-circle" width="15px;" height="15px;"/><b>최사장</b> 🏃‍♂️ 트레이너</li>
			               <li><img src="${loginUser.empPhoto}>" alt="Avatar" class="rounded-circle" width="15px;" height="15px;"/><b>최사장</b> 🏃‍♂️ 트레이너</li>
			               <li><img src="${loginUser.empPhoto}>" alt="Avatar" class="rounded-circle" width="15px;" height="15px;"/><b>최사장</b> 🏃‍♂️ 트레이너</li>
			               <li><img src="${loginUser.empPhoto}>" alt="Avatar" class="rounded-circle" width="15px;" height="15px;"/><b>최사장</b> 🏃‍♂️ 트레이너</li>
			               <li><img src="${loginUser.empPhoto}>" alt="Avatar" class="rounded-circle" width="15px;" height="15px;"/><b>최사장</b> 🏃‍♂️ 트레이너</li>
			             </ul>
					}

						
					
					if(pi.currentPage == 1){
						// 현재페이지가 1페이지면 < 버튼 disabled
						pageValue += "<li class='page-item prev'><button disabled class='page-link'><i class='tf-icon bx bx-chevron-left'></i></button></li>";
							
					} else {
						// 현재 페이지가 1페이지가 아니면
						pageValue += "<li class='page-item prev'><button class='page-link' onclick='selectAllAttList(" + (pi.currentPage - 1) + ")'><i class='tf-icon bx bx-chevron-left'></i></button></li>";
					}
					
					for(let p=pi.startPage; p<=pi.endPage; p++) { 
						if(p == pi.currentPage) { 
								pageValue += "<li class='page-item'><button class='page-link' disabled>"  + p  + "</button></li>"
						}else {
								pageValue += "<li class='page-item'><button class='page-link' onclick='selectAllAttList(" + p +")'>" + p + "</button></li>"
						} 
					}     
			
					if(pi.currentPage == pi.maxPage) {
						pageValue += "<li class='page-item prev'><button disabled class='page-link'><i class='tf-icon bx bx-chevron-right'></i></button></li>"
					} else {
						pageValue +=	"<li class='page-item next'><button class='page-link' onclick='selectAllAttList(" + (pi.currentPage + 1) + ")'><i class='tf-icon bx bx-chevron-right'></i></button></li>"
						
					}
					
					$("#memListTBody").html(value);
					$(".pagination").html(pageValue);
					$("#selectAll").attr("checked", true);
			   
			 }
	   ,
	   error:function(){
		 console.log("회원목록 조회용 ajax 통신 실패");
	   }
	   
	})
}