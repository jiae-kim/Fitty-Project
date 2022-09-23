package com.project.fitty.ptclass.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fitty.ptclass.model.dao.ClassDao;
import com.project.fitty.ptclass.model.vo.Exercise;
import com.project.fitty.ptclass.model.vo.PtClass;
import com.project.fitty.ptclass.model.vo.Reply;
import com.project.fitty.user.model.vo.User;
import com.project.fitty.userClass.model.vo.Diet;

@Service
public class ClassServiceImpl implements ClassService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ClassDao cDao;
	

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

	//내 회원 리스트 조회
	@Override
	public ArrayList<User> selectUserList(String empNo) {
		return cDao.selectUserList(sqlSession, empNo);
	}
	
	
	//운동 전체조회 (달력에 뿌릴)
	@Override
	public ArrayList<Exercise> selectExercise(int classNo) {
		return cDao.selectExercise(sqlSession, classNo);
	}

	
	//운동 리스트 조회 (오늘날짜)
	@Override
	public ArrayList<Exercise> selectExerciseList(Exercise e) {
		return cDao.selectExerciseList(sqlSession, e);
	}
	
	
	//운동 수정 전 조회
	@Override
	public Exercise selectEx(int exNo) {
		return cDao.selectEx(sqlSession, exNo);
	}

	
	//운동 등록
	@Override
	public int insertExercise(Exercise e) {
		return cDao.insertExercise(sqlSession, e);
	}
	
	
	//운동 완료 상태 변경
	@Override
	public int updateCheck(Exercise e) {
		return cDao.updateCheck(sqlSession, e);
	}
	
	//운동 삭제
	@Override
	public int deleteExercise(Exercise e) {
		return cDao.deleteExercise(sqlSession, e);
	}
	
	//운동 수정
	@Override
	public int updateExercise(Exercise e) {
		return cDao.updateExercise(sqlSession, e);
	}
	
	//수업번호에 따른 회원 식단조회
	@Override
	public ArrayList<Diet> selectDiet(int classNo) {
		return cDao.selectDiet(sqlSession, classNo);
	}
	
	//식단 상세조회
	@Override
	public Diet selectDietDetail(Diet di) {
		return cDao.selectDietDetail(sqlSession, di);
	}
	
	//댓글 리스트 조회
	@Override
	public ArrayList<Reply> selectReplyList(int dietNo) {
		return cDao.selectReplyList(sqlSession, dietNo);
	}

	//댓글 등록
	@Override
	public int insertReply(Reply r) {
		return cDao.insertReply(sqlSession, r);
	}

	//댓글 수정
	@Override
	public int updateReply(Reply r) {
		return cDao.updateReply(sqlSession, r);
	}

	//댓글 삭제
	@Override
	public int deleteReply(int replyNo) {
		return cDao.deleteReply(sqlSession, replyNo);
	}

	
}
