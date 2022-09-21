package com.project.fitty.chat.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.project.fitty.chat.model.service.ChatService;
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
	@RequestMapping(value="chatEmp.c", produces="application/json; charset=utf-8")
	public String selectChatEmpList(){
		ArrayList<Employee> list = cService.selectChatEmpList();
		return new Gson().toJson(list);
	}
}
