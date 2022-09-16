package com.project.fitty.vacation.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fitty.attendance.model.vo.Attendance;
import com.project.fitty.vacation.model.dao.VacationDao;
import com.project.fitty.vacation.model.vo.Vacation;

@Service
public class VacationServiceImpl implements VacationService{

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private VacationDao vDao;
	
	@Override
	public ArrayList<Vacation> selectEmpVacList(Attendance a) {
		return vDao.selectEmpVacList(sqlSession, a);
	}

	@Override
	public int insertVacation(Vacation v) {
		return vDao.insertVacation(sqlSession, v);
	}

}
