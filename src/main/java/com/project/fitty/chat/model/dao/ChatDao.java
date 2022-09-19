package com.project.fitty.chat.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.fitty.employee.model.vo.Employee;

@Repository
public class ChatDao {
	
	public ArrayList<Employee> selectChatEmpList(SqlSessionTemplate sqlSession){
		return (ArrayList) sqlSession.selectList("chatMapper.selectChatEmpList");
	}

}
