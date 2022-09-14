<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fitty</title>
<link type="text/css" rel="stylesheet" href="resources/css/chat.css" />
<script type="text/javascript" src="resources/js/chat.js"></script>
</head>
<body>
<jsp:include page="../common/header.jsp"/>

	<input type="text" class="form-control" id="msg" placeholder="웹소켓 실험" name="" value="">
	<button id="btnSend" class="btn btn-primary me-2">send</button>
	
	
	<script>
		$(function(){
			
			connect();
			
			
			$("#btnSend").click(function(evt){
				
				console.log(socket);
				/* evt.preventDefault(); */
				/* if(socket.readyStatus != 1) return; */
				
				let msg = $("#msg").val();
				socket.send(msg);
			});
		});
	</script>
	
	
</body>
</html>