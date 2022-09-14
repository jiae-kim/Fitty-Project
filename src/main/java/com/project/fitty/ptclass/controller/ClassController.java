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
	
	
	//수업등록 페이지 (회원정보 조회 포함)
	@RequestMapping("enroll.cl")
	public ModelAndView classEnrollForm(int no, ModelAndView mv) {
		
		User u = cService.selectUser(no);

		if(u != null) {
			mv.addObject("u", u).setViewName("class/classEnrollForm");
		}else {
			
		}
		
		return mv;
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
	
	
	
	@ResponseBody
	@RequestMapping(value="rlist.di", produces="application/json; charset=UTF-8")
	public String ajaxSelectReplyList(int no) {
		ArrayList<Reply> list = cService.selectReplyList(no);
		return new Gson().toJson(list);
	}
	
	
	@RequestMapping("rinsert.di")
	public void ajaxInsertReply() {
		
	}

}