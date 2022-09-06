package com.project.fitty.employee.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.fitty.employee.model.vo.Employee;

@Repository
public class EmployeeDao {
	
	
	public Employee loginEmployee(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.selectOne("employeeMapper.loginEmployee", e);
	}
	
	public String selectNextEmpNo(SqlSessionTemplate sqlSession) {
		return  sqlSession.selectOne("employeeMapper.selectNextEmpNo");
		
	}

	
	public int insertEmployee(Employee e, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("employeeMapper.insertEmployee", e);
	}
	
	public ArrayList<Employee> selectEmpList(SqlSessionTemplate sqlSession){
		return  (ArrayList)sqlSession.selectList("employeeMapper.selectEmpList");
	}
	
}
