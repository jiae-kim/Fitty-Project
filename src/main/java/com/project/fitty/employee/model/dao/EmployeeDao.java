package com.project.fitty.employee.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.fitty.common.model.vo.PageInfo;
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
	
	public ArrayList<Employee> selectEmpList(SqlSessionTemplate sqlSession, PageInfo pi){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return  (ArrayList)sqlSession.selectList("employeeMapper.selectEmpList", null, rowBounds);
	}
	
	
	public int selectEmpListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.insert("employeeMapper.selectEmpListCount");
	}
}
