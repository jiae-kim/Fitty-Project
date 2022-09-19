package com.project.fitty.schedule.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.fitty.schedule.model.vo.Booking;

@Repository
public class ScheduleDao {

	// [김지애] 1. 직원용 - 스케줄 전체조회 서비스
	public ArrayList<Booking> selectList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("scheduleMapper.selectList");
	}

	// [김지애] 2. 회원용 - 스케줄 전체조회 서비스
	public String selectEmp(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("scheduleMapper.selectEmp", userNo);
	}
	
	public ArrayList<Booking> selectUlist(SqlSessionTemplate sqlSession, String empNo) {
		return (ArrayList)sqlSession.selectList("scheduleMapper.selectUlist", empNo);
	}

	// [김지애] 4. 회원용 - 스케줄 등록 서비스
	public int insertBooking(SqlSessionTemplate sqlSession, Booking b) {
		return sqlSession.insert("scheduleMapper.insertBooking", b);
	}


	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	public int insertSchedule(SqlSessionTemplate sqlSession, Booking b) {
		return sqlSession.insert("scheduleMapper.insertSchedule", b);
	}
	*/
}
