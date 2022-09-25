package com.project.fitty.schedule.controller;

import java.time.LocalDateTime;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	// [김지애] 1. 직원용 - 스케줄 전체조회 서비스 (ajax)
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
	
	// [김지애] 2. 회원용 - 스케줄 전체/상세조회 서비스 (ajax)
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
	
	// [김지애] 3. 회원용 - 스케줄 상세조회 서비스 (ajax)
	@ResponseBody
	@RequestMapping(value="detail.sc", produces="application/json; charset=UTF-8")
	public String selectUdetailList(int bookNo) {
		Booking b = bService.selectUdetailList(bookNo);
		return new Gson().toJson(b);
	}
	
	// [김지애] 4. 회원용 - 스케줄 등록 서비스
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
	@RequestMapping("update.sc")
	public String updateBooking(Booking b, HttpSession session) {
		int result = bService.updateBooking(b);
		// System.out.println(b);
		
		if(result > 0) {// 수정 성공
			session.setAttribute("alertMsg", "✔ 성공적으로 예약 변경되었습니다 ✔");
			return "redirect:listSchedule.sc";
		}else {// 수정 실패
			session.setAttribute("alertMsg", "❌ 예약변경에 실패했습니다 ❌");
			return "common/errorPage";
		}
	}
	
	// [김지애] 6. 회원용 - 스케줄 삭제 서비스
	@RequestMapping("delete.sc")
	public String deleteBooking(Booking b, HttpSession session) {
		int result = bService.deleteBooking(b);
		
		if(result > 0) {// 삭제 성공
			session.setAttribute("alertMsg", "✔ 성공적으로 예약이 취소되었습니다 ✔");
			return "redirect:listSchedule.sc";
		}else {// 삭제 실패
			session.setAttribute("alertMsg", "❌ 예약취소에 실패했습니다 ❌");
			return "common/errorPage";
		}
	}
	
}
