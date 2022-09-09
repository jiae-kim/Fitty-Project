package com.project.fitty.attendance.model.service;


import java.util.ArrayList;

import com.project.fitty.attendance.model.vo.Attendance;
import com.project.fitty.employee.model.vo.Employee;

public interface AttendanceService {
	
	// 센터 전체 근태 조회 서비스
	ArrayList<Attendance> selectAllAttList(Employee e);
	
	// 1년치 근태 세팅 서비스
	int insertAttendance(String empNo);
	
	int updateAttendanceStatus(String empNo);
	
}
