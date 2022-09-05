package com.project.fitty.employee.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.fitty.employee.model.service.EmployeeService;
import com.project.fitty.employee.model.vo.Employee;

@Controller
public class EmployeeController {
	
	@Autowired	
	private EmployeeService eService;
	
	@ResponseBody
	@RequestMapping("nextEmpNo.emp")
	public String selectNextEmpNo() {
		
		return eService.selectNextEmpNo();
	}
	
	@RequestMapping("insert.emp")
	public String insertMember(Employee e, HttpSession session) {
		
		int result = eService.insertEmployee(e);
		if(result > 0) {
			session.setAttribute("alertMsg", "✔ 신규 직원 등록 성공! ✔");
			return "redirect:centerAtt.att";
		} else {
			session.setAttribute("alertMsg", "❌ 직원 등록에 실패했습니다! ❌");
			return "redirect:enrollForm.emp";
		}
	}
	
	
	
}
