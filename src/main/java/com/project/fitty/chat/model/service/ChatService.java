package com.project.fitty.chat.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.project.fitty.chat.model.vo.Chat;
import com.project.fitty.employee.model.vo.Employee;

public interface ChatService {
	
	ArrayList<Employee> selectChatEmpList(String searchText);
	
	Chat countRoomFlag(Chat empC);
	
	int insertChatInviteFirst(Chat c);
	
	Chat selectInvEmp (String invEmpNo);

	ArrayList<Chat> selectBubbleList(Chat c);
	
	ArrayList<Chat> selectRoomList(String empNo);
	
	int insertBubble(Chat c);

}
