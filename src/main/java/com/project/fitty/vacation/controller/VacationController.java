package com.project.fitty.vacation.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.fitty.vacation.model.service.VacationService;
import com.project.fitty.vacation.model.vo.Vacation;

@Controller
public class VacationController {
	
	@Autowired
	private VacationService vService;
	
	
	
	@RequestMapping("changeVac.vac")
	public String changeVacation(Vacation v, HttpSession session) {
		
			//String empNoListStr = v.getEmpNo();
			String[] arr = (v.getEmpNo().split(","));
			int result = 0;
			for(int i=0; i<arr.length; i++) {
				v.setEmpNo(arr[i].trim());
				System.out.println(v.getEmpNo());
				System.out.println(v.getVacStatus());
				if(v.getVacStatus().equals("P")) {
					result += vService.insertVacation(v);
				}else {
					result += vService.deleteVacation(v);
				}
			}
			
			if(result > 0) {
				session.setAttribute("alertMsg", "✔ 연월차/휴가 지급 완료 ✔");
			} else {
				session.setAttribute("alertMsg",  "❌ 연월차/휴가 지급 시류ㅐ ❌");
			}
		
		
		return "redirect:vacControl.att";
	}
	
	
	
}
