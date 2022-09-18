package com.project.fitty.userClass.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.fitty.userClass.model.vo.Diet;
import com.project.fitty.userClass.model.vo.UserClass;

@Repository
public class UserClassDao {
	
	
	//로그인
	public UserClass loginUser(SqlSessionTemplate sqlSession, UserClass u) {
		return sqlSession.selectOne("userClassMapper.loginUser", u);
	}
	
	
	//식단 상세조회
	public Diet selectUserDiet(SqlSessionTemplate sqlSession, Diet di) {
		return sqlSession.selectOne("userClassMapper.selectUserDiet", di);
	}

	
	//식단 등록
	public int insertUserDiet(SqlSessionTemplate sqlSession, Diet di) {
		return sqlSession.insert("userClassMapper.insertUserDiet", di);
	}
	
	
	//식단 업데이트
	public int updateDietBoard(SqlSessionTemplate sqlSession, Diet di) {
		return sqlSession.update("userClassMapper.updateDietBoard", di);
	}
	
	
}
