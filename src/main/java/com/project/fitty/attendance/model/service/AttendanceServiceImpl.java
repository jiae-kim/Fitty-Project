package com.project.fitty.attendance.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fitty.attendance.model.dao.AttendanceDao;
import com.project.fitty.attendance.model.vo.Attendance;

@Service
public class AttendanceServiceImpl implements AttendanceService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AttendanceDao aDao;

	@Override
	public ArrayList<Attendance> selectAllAttList(String empNo) {
		return aDao.selectAllAttList(sqlSession, empNo);
	}

	@Override
	public int insertAttendance(String empNo) {
		return 0;
	}

}
