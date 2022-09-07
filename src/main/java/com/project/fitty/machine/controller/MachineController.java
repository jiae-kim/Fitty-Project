package com.project.fitty.machine.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.common.template.Pagination;
import com.project.fitty.machine.model.service.MachineService;
import com.project.fitty.machine.model.vo.Machine;

@Controller
public class MachineController {

	@Autowired	
	private MachineService mService;
	
	@RequestMapping("list.mc")
	public String selectMachineList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = mService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Machine> list = mService.selectList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "machine/machineList";
	}
	
	@RequestMapping("enrollForm.mc")
	public String selectEnrollForm() {
		
		return "machine/machineEnrollForm";
	}
	
}


