package com.project.fitty.schedule.model.service;

import java.util.ArrayList;
import java.util.List;

import com.project.fitty.schedule.model.vo.Booking;

public interface ScheduleService {

	// [김지애] 1. 직원용 - 스케줄 전체조회 서비스 (ajax)
	ArrayList<Booking> selectList();
	//List<Booking> selectList();
	
	// [김지애] 2. 회원용 - 스케줄 전체조회 서비스
	// 로그인한 회원의 담당 트레이너의 예약 내용만 조회
	String selectEmp(int userNo);
	ArrayList<Booking> selectUlist(String empNo);
	
	// [김지애] 3. 회원용 - 스케줄 상세조회 서비스
	// 로그인한 회원의 본인이 예약한 내용만 조회
	ArrayList<Booking> selectUdetailList();
	
	// [김지애] 4. 회원용 - 스케줄 등록 서비스
	int insertBooking(Booking b);
	
	// [김지애] 5. 회원용 - 스케줄 수정 서비스
	int updateBooking(Booking b);
	
	// [김지애] 6. 회원용 - 스케줄 삭제 서비스
	int deleteBooking(Booking b);

}
