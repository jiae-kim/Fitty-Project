package com.project.fitty.attendance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AttendanceController {
	
	
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
