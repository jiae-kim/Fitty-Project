package com.project.fitty.schedule.controller;

import java.time.LocalDateTime;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.google.gson.Gson;
import com.project.fitty.schedule.model.service.ScheduleService;
import com.project.fitty.schedule.model.vo.Booking;

@Controller
public class ScheduleController {

	@Autowired
	private ScheduleService bService;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern= "yyyy-MM-dd HH:mm:ss")
	private LocalDateTime startDate;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat(pattern= "yyyy-MM-dd HH:mm:ss")
	private LocalDateTime endDate;
	
	// [김지애] 1. 직원용 - 스케줄 전체조회 서비스
	@RequestMapping("listSchedule.ca")
	public String listFormCalendar() {
		return "schedule/scheduleListView";
	}
	
	@ResponseBody
	@RequestMapping(value="list.ca", produces="application/json; charset=UTF-8")
	public String selectList() {
		ArrayList<Booking> list = bService.selectList();
		return new Gson().toJson(list); // "[{}, {}, {}, ...]"
	}
	
	// [김지애] 2. 회원용 - 스케줄 전체조회 서비스
	@RequestMapping("listSchedule.sc")
	public String listFormSchedule() {
		return "schedule/scheduleUlistView";
	}
	
	@ResponseBody
	@RequestMapping(value="list.sc", produces="application/json; charset=UTF-8")
	public String selectUlist(int userNo) {
		String empNo = bService.selectEmp(userNo);
		ArrayList<Booking> list = bService.selectUlist(empNo);
		return new Gson().toJson(list);
	}
	
	// [김지애] 3. 회원용 - 스케줄 상세조회 서비스
	@RequestMapping("detailForm.sc")
	public String selectFormSchedule() {
		return "schedule/scheduleUdetailView";
	}
	
	@ResponseBody
	@RequestMapping(value="detail.sc", produces="application/json; charset=UTF-8")
	public String selectUdetailList() {
		return new Gson().toJson(null);
	}
	
	// [김지애] 4. 회원용 - 스케줄 등록 서비스
	/*
	@RequestMapping("enrollForm.sc")
	public String enrollForm() {
		return "schedule/scheduleEnrollForm";
	}
	*/
	@RequestMapping("insert.sc")
	public String insertSchedule(Booking b, HttpSession session) {
		//System.out.println(b);
		int result = bService.insertBooking(b);
		
		if(result > 0) {// 일정등록 성공
			session.setAttribute("alertMsg", "✔ 성공적으로 수업이 예약되었습니다 ✔");
			return "redirect:listSchedule.sc";
		}else {// 일정등록 실패
			session.setAttribute("alertMsg", "❌ 수업 예약에 실패했습니다 ❌");
			return "common/errorPage";
		}
	}
	
	// [김지애] 5. 회원용 - 스케줄 수정 서비스
	/*
	@RequestMapping("update.sc")
	public String updateBooking() {
		
	}
	*/
	
	
}
