package com.project.fitty.ptclass.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.fitty.ptclass.model.vo.PtClass;
import com.project.fitty.ptclass.model.vo.Reply;
import com.project.fitty.user.model.vo.User;

@Repository
public class ClassDao {
	
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("classMapper.selectReplyList", boardNo);
	}

	public User selectUser(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("classMapper.selectUser", userNo);
	}
	
	
	public int insertClass(SqlSessionTemplate sqlSession, PtClass pt) {
		return sqlSession.insert("classMapper.insertClass", pt);
	}
	
	public int updateStatus(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.update("classMapper.updateStatus", userNo);
	}
}
