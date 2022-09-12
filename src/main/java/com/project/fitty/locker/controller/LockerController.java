package com.project.fitty.locker.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.common.template.Pagination;
import com.project.fitty.locker.model.service.LockerService;
import com.project.fitty.locker.model.vo.Locker;
import com.project.fitty.user.model.vo.User;

@Controller
public class LockerController {

	@Autowired
	private LockerService lService;
	
	@RequestMapping("list.lk")
	public String selectLockerList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model) {
		
		int listCount = lService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 24);
		ArrayList<Locker> list = lService.selectList(pi);
		
		ArrayList<User> userList = lService.selectUserList();
		
		model.addAttribute("pi", pi);
		model.addAttribute("list" , list);
		model.addAttribute("userList", userList);
		
		return "locker/lockerList";
	}
	
	@RequestMapping("add.lk")
	public String addLocker(@RequestParam(value="lkAmount") int lkAmount, HttpSession session) {
		
		int result=0;
		
		for(int i=0; i<lkAmount; i++) {
			result += lService.addLocker();
		}
		
		if(result == lkAmount) {
			session.setAttribute("alertMsg", "성공적으로 락커 생성 완료하였습니다.");
			return "redirect:list.lk";
		}else {
			session.setAttribute("errorMsg", "락커 생성 실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("delete.lk")
	public String deleteLocker(HttpServletRequest request, HttpSession session) {
		
		String[] arr = request.getParameterValues("ckLocker");
		int result = 0;
		
		for(int i=0; i<arr.length; i++) {
			result += lService.deleteLocker(arr[i]);
		}
		
		if(result > 0) {
			session.setAttribute("alertMsg", "선택 락커가 성공적으로 삭제되었습니다.");
			return "redirect:list.lk";
		}else {
			session.setAttribute("errorMsg", "락커 삭제 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("assign.lk")
	public String assignLocker(String strUserNo, Locker l, HttpSession session) {
		
		
		String[] arr = strUserNo.split("\\.");
		int userNo = Integer.parseInt(arr[0].replace(" ", ""));
		
		l.setUserNo(userNo);
		int result = lService.assignLocker(l);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "락커가 성공적으로 등록되었습니다.");
			return "redirect:list.lk";
		}else {
			session.setAttribute("errorMsg", "락커 등록 실패");
			return "common/errorPage";
		}
	}
	
}
