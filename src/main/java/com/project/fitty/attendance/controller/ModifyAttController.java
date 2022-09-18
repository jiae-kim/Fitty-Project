package com.project.fitty.attendance.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.project.fitty.attendance.model.service.AttendanceService;
import com.project.fitty.attendance.model.service.ModifyAttService;
import com.project.fitty.employee.model.service.EmployeeService;
import com.project.fitty.vacation.model.service.VacationService;

@Controller
public class ModifyAttController {
	
	@Autowired
	private AttendanceService aService;
	@Autowired	
	private EmployeeService eService;
	@Autowired
	private VacationService vService;
	@Autowired
	private ModifyAttService mService;
	

}
