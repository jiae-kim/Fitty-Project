package com.project.fitty.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.project.fitty.chat.model.service.ChatService;
import com.project.fitty.chat.model.vo.Chat;
import com.project.fitty.employee.model.service.EmployeeService;
import com.project.fitty.employee.model.vo.Employee;

@Controller
public class ChatController {
	
	@Autowired	
	private EmployeeService eService;
	@Autowired
	private ChatService cService;
	
	@RequestMapping("chat.ch")
	public String goChat() {
		return "chat/chatEmpList";
	}
	
	@ResponseBody
	@RequestMapping(value="chatEmp.ch", produces="application/json; charset=utf-8" )
	public String selectChatEmpList(String searchText){
		ArrayList<Employee> list = cService.selectChatEmpList(searchText);
		return new Gson().toJson(list);
	}
	
	@RequestMapping(value="bubbleList.ch",  produces="application/json; charset=utf-8")
	public String selectChatRoomOne(String empNo, String invEmpNo, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("empNo", empNo);
		map.put("invEmpNo", invEmpNo);
		Chat c= cService.countRoomFlag(map);
		ArrayList<Chat> bubbleList = new ArrayList<>();
		if(c != null) {
			//이미 채팅방이 존재하기때문에 채팅대화내용을 불러오면 됨
			bubbleList = cService.selectBubbleList(c);
		} else {
			// 채팅방이 없는경우 채팅방을 만들어주고, 초대해줘야함
			int result = cService.insertChatInviteFirst(c);
			
			if(result > 1) {
				
			} else {
				session.setAttribute("alertMsg", "채팅창 로딩 실패");
			}
		}
		return new Gson().toJson(bubbleList);
	}
	
	@RequestMapping("testChat")
	public String selectChatRoomOne() {
		return "chat/test";
	}
}
