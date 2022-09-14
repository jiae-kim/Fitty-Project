package com.project.fitty.employee.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.fitty.attendance.model.vo.Attendance;
import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.employee.model.vo.Employee;

@Repository
public class EmployeeDao {
	
	
	public Employee loginEmployee(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.selectOne("employeeMapper.loginEmployee", e);
	}
	/*
	public Employee attFlag(SqlSessionTemplate sqlSession, Employee e) {
		Attendance a = sqlSession.selectOne("attendanceMapper.attFlag", e);
		System.out.println(a.getAttIn());
		System.out.println(a.getAttOut());
		e.setAttIn(a.getAttIn());
		e.setAttOut(a.getAttOut());
		return e;
	}*/
	
	public String selectNextEmpNo(SqlSessionTemplate sqlSession) {
		return  sqlSession.selectOne("employeeMapper.selectNextEmpNo");
		
	}

	
	public int insertEmployee(Employee e, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("employeeMapper.insertEmployee", e);
	}
	
	
	// 페이지네이션 하는 empList
	public ArrayList<Employee> selectEmpList(SqlSessionTemplate sqlSession, PageInfo pi){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return  (ArrayList)sqlSession.selectList("employeeMapper.selectEmpList", null, rowBounds);
	}
	
	
	// 페이지네이션 없는 empList
	public ArrayList<Employee> selectEmpList(SqlSessionTemplate sqlSession){
		return  (ArrayList)sqlSession.selectList("employeeMapper.selectEmpList");
	}
	
	// 전체 직원리스트 empList
	public int selectEmpListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.insert("employeeMapper.selectEmpListCount");
	}
	
	
	
	// 주소록용 계층형 empList
	public ArrayList<Employee> selectLevelEmployeeList(SqlSessionTemplate sqlSession){
		return  (ArrayList)sqlSession.selectList("employeeMapper.selectLevelEmployeeList");
	}
	
	
	// 회원번호를 통해 해당 회원 주소 select
	public ArrayList<Employee> checkEmpNoList(SqlSessionTemplate sqlSession, String empNo){
		return (ArrayList)sqlSession.selectList("employeeMapper.checkEmpNoList", empNo);
	}
	
	
	// 회원번호 지운 empList
	public ArrayList<Employee> deleteEmpNoList(SqlSessionTemplate sqlSession,String empNo) {
		return (ArrayList)sqlSession.selectList("employeeMapper.checkEmpNoList", empNo);
	}
	
	// 직원 퇴사버튼
	public int deleteEmployee(SqlSessionTemplate sqlSession, String empNo) {
		return sqlSession.update("employeeMapper.deleteEmployee", empNo);
	}
	
}
