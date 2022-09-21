package com.project.fitty.email.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.email.model.vo.Email;

@Repository
public class EmailDao {

	public ArrayList<Email> selectSentEmailList(SqlSessionTemplate sqlSession, PageInfo pi, Email em) {
		
		int limit = pi.getBoardLimit(); 
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList)sqlSession.selectList("mailMapper.selectSentEmailList", em, rowBounds);
	}

	public ArrayList<Email> selectReceivedEmailList(SqlSessionTemplate sqlSession, PageInfo pi, Email em) {
		
		int limit = pi.getBoardLimit(); 
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList)sqlSession.selectList("mailMapper.selectReceivedEmailList", em, rowBounds);
	}

	public ArrayList<Email> selectTrashEmailList(SqlSessionTemplate sqlSession, PageInfo pi, Email em) {
		
		int limit = pi.getBoardLimit(); 
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList)sqlSession.selectList("mailMapper.selectTrashEmaiList", em, rowBounds);
	}

	public int sentEmailListCount(SqlSessionTemplate sqlSession, Email em) {
		return sqlSession.selectOne("mailMapper.sentEmailListCount", em);
	}

	public int receivedEmailListCount(SqlSessionTemplate sqlSession, Email em) {
		return sqlSession.selectOne("mailMapper.receivedEmailListCount", em);
	}

	public int trashEmailListCount(SqlSessionTemplate sqlSession, Email em) {
		return sqlSession.selectOne("mailMapper.trashEmailListCount", em);
	}


}