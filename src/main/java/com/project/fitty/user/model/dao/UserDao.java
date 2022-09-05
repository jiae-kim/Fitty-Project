package com.project.fitty.user.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.user.model.vo.User;

@Repository
public class UserDao {

	// [김지애] 1. 회원등록 서비스
	public int insertUser(SqlSessionTemplate sqlSession, User u) {
		return sqlSession.insert("userMapper.insertUser", u);
	}

	// [김지애] 2. 회원 전체조회 서비스 (페이징)
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("userMapper.selectListCount");
	}

	public ArrayList<User> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("userMapper.selectList", null, rowBounds);
	}

}
