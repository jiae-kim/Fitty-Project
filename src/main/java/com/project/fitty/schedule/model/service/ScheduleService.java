package com.project.fitty.schedule.model.service;

import com.project.fitty.schedule.model.vo.Booking;

public interface ScheduleService {

	// [김지애] 직원용 - 스케줄 전체조회 서비스
	
	// [김지애] 직원용 - 스케줄 등록 서비스
	int insertSchedule(Booking b);
	
	// [김지애] 직원용 - 스케줄 수정 서비스
	int updateSchedule(Booking b);
	
	// [김지애] 직원용 - 스케줄 삭제 서비스
	int deleteSchedule(Booking b);
	
	// [김지애] 회원용 - 스케줄 전체조회 서비스
	
	// [김지애] 회원용 - 스케줄 등록 서비스
	int insertBooking(Booking b);
	
	// [김지애] 회원용 - 스케줄 수정 서비스
	int updateBooking(Booking b);
	
	// [김지애] 회원용 - 스케줄 삭제 서비스
	int deleteBooking(Booking b);
}
