package com.project.fitty.vacation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.fitty.vacation.model.service.VacationService;
import com.project.fitty.vacation.model.vo.Vacation;

@Controller
public class VacationController {
	
	@Autowired
	private VacationService vService;
	
	@RequestMapping("insertVac.vac")
	public String insertVacation(Vacation v) {
		int result = vService.insertVacation(v);
		
		return "";
	}
	
}
