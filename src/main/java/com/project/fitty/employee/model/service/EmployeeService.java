package com.project.fitty.employee.model.service;

import com.project.fitty.employee.model.vo.Employee;

public interface EmployeeService {
	
	
	
	// 직원 로그인 서비스 (select)
	Employee loginEmployee(Employee e);

	// 다음 회원번호 미리 알아오기 (select)
	String selectNextEmpNo();
	
	// 신규직원 프로필 등
	
	// 신규직원 가입 서비스 (insert)
	int insertEmployee(Employee e);
	
	// 직원 퇴사 서비스 (update)
	int deleteEmployee(String empNo);
	
	// 프로필 이미지 변경 서비스 (update)
	int uploadProfileImg(Employee e);
}
