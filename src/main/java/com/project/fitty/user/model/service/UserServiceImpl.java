package com.project.fitty.user.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fitty.user.model.dao.UserDao;
import com.project.fitty.user.model.vo.User;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private UserDao uDao;

	@Override // [김지애] 회원등록 서비스
	public int insertUser(User u) {
		return 0;
	}

	@Override // [김지애] 회원수정 서비스
	public int updateUser(User u) {
		return 0;
	}

	@Override // [김지애] 회원삭제 서비스
	public int deleteUser(String userNo) {
		return 0;
	}
	
	
	
}
