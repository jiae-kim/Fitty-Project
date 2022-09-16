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
	
	// 알림 insert
	public int insertAlertM(Alert a) {
		return aDao.insertAlertM(sqlSession, a);
	}
	
	// 알림 select 
	public ArrayList<Alert> selectAlertList(String alRecip){
		return aDao.selectAlertList(sqlSession, alRecip);
	}
	
	// 알림 읽음처리 상태값 바꿔주는 메소드
	public int updateReadYn(int alNo) {
		return aDao.updateReadYn(sqlSession, alNo);
	}
	
	// 사번으로 이름 조회해오기
	public String selectSenderName(String empNo) {
		return aDao.selectSenderName(sqlSession, empNo);
	}
	
	// 현재 마지막으로 실행된 alNo를 조회해오기 
	public int selectLastAlNo() {
		return aDao.selectLastAlNo(sqlSession);
	}
	
}
