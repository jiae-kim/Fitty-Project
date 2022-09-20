package com.project.fitty.chat.model.service;

import java.util.ArrayList;

import com.project.fitty.employee.model.vo.Employee;

public interface ChatService {
	
	ArrayList<Employee> selectChatEmpList(String searchText);

}
