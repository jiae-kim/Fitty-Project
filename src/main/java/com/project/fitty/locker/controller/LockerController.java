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
	
	@RequestMapping("list.lk") /** 락커 조회 **/
	public String selectLockerList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model) {
		
		int listCount = lService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 24);
		ArrayList<Locker> list = lService.selectList(pi);
		
		ArrayList<User> userList = lService.selectUserList(); // 전체 회원 조회
		ArrayList<Locker> nList1 = lService.selectUsedLkNo(); // 현재 사용중인 락커 번호 조회
		ArrayList<Locker> nList2 = lService.selectNotUsedLkNo(); // 현재 사용하지 않는 중인 락커 번호 조회
		
		model.addAttribute("pi", pi);
		model.addAttribute("list" , list);
		model.addAttribute("userList", userList);
		model.addAttribute("nList1", nList1);
		model.addAttribute("nList2", nList2);
		
		return "locker/lockerList";
	}
	
	@RequestMapping("add.lk") /** 락커 생성 **/
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
	
	@RequestMapping("delete.lk") /** 락커 삭제 **/
	public String deleteLocker(HttpServletRequest request, HttpSession session) {
		
		String[] arr = request.getParameterValues("ckLocker");
		
		if(arr != null) {
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
		}else {
			session.setAttribute("alertMsg", "하나 이상의 락커를 선택하세요.");
			return "redirect:list.lk";
		}
		
	}
	
	@RequestMapping("assign.lk") /** 락커 사용 등록 **/
	public String assignLocker(String strUserNo, Locker l, HttpSession session) {
		
		
		String[] arr = strUserNo.split("_");
		int userNo = Integer.parseInt(arr[1]);
	
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
	
	@RequestMapping("move.lk") /** 락커 자리 이동 **/
	public String moveLocker(String strUserNo, Locker l, HttpSession session) {
		
		String[] arr = strUserNo.split("_");
		int userNo = Integer.parseInt(arr[1]);
		
		l.setUserNo(userNo);
		
		ArrayList<Locker> nList = lService.selectConditionLkNo(l.getUserNo());
		// 먼저 요청된 락커번호와 회원번호가 일치하는지 조건검사 
		
		int count = 0;
		for(Locker lk : nList) {
			if(lk.getLkNo() == l.getLkNo()) {
				count++;
			}
		}
		
		if(count > 0) {
			
			Locker info = lService.selectLockerInfo(l.getLkNo()); // 요청된 락커번호로 락커 등록 정보 조회
			
			info.setMvLkNo(l.getMvLkNo());
			
			int result1 = lService.moveLocker(info); // 자리이동 update
			int result2 = lService.recoverLocker(info.getLkNo()); // 원래 자리 비워주기 
			
			if(result1 * result2 > 0){
				session.setAttribute("alertMsg", "성공적으로 자리 이동되었습니다.");
				return "redirect:list.lk";
			}else {
				session.setAttribute("errorMsg", "자리 이동 실패");
				return "common/errorPage";
			}
			
		}else {
			session.setAttribute("alertMsg", "현재 자리 번호가 일치하지 않습니다. 올바른 번호를 선택하세요.");
			return "redirect:list.lk";
		}
	}
	
	@RequestMapping("recover.lk") /** 락커 자리 회수 **/
	public String recoverLocker(@RequestParam(value = "lkNo2") int lkNo, HttpSession session) {
		
		int result = lService.recoverLocker(lkNo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 락커 회수하였습니다.");
			return "redirect:list.lk";
		}else {
			session.setAttribute("errorMsg", "락커 회수 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("broken.lk") /** 락커 고장 등록 **/
	public String updateLockerBroken(int lkNo, HttpSession session) {
		
		int result = lService.updateLockerBroken(lkNo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "락커를 성공적으로 고장 등록하였습니다.");
			return "redirect:list.lk";
		}else {
			session.setAttribute("errorMsg", "락커 고장 등록 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("repair.lk") /** 락커 수리 완료 처리 **/
	public String repairLocker(HttpServletRequest request, HttpSession session) {
		
		String[] arr = request.getParameterValues("ckLocker");
		
		if(arr != null) {
			int result = 0;
			
			for(int i=0; i<arr.length; i++) {
				result += lService.repairLocker(arr[i]);
			}
			
			if(result > 0) {
				session.setAttribute("alertMsg", "선택 락커를 성공적으로 수리 완료 처리하였습니다.");
				return "redirect:list.lk";
			}else {
				session.setAttribute("errorMsg", "락커 수리 완료 처리 실패");
				return "common/errorPage";
			}
		}else {
			session.setAttribute("alertMsg", "하나 이상의 락커를 선택하세요.");
			return "redirect:list.lk";
		}
		
	}
}
