package com.project.fitty.schedule.controller;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.LoggerFactory;
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
	
	//private static final Logger log = (Logger) LoggerFactory.getLogger(ScheduleController.class);
	
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
	
	/*
	public List<Map<String, Object>> selectList() {
		List<Booking> list = bService.selectList();
		
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		
		HashMap<String, Object> hash = new HashMap<>();
		
		for(int i=0; i < list.size(); i++) {
			hash.put("title", list.get(i).getBookNo());
			hash.put("start", list.get(i).getBookDate());
			
			jsonObj = new JSONObject(hash);
			jsonArr.add(jsonObj);
		}
		log.info("jsonArrCheck: {}");
		return jsonArr;
	}
	*/
	
	// [김지애] 2. 회원용 - 스케줄 전체조회 서비스
	@RequestMapping("list.sc")
	public String selectUlist() {
		return "schedule/scheduleUlistView";
	}
	
	// [김지애] 3. 회원용 - 스케줄 상세조회 서비스
	@RequestMapping("detail.sc")
	public String selectUdetailList() {
		return "schedule/scheduleUdetailView";
	}
		
	// [김지애] 4. 회원용 - 스케줄 등록 서비스
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
	
	// [김지애] 5. 회원용 - 스케줄 수정 서비스
	/*
	@RequestMapping("update.sc")
	public String updateBooking() {
		
	}
	*/
	
	
}
