package com.project.fitty.ptclass.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.project.fitty.ptclass.model.service.ClassService;
import com.project.fitty.ptclass.model.vo.PtClass;
import com.project.fitty.ptclass.model.vo.Reply;
import com.project.fitty.user.model.vo.User;

@Controller
public class ClassController {
	
	@Autowired
	private ClassService cService;
	
	
	//회원페이지에서 수업등록 페이지 이동(회원정보 조회 포함)
	@RequestMapping("enroll.cl")
	public ModelAndView classEnrollForm(int no, ModelAndView mv) {
		
		User u = cService.selectUser(no);

		if(u != null) {
			mv.addObject("u", u).setViewName("class/classEnrollForm");
		}else {
			
		}
		
		return mv;
	}
	
	
	//수업등록 페이지 이동
	@RequestMapping("enrollPage.cl")
	public String enrollForm() {
		return "class/classEnroll";
	}
	
	
	//수업등록
	@RequestMapping("insert.cl")
	public String insertClass(PtClass pt, HttpSession session) {
		
		int result = cService.insertClass(pt);

		int userNo = pt.getUserNo();
		if(result > 0) {
			int statusUpdate = cService.updateStatus(userNo);
			session.setAttribute("alertMsg", "수업등록에 성공했습니다.");
			return "redirect:list.ur";
		}else {
			session.setAttribute("alertMsg", "수업등록에 실패했습니다. 다시 시도해주세요");
			return "redirect:list.ur";
		}
	}
	
	
	
	//내 회원 목록 조회
	@RequestMapping("userList.cl")
	public ModelAndView selectUserList(String empNo, ModelAndView mv) {
		
		//페이징처리 필요
		ArrayList<User> list = cService.selectUserList(empNo);
		
		if(!list.isEmpty()) {
			mv.addObject("list", list).setViewName("class/classList");
		}else {
			mv.addObject("alertMsg", "회원 조회에 실패했습니다.").setViewName("class/classList");
		}
		
		return mv;
	}
	
	
	
	
	//회원 okr페이지로 이동
	@RequestMapping("okr.cl")
	public String userDetailView(int userNo) {
		return "class/dietDetailView";
	}
	
	
	
	//댓글 조회 (회원 : rlist.di)
	@ResponseBody
	@RequestMapping(value="rlist.di", produces="application/json; charset=UTF-8")
	public String ajaxSelectReplyList(int no) {
		ArrayList<Reply> list = cService.selectReplyList(no);
		return new Gson().toJson(list);
	}
	
	
	//댓글 등록 (회원 : rinsert.di)
	@ResponseBody
	@RequestMapping("rinsert.di")
	public int ajaxInsertReply(Reply r) {
		int result = cService.insertReply(r);
		return result;
	}

	
	
	
	
	
	
	
	
}