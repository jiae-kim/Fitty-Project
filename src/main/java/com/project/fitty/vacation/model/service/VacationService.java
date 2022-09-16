package com.project.fitty.vacation.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.project.fitty.attendance.model.vo.Attendance;
import com.project.fitty.vacation.model.vo.Vacation;

public interface VacationService {

	
	// 기본 a 리스트 각 멤버당 부여사용잔여연월차휴가 리스트
		ArrayList<Vacation> selectEmpVacList(Attendance a);
	
	// 연월차 휴가 생성
		int insertVacation(Vacation v);
	
	// 연월차 휴가 삭제
		int deleteVacation(Vacation v);

}
