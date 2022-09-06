package com.project.fitty.employee.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

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
		String nextEmpNo = eDao.selectNextEmpNo(sqlSession);
		return nextEmpNo;
		
	}
	
	@Override
	public int insertEmployee(Employee e) {
		return eDao.insertEmployee(e, sqlSession);
	}
	
	@Override
	public ArrayList<Employee> selectEmpList() {
		return eDao.selectEmpList(sqlSession);
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
