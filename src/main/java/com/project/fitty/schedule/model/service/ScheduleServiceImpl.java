package com.project.fitty.schedule.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fitty.schedule.model.dao.ScheduleDao;
import com.project.fitty.schedule.model.vo.Booking;

@Service
public class ScheduleServiceImpl implements ScheduleService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ScheduleDao bDao;
	
	@Override // [김지애] 1. 직원용 - 스케줄 전체조회 서비스
	public ArrayList<Booking> selectList() {
		return null;
	}
	
	@Override // [김지애] 2. 직원용 - 스케줄 등록 서비스
	public int insertSchedule(Booking b) {
		return 0;
	}

	@Override
	public int updateSchedule(Booking b) {
		return 0;
	}

	@Override
	public int deleteSchedule(Booking b) {
		return 0;
	}

	@Override
	public int insertBooking(Booking b) {
		return 0;
	}

	@Override
	public int updateBooking(Booking b) {
		return 0;
	}

	@Override
	public int deleteBooking(Booking b) {
		return 0;
	}


}
