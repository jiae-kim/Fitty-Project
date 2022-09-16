package com.project.fitty.alert.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.fitty.alert.model.vo.Alert;

@Repository
public class AlertDao {
	
	public int insertAlertM(SqlSessionTemplate sqlSession, Alert a) {
		return sqlSession.insert("alertMapper.insertAlertM",a);
	}
	
	public ArrayList<Alert> selectAlertList(SqlSessionTemplate sqlSession, String alRecip){
		return (ArrayList)sqlSession.selectList("alertMapper.selectAlertList", alRecip);
	}
	
	public int updateReadYn(SqlSessionTemplate sqlSession, int alNo) {
		return sqlSession.update("alertMapper.updateReadYn", alNo);
	}
	
	public String selectSenderName(SqlSessionTemplate sqlSession, String empNo) {
		return sqlSession.selectOne("alertMapper.selectSenderName", empNo);
	}
	
	public int selectLastAlNo(SqlSessionTemplate sqlSession) {
    	return sqlSession.selectOne("alertMapper.selectLastAlNo");
    }

    public int selectNextAlNo(SqlSessionTemplate sqlSession) {
    	return sqlSession.selectOne("alertMapper.selectNextAlNo");
    }

}
