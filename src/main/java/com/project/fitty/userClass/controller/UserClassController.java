package com.project.fitty.userClass.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.fitty.userClass.model.service.UserClassService;
import com.project.fitty.userClass.model.service.UserClassServiceImpl;
import com.project.fitty.userClass.model.vo.UserClass;

@Controller
public class UserClassController {
	
	@Autowired
	private UserClassServiceImpl ucService;
	
	
	//회원 로그인
	@RequestMapping("login.user")
	public String loginUser(UserClass u, HttpSession session) {
		
		UserClass loginU = ucService.loginUser(u);
		
		if(loginU != null) {
			session.setAttribute("loginU", loginU);
			return "userClass/userMain";
		}else {
			session.setAttribute("alertMsg", "로그인 정보를 다시 확인해주세요.");
			return "main";
		}
		
	}
	
	
	//회원 페이지로 이동
	@RequestMapping("userPage.cl")
	public String userPage() {
		return "userClass/userMain";
	}
	
	
	//운동일지 페이지로 이동
	@RequestMapping("userEx.cl")
	public String userExercise() {
		return "userClass/userExercise";
	}
	
	
	//식단일기 페이지로 이동
	@RequestMapping("userDi.cl")
	public String userDiet() {
		return "userClass/userDiet";
	}
	
	
	//식단일기 디테일뷰로 이동
	@RequestMapping("userDiDetail.cl")
	public String dietDetail(String dietDate, String userNo) {
		
		return "userClass/userDietDetail";
	}
	
	
	

}
