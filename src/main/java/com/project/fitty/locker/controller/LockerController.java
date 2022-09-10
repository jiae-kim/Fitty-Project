package com.project.fitty.locker.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.common.template.Pagination;
import com.project.fitty.locker.model.service.LockerService;
import com.project.fitty.locker.model.vo.Locker;

@Controller
public class LockerController {

	@Autowired
	private LockerService lService;
	
	@RequestMapping("list.lk")
	public String selectLockerList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model) {
		
		int listCount = lService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 18);
		ArrayList<Locker> list = lService.selectList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list" , list);
		
		return "locker/lockerList";
	}
}
