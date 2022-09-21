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
	
	public int insertExercise(SqlSessionTemplate sqlSession, Exercise e) {
		return sqlSession.insert("classMapper.insertExercise", e);
	}
	
	public ArrayList<Exercise> selectExerciseList(SqlSessionTemplate sqlSession, Exercise e){
		return (ArrayList)sqlSession.selectList("classMapper.selectExerciseList", e);
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
	
	public Exercise selectExercise(SqlSessionTemplate sqlSession, Exercise e) {
		return sqlSession.selectOne("classMapper.selectExercise", e);
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
