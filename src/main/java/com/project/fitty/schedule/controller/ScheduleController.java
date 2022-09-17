package com.project.fitty.schedule.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.project.fitty.schedule.model.service.ScheduleService;
import com.project.fitty.schedule.model.vo.Booking;

@Controller
public class ScheduleController {

	@Autowired
	private ScheduleService bService;
	
	// [김지애] 1. 직원용 - 스케줄 전체조회 서비스
	@ResponseBody
	@RequestMapping(value="list.ca", produces="application/json; charset=UTF-8")
	public String selectList() {
		ArrayList<Booking> list = bService.selectList();
		//System.out.println(list);
		return new Gson().toJson(list); // "[{}, {}, {}, ...]"
		//return "schedule/scheduleListView";
	}
	
	// [김지애] 2. 회원용 - 스케줄 전체조회 서비스
	@RequestMapping("list.sc")
	public String selectUlist() {
		return "schedule/scheduleUlistView";
	}
	
	// [김지애] 3. 회원용 - 스케줄 등록 서비스
	@RequestMapping("enrollForm.sc")
	public String enrollForm() {
		return "schedule/scheduleEnrollForm";
	}
	
	/*
	@RequestMapping("insert.sc")
	public String insertSchedule(Booking b, HttpSession session) {
		int result = bService.insertSchedule(b);
		
		if(result > 0) {// 일정등록 성공
			session.setAttribute("alertMsg", "✔ 성공적으로 일정 등록되었습니다 ✔");
			return "redirect:list.ca";
		}else {// 일정등록 실패
			session.setAttribute("alertMsg", "❌ 일정 등록에 실패했습니다 ❌");
			return "common/errorPage";
		}
	}
	*/
	
	
	
}
