package com.project.fitty.locker.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.fitty.locker.model.service.LockerService;

@Controller
public class LockerController {

	@Autowired
	private LockerService lService;
	
	@RequestMapping("list.lk")
	public String selectLockerList() {
		
		return "locker/lockerList";
	}
}
