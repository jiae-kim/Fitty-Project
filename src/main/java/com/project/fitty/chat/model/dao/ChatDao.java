package com.project.fitty.chat.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.fitty.chat.model.vo.Chat;
import com.project.fitty.employee.model.vo.Employee;

@Repository
public class ChatDao {
	
	public ArrayList<Employee> selectChatEmpList(SqlSessionTemplate sqlSession, String searchText){
		return (ArrayList) sqlSession.selectList("chatMapper.selectChatEmpList", searchText);
	}
	
	public Chat countRoomFlag(SqlSessionTemplate sqlSession, HashMap map) {
		return sqlSession.selectOne("chatMapper.countRoomFlag", map);
	}
	
	public ArrayList<Chat> selectBubbleList(SqlSessionTemplate sqlSession, Chat c){
		return (ArrayList) sqlSession.selectList("chatMapper.selectBubbleList", c);
	}
	
	public int insertChatInviteFirst(SqlSessionTemplate sqlSession, Chat c) {
		return sqlSession.insert("chatMapper.insertChatInviteFirst", c);
	}
	
	public ArrayList<Chat> selectRoomList(SqlSessionTemplate sqlSession, String empNo){
		return (ArrayList) sqlSession.selectList("chatMapper.selectRoomList", empNo);
	}

}
