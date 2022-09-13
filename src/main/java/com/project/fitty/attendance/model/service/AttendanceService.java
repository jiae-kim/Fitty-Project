package com.project.fitty.attendance.model.service;


import java.util.ArrayList;

import com.project.fitty.attendance.model.vo.Attendance;
import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.employee.model.vo.Employee;

public interface AttendanceService {
	
	// 출근시간, 상태 업데이트
	int updateWorkIn(Attendance a);
	
	// 출석용
	Attendance selectInAttendance(Attendance a);
	
	// 출석용
	Attendance selectOutAttendance(Attendance a);
	
	// 퇴근시간, 최종상태 업데이트
	int updateWorkOutLogOut(Attendance a);
	
	// 센터 전체 근태 조회 서비스
	ArrayList<Attendance> selectAllAttList(Employee e);
	
	// 센터 전체 해당달만 근태 조회 서비스
	ArrayList<Attendance> selectOtherAttList(Employee e);
	
	// 1년치 근태 세팅 서비스
	int insertAttendance(String empNo, String thisYear);
	
	// 1년치 근태 중 평일만 X로 바꾸기
	int updateAttendanceStatus(String empNo, String thisYear);
	
	// 1달 통계 구하기
	ArrayList<Attendance> selectCountList(Employee e);
	
	// 1달 통계 구하기
	ArrayList<Attendance> selectOtherCountList(Employee e);
}
