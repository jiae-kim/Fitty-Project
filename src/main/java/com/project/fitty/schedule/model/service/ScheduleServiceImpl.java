package com.project.fitty.schedule.model.service;

import java.util.ArrayList;
import java.util.List;

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
	
	@Override // [김지애] 1. 직원용 - 스케줄 전체조회 서비스 (ajax)
	public ArrayList<Booking> selectList() {
		return bDao.selectList(sqlSession);
	}

	@Override // [김지애] 2. 회원용 - 스케줄 전체조회 서비스 (ajax)
	public String selectEmp(int userNo) {
		return bDao.selectEmp(sqlSession, userNo);
	}
	
	@Override 
	public ArrayList<Booking> selectUlist(String empNo) {
		return bDao.selectUlist(sqlSession, empNo);
	}
 
	@Override // [김지애] 3. 회원용 - 스케줄 상세조회 서비스 (ajax)
	public Booking selectUdetailList(int bookNo) {
		return bDao.selectUdetailList(sqlSession, bookNo);
	}
	
	@Override // [김지애] 4. 회원용 - 스케줄 등록 서비스
	public int insertBooking(Booking b) {
		return bDao.insertBooking(sqlSession, b);
	}

	@Override // [김지애] 5. 회원용 - 스케줄 수정 서비스
	public int updateBooking(Booking b) {
		return bDao.updateBooking(sqlSession, b);
	}

	@Override // [김지애] 6. 회원용 - 스케줄 삭제 서비스
	public int deleteBooking(Booking b) {
		return bDao.deleteBooking(sqlSession, b);
	}

}
