package com.project.fitty.userClass.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.fitty.userClass.model.vo.UserClass;

@Repository
public class UserClassDao {
	
	
	//로그인
	public UserClass loginUser(SqlSessionTemplate sqlSession, UserClass u) {
		return sqlSession.selectOne("userClassMapper.loginUser", u);
	}

}
