package com.project.fitty.alert.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fitty.alert.model.dao.AlertDao;
import com.project.fitty.alert.model.vo.Alert;

@Service
public class AlertService {

	@Autowired
	private AlertDao aDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertAlertM(Alert a) {
		return aDao.insertAlertM(sqlSession, a);
	}
	
	public ArrayList<Alert> selectAlertList(String alRecip){
		return aDao.selectAlertList(sqlSession, alRecip);
	}
}
