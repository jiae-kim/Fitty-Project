package com.project.fitty.alert.handler;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EcoHandler extends TextWebSocketHandler {

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		System.out.println("웹 소켓 연결된 클라이언트 session : " + session);
		System.out.println("session의 attributes : " + session.getAttributes());
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		System.out.println("메세지 발신자 클라이언트 session : " + session);
		System.out.println("발신된 메세지 TextMessage : " + message);
		System.out.println("실제 메세지 : " + message.getPayload());
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		System.out.println("웹 소켓 나간 클라이언트 session : " + session);
	}
	
	
}
