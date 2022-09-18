package com.project.fitty.attendance.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fitty.attendance.model.dao.AttendanceDao;
import com.project.fitty.attendance.model.dao.ModifyAttDao;

@Service
public class ModifyAttServiceImpl implements ModifyAttService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ModifyAttDao mDao;
}
