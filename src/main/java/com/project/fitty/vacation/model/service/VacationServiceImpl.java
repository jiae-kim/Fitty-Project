package com.project.fitty.vacation.model.service;

import java.util.ArrayList;
import java.util.HashMap;

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

	@Override
	public int deleteVacation(Vacation v) {
		return vDao.deleteVacation(sqlSession, v);
	}

	@Override
	public Vacation selectOneVacation(String no) {
		return vDao.selectOneVacation(sqlSession, no);
	}

	@Override
	public ArrayList<Vacation> selectYearVacList(HashMap <String, Object> map) {
		return vDao.selectYearVacList(sqlSession, map);
	}

	@Override
	public ArrayList<Vacation> selectRealVacList(HashMap <String, Object> map) {
		return vDao.selectRealVacList(sqlSession, map);
	}
	
	

}
