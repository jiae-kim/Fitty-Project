package com.project.fitty.schedule.model.service;

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
	private ScheduleDao sdDao;
	
	@Override
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
