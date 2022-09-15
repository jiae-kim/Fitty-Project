package com.project.fitty.vacation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.project.fitty.attendance.model.service.AttendanceService;
import com.project.fitty.employee.model.service.EmployeeService;
import com.project.fitty.vacation.model.service.VacationService;

@Controller
public class VacationController {
	
	@Autowired
	private VacationService vService;
	
}
