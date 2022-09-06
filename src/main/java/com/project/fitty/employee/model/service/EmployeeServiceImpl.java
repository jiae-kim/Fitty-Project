package com.project.fitty.employee.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.employee.model.dao.EmployeeDao;
import com.project.fitty.employee.model.vo.Employee;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private EmployeeDao eDao;

	@Override
	public Employee loginEmployee(Employee e) {
		return eDao.loginEmployee(sqlSession, e);
	}
	

	@Override
	public String selectNextEmpNo() {
		return eDao.selectNextEmpNo(sqlSession);
		
	}
	
	@Override
	public int insertEmployee(Employee e) {
		return eDao.insertEmployee(e, sqlSession);
	}
	
	@Override
	public ArrayList<Employee> selectEmpList(PageInfo pi) {
		return eDao.selectEmpList(sqlSession, pi);
	}
	
	@Override
	public int selectEmpListCount() {
		return eDao.selectEmpListCount(sqlSession);
	}


	@Override
	public int deleteEmployee(String empNo) {
		return 0;
	}

	@Override
	public int uploadProfileImg(Employee e) {
		return 0;
	}


	


	


	

	

}
