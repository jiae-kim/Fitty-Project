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
import org.springframework.web.servlet.ModelAndView;

import com.project.fitty.attendance.model.vo.Attendance;
import com.project.fitty.vacation.model.service.VacationService;
import com.project.fitty.vacation.model.vo.Vacation;

@Controller
public class VacationController {
	
	@Autowired
	private VacationService vService;
	
	public HashMap <String, Object> makeYearAndMonth() {
		ArrayList<Integer> yearList = new ArrayList<>();
		ArrayList<Integer> monthList = new ArrayList<>();
		int thisYear = Calendar.getInstance().get(Calendar.YEAR);
		int thisMonth = Calendar.getInstance().get(Calendar.MONTH) + 1;
		
		for(int i=(Calendar.getInstance().get(Calendar.YEAR) - 5); i<10; i++) {
			yearList.add(i);
		}
		
		for(int i=1; i<=12; i++) {
			monthList.add(i);
		}
		HashMap <String, Object> map = new HashMap<String, Object>();
		map.put("yearList", yearList);
		map.put("monthList", monthList);
		return map;
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
		HashMap <String, Object> map = makeYearAndMonth();
		
		if(v != null) {
			v.setEmpVacList(vService.selectEmpVacList(a));
			mv.addObject("v", v).addObject("map", map).setViewName("attendance/centerVacDetail");
		} else {
			mv.addObject("alertMsg","❌ 상세조회 실패 ❌").setViewName("vacControl.att");
		}
		
		return mv;
		
	}
	
	
}
