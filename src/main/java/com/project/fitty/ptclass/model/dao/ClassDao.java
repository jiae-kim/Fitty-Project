package com.project.fitty.ptclass.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.fitty.ptclass.model.vo.Exercise;
import com.project.fitty.ptclass.model.vo.PtClass;
import com.project.fitty.ptclass.model.vo.Reply;
import com.project.fitty.user.model.vo.User;
import com.project.fitty.userClass.model.vo.Diet;

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
	
	
	//해당 회원의 운동 전체 조회(달력에 뿌릴내용)
	public ArrayList<Exercise> selectExercise(SqlSessionTemplate sqlSession, int exNo){
		return (ArrayList)sqlSession.selectList("classMapper.selectExercise", exNo);
	}
	
	//해당 회원의 운동 리스트 중 특정 날짜의 운동만을 조회
	public ArrayList<Exercise> selectExerciseList(SqlSessionTemplate sqlSession, Exercise e){
		return (ArrayList)sqlSession.selectList("classMapper.selectExerciseList", e);
	}
	
	//수정을 위해 특정 운동만을 조회
	public Exercise selectEx(SqlSessionTemplate sqlSession, int exNo) {
		return sqlSession.selectOne("classMapper.selectEx", exNo);
	}
	
	
	public int insertExercise(SqlSessionTemplate sqlSession, Exercise e) {
		return sqlSession.insert("classMapper.insertExercise", e);
	}
	
	public int updateCheck(SqlSessionTemplate sqlSession, Exercise e) {
		return sqlSession.update("classMapper.updateCheck", e);
	}
	
	public int deleteExercise(SqlSessionTemplate sqlSession, Exercise e) {
		return sqlSession.delete("classMapper.deleteExercise", e);
	}
	
	public int updateExercise(SqlSessionTemplate sqlSession, Exercise e) {
		return sqlSession.update("classMapper.updateExercise", e);
	}
	
	
	
	public ArrayList<Diet> selectDiet(SqlSessionTemplate sqlSession, int classNo) {
		return (ArrayList)sqlSession.selectList("classMapper.selectDiet", classNo);
	}
	
	public Diet selectDietDetail(SqlSessionTemplate sqlSession, Diet di) {
		return sqlSession.selectOne("classMapper.selectDietDetail", di);
	}
	
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int dietNo) {
		return (ArrayList)sqlSession.selectList("classMapper.selectReplyList", dietNo);
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("classMapper.insertReply", r);
	}
	
	public int updateReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.update("classMapper.updateReply", r);
	}
}
