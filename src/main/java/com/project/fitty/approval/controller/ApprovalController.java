package com.project.fitty.approval.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.fitty.approval.model.service.ApprovalService;
import com.project.fitty.approval.model.vo.Approval;
import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.common.template.Pagination;

@Controller
public class ApprovalController {
	
	@Autowired
	private ApprovalService aService;
	
	@RequestMapping("apprMain.ap")
	public String goApproval() {
		return "approval/approvalMainView";
	}
	
	@RequestMapping("vacation.ap")
	public String goVacation() {
		return "approval/vacationEnrollForm";
	}
	
	@RequestMapping("draftList.ap")
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, String empNo,  ModelAndView mv) {
		int listCount = aService.selectListCount(empNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Approval> list = aService.selectList(pi);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("approval/draftListView");
		
		return mv;
	}

}
