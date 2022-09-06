package com.project.fitty.attendance.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.project.fitty.attendance.model.service.AttendanceService;
import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.common.template.Pagination;
import com.project.fitty.employee.model.service.EmployeeService;
import com.project.fitty.employee.model.vo.Employee;

@Controller
public class AttendanceController {
	
	@Autowired
	private AttendanceService aService;
	@Autowired	
	private EmployeeService eService;
	
	
	@RequestMapping("main.fitty")
	public String goMain() {
		return "common/mainPage";
	}
	
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
	
	@ResponseBody
	@RequestMapping(value="attList.att", produces="application/json; charset=utf-8")
	public String selectAllAttList(@RequestParam(value="cpage", defaultValue="1")int currentPage, HttpSession session) {
		
//		ArrayList<Employee> empList = eService.selectEmpList();
		int listCount =  eService.selectEmpListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Employee> empList =  eService.selectEmpList(pi);
		if(!empList.isEmpty()) {
			for(Employee e : empList) {
				e.setAttList(aService.selectAllAttList(e));
			}
//			return new Gson().toJson(empList);
		}
		
		/*
		String empListGson = new Gson().toJson(empList);
		String piGson = new Gson().toJson(pi);
		System.out.println(empListGson);
		System.out.println(piGson);
		mv.addObject("pi", piGson).addObject("empList", empListGson).setViewName("attendance/centerAllAttendance");
		return mv;
		*/
		
		/* HashMap 은 넘길 배열이 2개일때만 사용 */
		HashMap <String, Object> map = new HashMap<String, Object>();
		map.put("pi", pi);
		map.put("empList", empList);

		return new Gson().toJson(map);
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
