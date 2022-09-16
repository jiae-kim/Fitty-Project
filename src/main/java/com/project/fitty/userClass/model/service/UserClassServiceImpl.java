package com.project.fitty.userClass.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fitty.userClass.model.dao.UserClassDao;
import com.project.fitty.userClass.model.vo.UserClass;

@Service
public class UserClassServiceImpl implements UserClassService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private UserClassDao ucDao;
	
	
	
	//로그인
	@Override
	public UserClass loginUser(UserClass u) {
		return ucDao.loginUser(sqlSession, u);
	}
	
	

	//식단 상세조회
//	@Override
//	public UserClass selectUserDiet(String dietDate, String userNo) {
//		return null;
//	}

}
