package com.project.fitty.chat.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fitty.chat.model.dao.ChatDao;
import com.project.fitty.chat.model.vo.Chat;
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

	
	@Override
	public Chat countRoomFlag(Chat empC) {
		return cDao.countRoomFlag(sqlSession, empC);
	}
	

	@Override
	public Chat selectInvEmp(String invEmpNo) {
		return cDao.selectInvEmp(sqlSession, invEmpNo);
	}

	
	@Override
	public ArrayList<Chat> selectBubbleList(Chat c) {
		return cDao.selectBubbleList(sqlSession, c);
	}
	
	@Override
	public int insertChatInviteFirst(Chat c) {
		return cDao.insertChatInviteFirst(sqlSession, c);
	}

	@Override
	public ArrayList<Chat> selectRoomList(String empNo) {
		return cDao.selectRoomList(sqlSession, empNo);
	}


	@Override
	public int insertBubble(Chat c) {
		return cDao.insertBubble(sqlSession, c);
	}




}
