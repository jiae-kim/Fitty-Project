package com.project.fitty.statistics.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.fitty.statistics.model.service.StatisticsService;
import com.project.fitty.user.model.vo.User;
import com.project.fitty.userClass.model.vo.UserClass;

@Controller
public class StatisticController {
	
	@Autowired
	private StatisticsService sService;

	@RequestMapping("list.st")
	public String selectChartList(Model model) {
		
		// 연간 회원 수 조회 
		ArrayList<User> uList = sService.selectUserCountForYear();
		
		// 트레이너별 수업 수
		ArrayList<UserClass> cList = sService.selectClassCountByEmp();
		
		// pt이용하는 사람들 중에 몇개월 이용권 사용이 많은지
		ArrayList<User> pList = sService.selectCouponRateByUser();
		
		model.addAttribute("uList", uList);
		model.addAttribute("cList", cList);
		model.addAttribute("pList", pList);
		
		return "statistics/statisticsList";
		
	}
}
