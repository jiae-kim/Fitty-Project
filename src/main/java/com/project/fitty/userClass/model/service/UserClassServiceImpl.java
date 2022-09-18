package com.project.fitty.userClass.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fitty.userClass.model.dao.UserClassDao;
import com.project.fitty.userClass.model.vo.Diet;
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
	@Override
	public Diet selectUserDiet(Diet di) {
		return ucDao.selectUserDiet(sqlSession, di);
	}


	//식단 등록
	@Override
	public int insertUserDiet(Diet di) {
		return ucDao.insertUserDiet(sqlSession, di);
	}


	//식단 업데이트
	@Override
	public int updateDietBoard(Diet di) {
		return ucDao.updateDietBoard(sqlSession, di);
	}


}
