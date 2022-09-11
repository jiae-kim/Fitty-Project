package com.project.fitty.attendance.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fitty.attendance.model.dao.AttendanceDao;
import com.project.fitty.attendance.model.vo.Attendance;
import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.employee.model.vo.Employee;

@Service
public class AttendanceServiceImpl implements AttendanceService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AttendanceDao aDao;

	@Override
	public ArrayList<Attendance> selectAllAttList(Employee e) {
		return aDao.selectAllAttList(sqlSession, e);
	}
	
	@Override
	public ArrayList<Attendance> selectCountList(Employee e) {
		return aDao.selectCountList(sqlSession, e);
	}

	@Override
	public int insertAttendance(String empNo, String thisYear) {
		Attendance a = new Attendance();
		a.setEmpNo(empNo);
		a.setThisYear(thisYear);
		return aDao.insertAttendance(sqlSession, a);
	}

	@Override
	public int updateAttendanceStatus(String empNo, String thisYear) {
		Attendance a = new Attendance();
		a.setEmpNo(empNo);
		a.setThisYear(thisYear);
		return aDao.updateAttendanceStatus(sqlSession, a);
	}

	

	
}
