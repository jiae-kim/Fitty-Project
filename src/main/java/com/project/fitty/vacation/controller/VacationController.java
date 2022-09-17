package com.project.fitty.vacation.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.project.fitty.attendance.model.vo.Attendance;
import com.project.fitty.vacation.model.service.VacationService;
import com.project.fitty.vacation.model.vo.Vacation;

@Controller
public class VacationController {
	
	@Autowired
	private VacationService vService;
	
	public ArrayList<Integer> makeYearList() {
		ArrayList<Integer> yearList = new ArrayList<>();
		//ArrayList<Integer> monthList = new ArrayList<>();
		//int thisYear = Calendar.getInstance().get(Calendar.YEAR);
		//int thisMonth = Calendar.getInstance().get(Calendar.MONTH) + 1;
		
		for(int i=(Calendar.getInstance().get(Calendar.YEAR) - 5); i<10; i++) {
			yearList.add(i);
			System.out.println(yearList.get(i));
		}
		/*
		for(int i=1; i<=12; i++) {
			monthList.add(i);
		}
		HashMap <String, Object> map = new HashMap<String, Object>();
		map.put("yearList", yearList);
		map.put("monthList", monthList);*/
		return yearList;
	}
	
	
	
	@RequestMapping("changeVac.vac")
	public String changeVacation(Vacation v, HttpSession session) {
		DateFormat format = new SimpleDateFormat("yyyyMMdd");
			//String empNoListStr = v.getEmpNo();
			String[] arr = (v.getEmpNo().split(","));
			int result = 0;
			for(int i=0; i<arr.length; i++) {
				v.setEmpNo(arr[i].trim());
				if(v.getVacStatus().equals("P")) {
					result += vService.insertVacation(v);
				}else {
					result += vService.deleteVacation(v);
				}
			}
			
			if(result > 0) {
				session.setAttribute("alertMsg", "✔ 연월차/휴가 지급 완료 ✔");
			} else {
				session.setAttribute("alertMsg",  "❌ 연월차/휴가 지급 실패 ❌");
			}
		
		
		return "redirect:vacControl.att";
	}
	
	
	@RequestMapping("detail.vac")
	public ModelAndView selectOneVacationDetail(String no, ModelAndView mv) {
		
		Vacation v = vService.selectOneVacation(no);
		Attendance a = new Attendance();
		a.setEmpNo(no);
		
		
		if(v != null) {
			v.setEmpVacList(vService.selectEmpVacList(a));
			mv.addObject("v", v).setViewName("attendance/centerVacDetail");
		} else {
			mv.addObject("alertMsg","❌ 상세조회 실패 ❌").setViewName("vacControl.att");
		}
		
		return mv;
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="vacList.vac", produces="application/json; charset=utf-8")
	public String selectVacationUseList (String empNo, String orderByYear, String orderByVac) {
		HashMap <String, Object> map = new HashMap<String, Object>();
		map.put("empNo", empNo);
		map.put("orderByYear", orderByYear);
		map.put("orderByVac", orderByVac);
		
		ArrayList<Vacation> yearVacList = vService.selectYearVacList(map);
		ArrayList<Vacation> realVacList = vService.selectRealVacList(map);
		
		for(Vacation v : yearVacList) {
			if(v.getVacNormal().equals("N")) {
				v.setVacNormal("정기");
			} else if (v.getVacNormal().equals("P")) {
				v.setVacNormal("패널티");
			} else {
				v.setVacNormal("보너스");
			}
			
			if(v.getAttStatus().equals("Y")) {
				v.setAttStatus("연월차");
			} else if (v.getAttStatus().equals("Q")) {
				v.setAttStatus("오전반차");
			} else if(v.getAttStatus().equals("Z")) {
				v.setAttStatus("오후반차");
			} else {
				v.setAttStatus("일반");
			}
			
			
		}
		
		for(Vacation v : realVacList) {
			if(v.getVacNormal().equals("N")) {
				v.setVacNormal("정기");
			} else if (v.getVacNormal().equals("P")) {
				v.setVacNormal("패널티");
			} else {
				v.setVacNormal("보너스");
			}
			
			if(v.getAttStatus().equals("V")) {
				v.setAttStatus("휴가");
			} else {
				v.setAttStatus("일반");
			}
		}
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("yearVacList", yearVacList);
		resultMap.put("realVacList", realVacList);
		return new Gson().toJson(resultMap);
	}
	
	
}
