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

	<input type="text" class="form-control" id="" placeholder="웹소켓 실험" name="">
	<button type="button" class="btn btn-primary me-2">send</button>
	
	<script>
		
	var ws = new SockJS("/fitty/echo");
	 	
 	ws.onopen = onOpen;

	ws.onmessage = onMessage;

	ws.onclose = onClose;
    
	ws.onerror = onError;
	
	   
	function onOpen(){
   		console.log('Info: connection opened.');
	}
	
	function onMessage(evt){
		console.log('Info: connection onmessage.');
   		let $socketAlert = $('#socketAlert');
   		$socketAlert.html(evt.data);
   		$socketAlert.css('display', 'block');
	}
	
	function onClose(evt){
		console.log('Info: connection closed');
	}
	
	function onError(err){
		console.log('Error:', err);
	}
	
	</script>
</body>
</html>