package com.project.fitty.ptclass.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.project.fitty.ptclass.model.service.ClassService;
import com.project.fitty.ptclass.model.vo.Reply;
import com.project.fitty.user.model.vo.User;

@Controller
public class ClassController {
	
	@Autowired
	private ClassService cService;
	
	
	@RequestMapping("enroll.cl")
	public String classEnrollForm() {
//		System.out.println(no);
//		User u = cService.selectUser(no);
				
		return "class/classEnrollForm";
	}
	
	
	@RequestMapping("insert.cl")
	public void insertClass(int userNo) {
		int result = cService.insertClass(userNo);
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