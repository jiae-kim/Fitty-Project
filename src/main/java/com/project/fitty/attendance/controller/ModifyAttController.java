package com.project.fitty.attendance.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.project.fitty.attendance.model.service.AttendanceService;
import com.project.fitty.attendance.model.service.ModifyAttService;
import com.project.fitty.attendance.model.vo.ModifyAtt;
import com.project.fitty.employee.model.service.EmployeeService;
import com.project.fitty.employee.model.vo.Employee;
import com.project.fitty.vacation.model.service.VacationService;

@Controller
public class ModifyAttController {
	
	@Autowired
	private AttendanceService aService;
	@Autowired	
	private EmployeeService eService;
	@Autowired
	private VacationService vService;
	@Autowired
	private ModifyAttService mService;
	
	
	@RequestMapping("modifyList.mo")
	public ModelAndView selectMyModifyList(String empNo, ModelAndView mv) {
		ArrayList<ModifyAtt> list = mService.selectModifyList(empNo);
		mv.addObject("list", list).setViewName("attendance/myAttendanceModify");
		return mv;
	}
	
	@RequestMapping("modifyAtt.att")
	public ModelAndView selectAllModifyAtt(ModelAndView mv) {
		ArrayList<ModifyAtt> list = mService.selectAllModifyList();
		mv.addObject("list", list).setViewName("attendance/modifyAttendance");
		return mv;
	}
	
	
	@ResponseBody
	@RequestMapping(value="modifyDetail.mo", produces="application/json; charset=utf-8")
	public String selectModifyDetail (String moAttNo) {
		ModifyAtt m = mService.selectModifyDetail(moAttNo);
		if(m.getMoAttType().equals("I")) {
			m.setMoAttType("출근");
		} else if (m.getMoAttType().equals("O")) {
			m.setMoAttType("퇴근");
		} 

		if(m.getMoReadFlag().equals("Y")) {
			m.setMoReadFlag("읽음");
		} else {
			m.setMoReadFlag("확인전");
		}
		
		switch(m.getAttStatus()) {
			case "X" : m.setAttStatus("무단결근"); ; break; //결석
			case "L" : m.setAttStatus("지각"); ; break; // 지각
			case "E" : m.setAttStatus("조퇴"); ; break; // 조퇴
			case "Q" : m.setAttStatus("오전반차"); ; break; // 오전반차
			case "Z" : m.setAttStatus("오후반차"); ; break; // 오후반차
			case "V" : m.setAttStatus("휴가"); ; break; // 휴가
			case "Y" : m.setAttStatus("연월차"); ; break; // 연월차
			case "B" : m.setAttStatus("주말"); ; break; // 베이직
			case "O" : m.setAttStatus("정상"); ; break; // 정상출근
			case "P" : m.setAttStatus("연장근무"); ; break; // 정상출근
			//default : a.setAttStatus("#FFFFFF"); break; #686BFF >> 연장
			}
		
		
		return new Gson().toJson(m);
	}
	
	@RequestMapping("modifyMo.mo")
	public String updateModifyAttForm(ModifyAtt m) {
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value="selectMoAttForm.mo", produces="application/json; charset=utf-8")
	public String selectModifyAttForm(String empNo) {
		Employee e = eService.selectByEmpNo(empNo);
		return new Gson().toJson(e);
	}
	
	@RequestMapping("insertMoAtt.mo")
	public String insertMoAtt(ModifyAtt m, HttpSession session) {
		
		m.setAttNo(aService.selectAttNo(m));
		int result = mService.insertMoAtt(m);
		
		if(result > 0) {
			session.setAttribute("alertMsg","근태수정요청이 등록되었습니다💘");
		} else {
			session.setAttribute("alertMsg","근태수정요청이 등록 실패 😅");
		}

		return "redirect:myAtt.att";
	}
	
	
	@RequestMapping("updateModifyMo.mo")
	public String updatemodifyAtt(ModifyAtt m) {
		return "";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
