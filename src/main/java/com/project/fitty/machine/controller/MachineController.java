package com.project.fitty.machine.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.fitty.machine.model.service.MachineService;

@Controller
public class MachineController {

	@Autowired	
	private MachineService mService;
	
	@RequestMapping("list.mc")
	String selectMachineList() {
		
		
		return "machine/machineList";
	}
	
}
