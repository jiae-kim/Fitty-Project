package com.project.fitty.email.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.email.model.vo.Email;

@Repository
public class EmailDao {

	
// clear
	public ArrayList<Email> selectReceivedEmailList(SqlSessionTemplate sqlSession, PageInfo pi, Email em) {
		
		int limit = pi.getBoardLimit(); 
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList)sqlSession.selectList("emailMapper.selectReceivedEmailList", em, rowBounds);
	}

	
	
	public int receivedEmailListCount(SqlSessionTemplate sqlSession, Email em) {
		System.out.println(em);
		System.out.println(sqlSession);
		return sqlSession.selectOne("emailMapper.receivedEmailListCount", em);
	}

// clear.
	
	// 보낸메일함 조회
	public ArrayList<Email> selectSentEmailList(SqlSessionTemplate sqlSession, PageInfo pi, Email em) {
		
		int limit = pi.getBoardLimit(); 
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList)sqlSession.selectList("emailMapper.selectSentEmailList", em, rowBounds);
	}
	
	
	public int sentEmailListCount(SqlSessionTemplate sqlSession, Email em) {
		return sqlSession.selectOne("emailMapper.sentEmailListCount", em);
	}
	
	// 휴지통 
	public ArrayList<Email> selectTrashEmailList(SqlSessionTemplate sqlSession, PageInfo pi, Email em) {
		
		int limit = pi.getBoardLimit(); 
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList)sqlSession.selectList("emailMapper.selectTrashEmaiList", em, rowBounds);
	}
	
	public int trashEmailListCount(SqlSessionTemplate sqlSession, Email em) {
		return sqlSession.selectOne("emailMapper.trashEmailListCount", em);
	}
	
	// 내게쓴메일함
	
	public ArrayList<Email> selectStmEmailList(SqlSessionTemplate sqlSession, PageInfo pi, Email em) {
		
		int limit = pi.getBoardLimit(); 
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList)sqlSession.selectList("emailMapper.selectStmEmailList", em, rowBounds);
	}
	
	public int stmEmailListCount(SqlSessionTemplate sqlSession, Email em) {
		return sqlSession.selectOne("emailMapper.stmEmailListCount", em);
	}

	

}