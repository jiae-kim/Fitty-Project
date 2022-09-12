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
		ArrayList<Attendance> attList = aDao.selectAllAttList(sqlSession, e);
		for(Attendance a : attList) {
			switch(a.getAttStatus()) {
			case "X" : a.setAttStatus("#E74C3C"); ; break; //결석
			case "L" : a.setAttStatus("#F1C40F"); ; break; // 지각
			case "E" : a.setAttStatus("#BF5BC7"); ; break; // 조퇴
			case "A" : a.setAttStatus("#00B050"); ; break; // 승인
			case "V" : a.setAttStatus("#29CCF9"); ; break; // 휴가
			case "Y" : a.setAttStatus("#686BFF"); ; break; // 연월차
			case "B" : a.setAttStatus("#FFFFFF"); ; break; // 베이직
			default : a.setAttStatus("#FFFFFF"); break;
			}
		}
		return attList;
	}
	
	@Override
	public ArrayList<Attendance> selectOtherAttList(Employee e) {
		
		ArrayList<Attendance> attList = aDao.selectOtherAttList(sqlSession, e);
		for(Attendance a : attList) {
			switch(a.getAttStatus()) {
			case "X" : a.setAttStatus("#E74C3C"); ; break; //결석
			case "L" : a.setAttStatus("#F1C40F"); ; break; // 지각
			case "E" : a.setAttStatus("#BF5BC7"); ; break; // 조퇴
			case "A" : a.setAttStatus("#00B050"); ; break; // 승인
			case "V" : a.setAttStatus("#29CCF9"); ; break; // 휴가
			case "Y" : a.setAttStatus("#686BFF"); ; break; // 연월차
			case "B" : a.setAttStatus("#FFFFFF"); ; break; // 베이직
			default : a.setAttStatus("#FFFFFF"); break;
			}
		}
		return attList;
	}

	
	@Override
	public ArrayList<Attendance> selectCountList(Employee e) {
		return aDao.selectCountList(sqlSession, e);
	}
	
	@Override
	public ArrayList<Attendance> selectOtherCountList(Employee e) {
		return aDao.selectOtherCountList(sqlSession, e);
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
