package com.project.fitty.attendance.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.fitty.attendance.model.service.AttendanceService;
import com.project.fitty.attendance.model.vo.Attendance;
import com.project.fitty.employee.model.service.EmployeeService;
import com.project.fitty.employee.model.vo.Employee;

@Controller
public class AttendanceController {
	
	@Autowired
	private AttendanceService aService;
	@Autowired	
	private EmployeeService eService;
	
	
	@RequestMapping("myAtt.att")
	public String goMyAtt() {
		return "attendance/myAttendance";
	}
	
	@RequestMapping("attModiftForm.att")
	public String goMyModifyForm() {
		return "attendance/myAttendanceModify";
	}
	
	@RequestMapping("centerAtt.att")
	public String goCenterAtt() {
		return "attendance/centerAllAttendance";
		// 진짜 그냥 이동만 시켜주고, 리스트는 ajax로 불러옴 > ajax 페이징처리
	}
	
	
	@RequestMapping("attList.att")
	public ModelAndView selectAllAttList(HttpSession session, ModelAndView mv) {
		ArrayList<Employee> empList = eService.selectEmpList();
		
		if(empList.isEmpty()) {
			session.setAttribute("alertMsg", "직원리스트가 비어있습니다.");
			mv.setViewName("attendance/employeeEnrollForm");
		} else {
			for(Employee e : empList) {
				e.setAttList(aService.selectAllAttList(e.getEmpNo()));
				System.out.println(e.getAttList());
				if(e.getAttList() == null) {
					session.setAttribute("alertMsg", "근태 초기화가 덜 된 직원 있습니다.");
					mv.setViewName("attendance/employeeEnrollForm");
				}
			}
			mv.addObject("empList", empList).setViewName("attendance/centerAllAttendance");
			
			
		}
		return mv;
	}
	
	@RequestMapping("vacControl.att")
	public String goVacControlAtt() {
		return "attendance/centerVacControl";
	}

	
	@RequestMapping("modifyAtt.att")
	public String goModifyAtt() {
		return "attendance/modifyAttendance";
	}

	
	@RequestMapping("enrollForm.emp")
	public String goEnrollForm() {
		return "attendance/employeeEnrollForm";
	}
	
	
	

}
