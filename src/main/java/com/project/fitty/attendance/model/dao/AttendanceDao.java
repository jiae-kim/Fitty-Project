package com.project.fitty.attendance.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.fitty.attendance.model.vo.Attendance;
import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.employee.model.vo.Employee;

@Repository
public class AttendanceDao {

	public ArrayList<Attendance> selectAllAttList(SqlSessionTemplate sqlSession, Employee e) {
	
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectAllAttList", e);
		
	}
	public ArrayList<Attendance> selectCountList( SqlSessionTemplate sqlSession, Employee e) {
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectCountList", e);
	}
	
	
	public int insertAttendance(SqlSessionTemplate sqlSession, Attendance a) {
		return sqlSession.insert("attendanceMapper.insertAttendance", a);
	}
	
	public int updateAttendanceStatus(SqlSessionTemplate sqlSession, Attendance a) {
		return sqlSession.insert("attendanceMapper.updateAttendanceStatus", a);
	}
	
}
