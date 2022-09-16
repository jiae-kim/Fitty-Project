package com.project.fitty.vacation.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.fitty.attendance.model.vo.Attendance;
import com.project.fitty.vacation.model.vo.Vacation;

@Repository
public class VacationDao {
	
	public ArrayList<Vacation> selectEmpVacList(SqlSessionTemplate sqlSession, Attendance a){
		return (ArrayList) sqlSession.selectList("vacationMapper.selectEmpVacList", a);
	}
	
	public  int insertVacation(SqlSessionTemplate sqlSession, Vacation v) {
		return sqlSession.insert("vacationMapper.insertVacation", v);
	}
	
	public  int deleteVacation(SqlSessionTemplate sqlSession, Vacation v) {
		// 말이 delete지 사실상 insert임
		return sqlSession.insert("vacationMapper.deleteVacation", v);
	}
	
	public Vacation selectOneVacation(SqlSessionTemplate sqlSession, String no) {
		return sqlSession.selectOne("vacationMapper.selectOneVacation", no);
	}
}
