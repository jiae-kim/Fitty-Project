package com.project.fitty.ptclass.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.fitty.ptclass.model.vo.PtClass;
import com.project.fitty.ptclass.model.vo.Reply;
import com.project.fitty.user.model.vo.User;

@Repository
public class ClassDao {
	
	
	public User selectUser(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("classMapper.selectUser", userNo);
	}
	
	public int insertClass(SqlSessionTemplate sqlSession, PtClass pt) {
		return sqlSession.insert("classMapper.insertClass", pt);
	}
	
	public int updateStatus(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.update("classMapper.updateStatus", userNo);
	}

	public ArrayList<User> selectUserList(SqlSessionTemplate sqlSession, String empNo){
		return (ArrayList)sqlSession.selectList("classMapper.selectUserList", empNo);
	}
	
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int dietNo) {
		return (ArrayList)sqlSession.selectList("classMapper.selectReplyList", dietNo);
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("classMapper.insertReply", r);
	}
}
