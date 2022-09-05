package com.project.fitty.attendance.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.fitty.attendance.model.vo.Attendance;

@Repository
public class AttendanceDao {

	public ArrayList<Attendance> selectAllAttList(SqlSessionTemplate sqlSession, String empNo) {
		System.out.println((ArrayList)sqlSession.selectList("attendanceMapper.selectAllAttList", empNo));
		System.out.println(empNo);
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectAllAttList", empNo);
	}
	
}
