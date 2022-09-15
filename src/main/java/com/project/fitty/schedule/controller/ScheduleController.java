package com.project.fitty.schedule.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.fitty.schedule.model.service.ScheduleService;
import com.project.fitty.schedule.model.vo.Booking;

@Controller
public class ScheduleController {

	@Autowired
	private ScheduleService bService;
	
	// [김지애] 1. 직원용 - 스케줄 전체조회 서비스
	@RequestMapping("list.ca")
	public String selectList() {
		return "schedule/scheduleListView";
	}
	
	/*
	public ModelAndView selectList(ModelAndView mv) {
		//ArrayList<Booking> list = bService.selectList();
		
		//mv.addObject("list", list)
		mv.setViewName("schedule/scheduleListView");
		
		return mv;
	}
	*/
	
	
	
	
	
	
	
	
	
	
	
}
