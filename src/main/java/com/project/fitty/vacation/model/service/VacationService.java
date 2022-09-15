package com.project.fitty.vacation.model.service;

import java.util.ArrayList;

import com.project.fitty.attendance.model.vo.Attendance;
import com.project.fitty.vacation.model.vo.Vacation;

public interface VacationService {

	
	// 기본 a 리스트 각 멤버당 부여사용잔여연월차휴가 리스트
		ArrayList<Vacation> selectEmpVacList(Attendance a);
}
