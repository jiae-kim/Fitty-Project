package com.project.fitty.attendance.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fitty.attendance.model.dao.AttendanceDao;
import com.project.fitty.attendance.model.dao.ModifyAttDao;
import com.project.fitty.attendance.model.vo.ModifyAtt;

@Service
public class ModifyAttServiceImpl implements ModifyAttService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ModifyAttDao mDao;

	@Override
	public ArrayList<ModifyAtt> selectModifyList(String empNo) {
		return mDao.selectModifyList(sqlSession, empNo);
	}

	@Override
	public ModifyAtt selectModifyDetail(String moAttNo) {
		return mDao.selectModifyDetail(sqlSession, moAttNo);
	}
}
