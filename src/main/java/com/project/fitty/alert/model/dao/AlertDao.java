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

}
