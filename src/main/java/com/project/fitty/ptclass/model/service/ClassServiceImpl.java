package com.project.fitty.ptclass.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fitty.ptclass.model.dao.ClassDao;
import com.project.fitty.ptclass.model.vo.Reply;
import com.project.fitty.user.model.vo.User;

@Service
public class ClassServiceImpl implements ClassService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	private ClassDao cDao;
	
	//댓글 리스트 조회
	@Override
	public ArrayList<Reply> selectReplyList(int boardNo) {
		return cDao.selectReplyList(sqlSession, boardNo);
	}

	//댓글 등록
	@Override
	public int insertReply(Reply r) {
		return 0;
	}

	//수업 등록
	@Override
	public int insertClass(int userNo) {
		return cDao.insertClass(sqlSession, userNo);
	}

//	//회원 조회
//	@Override
//	public User selectUser(int userNo) {
//		return cDao.selectUser(sqlSession, userNo);
//	}
	
}
