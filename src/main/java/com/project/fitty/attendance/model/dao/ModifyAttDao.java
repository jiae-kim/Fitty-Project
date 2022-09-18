package com.project.fitty.attendance.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.fitty.attendance.model.vo.ModifyAtt;

@Repository
public class ModifyAttDao {

	
	public ArrayList<ModifyAtt> selectModifyList(SqlSessionTemplate sqlSession, String empNo){
		return (ArrayList)sqlSession.selectList("modifyAttMapper.selectModifyList",empNo);
	}
	
	public ModifyAtt selectModifyDetail(SqlSessionTemplate sqlSession, String moAttNo) {
		return sqlSession.selectOne("modifyAttMapper.selectModifyDetail",moAttNo);
	}
	
	public int insertMoAtt(SqlSessionTemplate sqlSession, ModifyAtt m) {
		return sqlSession.insert("modifyAttMapper.insertMoAtt", m);
	}
	
	public ArrayList<ModifyAtt> selectAllModifyList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("modifyAttMapper.selectAllModifyList");
	}
	
	public int updateModifyAtt(SqlSessionTemplate sqlSession, ModifyAtt m) {
		return sqlSession.update("modifyAttMapper.updateModifyAtt", m);
		}
	
	public int cantUpdateModifyAtt(SqlSessionTemplate sqlSession, ModifyAtt m) {
		return sqlSession.update("modifyAttMapper.cantUpdateModifyAtt", m);
		}
}
