package com.project.fitty.ptclass.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.fitty.ptclass.model.vo.Reply;
import com.project.fitty.user.model.vo.User;

@Repository
public class ClassDao {
	
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("classMapper.selectReplyList", boardNo);
	}

	
	public int insertClass(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.insert("classMapper.insertClass", userNo);
	}
//	
//	public User selectUser(SqlSessionTemplate sqlSession, int userNo) {
//		return sqlSession.selectOne("classMapper.selectUser", userNo);
//	}
}
