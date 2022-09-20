package com.project.fitty.chat.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fitty.chat.model.dao.ChatDao;
import com.project.fitty.employee.model.vo.Employee;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ChatDao cDao;

	@Override
	public ArrayList<Employee> selectChatEmpList(String searchText) {
		return cDao.selectChatEmpList(sqlSession, searchText);
	}
}
