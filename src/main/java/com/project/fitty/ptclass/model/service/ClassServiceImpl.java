package com.project.fitty.ptclass.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fitty.ptclass.model.dao.ClassDao;
import com.project.fitty.ptclass.model.vo.PtClass;
import com.project.fitty.ptclass.model.vo.Reply;
import com.project.fitty.user.model.vo.User;

@Service
public class ClassServiceImpl implements ClassService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
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
	public int insertClass(PtClass pt) {
		return cDao.insertClass(sqlSession, pt);
	}

	//회원 조회
	@Override
	public User selectUser(int userNo) {
		return cDao.selectUser(sqlSession, userNo);
	}

	//수업등록 상태로 변경
	@Override
	public int updateStatus(int userNo) {
		return cDao.updateStatus(sqlSession, userNo);
	}
	
}
