package com.project.fitty.approval.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.project.fitty.approval.model.service.ApprovalService;
import com.project.fitty.approval.model.vo.ApprExpense;
import com.project.fitty.approval.model.vo.ApprOvertime;
import com.project.fitty.approval.model.vo.ApprVacation;
import com.project.fitty.approval.model.vo.Approval;
import com.project.fitty.approval.model.vo.ApprovalMember;
import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.common.template.Pagination;
import com.project.fitty.employee.model.vo.Employee;

@Controller
public class ApprovalController {
	
	@Autowired
	private ApprovalService aService;
	
	@RequestMapping("apprMain.ap")
	public String goApproval() {
		return "approval/approvalMainView";
	}
	
	@RequestMapping(value="vacation.ap", produces="application/json; charset=utf-8")
	public ModelAndView goVacation(ModelAndView mv) {
		ArrayList<Employee> list = aService.selectEmpList();
		mv.addObject("list", list).setViewName("approval/vacationEnrollForm");
		
		return mv;
	}
	
	@RequestMapping(value="overtime.ap", produces="application/json; charset=utf-8")
	public ModelAndView goOvertime(ModelAndView mv) {
		ArrayList<Employee> list = aService.selectEmpList();
		mv.addObject("list", list).setViewName("approval/overtimeEnrollForm");
		return mv;
	}
	
	@RequestMapping(value="expense.ap", produces="application/json; charset=utf-8")
	public ModelAndView goExpense(ModelAndView mv) {
		ArrayList<Employee> list = aService.selectEmpList();
		mv.addObject("list", list).setViewName("approval/expenseEnrollForm");
		return mv;
	}
	
	@RequestMapping("insertVct.ap")
	public String insertApprVct(Approval ap, ApprovalMember am, ApprVacation vct, HttpSession session, Model model) {
		ArrayList<ApprovalMember> list = am.getMlist();
		
		for(int i=0; i<am.getMlist().size(); i++) {
			list.get(i).setApprLevel(i+1);
			System.out.println(list.get(i));
		}
		
		int result1 = aService.insertApproval(ap);
		int result2 = aService.insertApprMember(list);
		int result3 = aService.insertApprVct(vct);
		
		if(result1>0 && result2>0 && result3>0) {
			session.setAttribute("alertMsg", "결재가 요청되었습니다.");
			return "redirect:draftList.ap";
		}else {
			model.addAttribute("errorMsg", "결재 요청 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("insertOvt.ap")
	public String insertApprOvt(Approval ap, ApprovalMember am, ApprOvertime ovt, HttpSession session, Model model) {
		ArrayList<ApprovalMember> list = am.getMlist();
		
		for(int i=0; i<am.getMlist().size(); i++) {
			list.get(i).setApprLevel(i+1);
			System.out.println(list.get(i));
		}
		
		int result1 = aService.insertApproval(ap);
		int result2 = aService.insertApprMember(list);
		int result3 = aService.insertApprOvt(ovt);
		
		if(result1>0 && result2>0 && result3>0) {
			session.setAttribute("alertMsg", "결재가 요청되었습니다.");
			return "redirect:draftList.ap";
		}else {
			model.addAttribute("errorMsg", "결재 요청 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("insertExp.ap")
	public String insertApprExp(Approval ap, ApprovalMember am, ApprExpense exp, HttpSession session, Model model) {
		ArrayList<ApprovalMember> list = am.getMlist();
		
		for(int i=0; i<am.getMlist().size(); i++) {
			list.get(i).setApprLevel(i+1);
			System.out.println(list.get(i));
		}
		
		int result1 = aService.insertApproval(ap);
		int result2 = aService.insertApprMember(list);
		int result3 = aService.insertApprExp(exp);
		
		if(result1>0 && result2>0 && result3>0) {
			session.setAttribute("alertMsg", "결재가 요청되었습니다.");
			return "redirect:draftList.ap";
		}else {
			model.addAttribute("errorMsg", "결재 요청 실패");
			return "common/errorPage";
		}
	}
	
	
	@RequestMapping(value="draftList.ap", produces="application/json; charset=utf-8")
	public ModelAndView selectList(String empNo, @RequestParam(value="cpage", defaultValue="1") int currentPage,  ModelAndView mv) {
		int listCount = aService.selectListCount(empNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Approval> list = aService.selectList(pi, empNo);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("approval/draftListView");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="changeDraft.ap", produces="application/json; charset=utf-8")
	public String ajaxChangeDraft(String empNo, String apprStatus, @RequestParam(value="cpage", defaultValue="1") int currentPage) {
		Approval ap = new Approval();
		
		if(!apprStatus.isEmpty()) {
			ap.setEmpNo(empNo);
			ap.setApprStatus(apprStatus);
			
			int listCount = aService.ajaxSelectListCount(ap);
			
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			ArrayList<Approval> list = aService.ajaxSelectList(pi, ap);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("pi", pi);
			map.put("list", list);
			
			return new Gson().toJson(map);
		}else {
			
			int listCount = aService.selectListCount(empNo);
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			ArrayList<Approval> list = aService.selectList(pi, empNo);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("pi", pi);
			map.put("list", list);
			return new Gson().toJson(map);
		}
		
	}
	
	@RequestMapping(value="storageList.ap", produces="application/json; charset=utf-8")
	public ModelAndView selectstorageList(String empNo, @RequestParam(value="cpage", defaultValue="1") int currentPage,  ModelAndView mv) {
		int listCount = aService.selectStorageListCount(empNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Approval> list = aService.selectStorageList(pi, empNo);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("approval/storageListView");
		
		return mv;
	}
	
	@RequestMapping(value="signList.ap", produces="application/json; charset=utf-8")
	public ModelAndView selectSignList(String empNo, @RequestParam(value="cpage", defaultValue="1") int currentPage,  ModelAndView mv) {
		int listCount = aService.selectSignListCount(empNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Approval> list = aService.selectSignList(pi, empNo);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("approval/signListView");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="changeSign.ap", produces="application/json; charset=utf-8")
	public String ChangeSign(String empNo, String apprStatus, @RequestParam(value="cpage", defaultValue="1") int currentPage) {
		Approval ap = new Approval();
		
		if(!apprStatus.isEmpty()) {
			ap.setEmpNo(empNo);
			ap.setApprStatus(apprStatus);
			
			int listCount = aService.ajaxSelectListCount(ap);
			
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			ArrayList<Approval> list = aService.ajaxSelectSignList(pi, ap);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("pi", pi);
			map.put("list", list);
			
			return new Gson().toJson(map);
		}else {
			int listCount = aService.selectListCount(empNo);
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			ArrayList<Approval> list = aService.selectSignList(pi, empNo);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("pi", pi);
			map.put("list", list);
			return new Gson().toJson(map);
		}
	}

}
