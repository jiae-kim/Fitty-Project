package com.project.fitty.user.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.common.template.FileUpload;
import com.project.fitty.common.template.Pagination;
import com.project.fitty.user.model.service.UserService;
import com.project.fitty.user.model.vo.User;

@Controller
public class UserController {

	@Autowired
	private UserService uService;
	
	@RequestMapping("enrollForm.ur")
	public String enrollForm() {
		return "user/userEnrollForm";
	}
	
	// [김지애] 1. 회원등록 서비스 
	@RequestMapping("insert.ur")
	public String insertUser(User u, Model model, HttpSession session) {
		System.out.println(u);
		int result = uService.insertUser(u);
		
		if(result > 0) {// 회원등록 성공
			session.setAttribute("alertMsg", "성공적으로 회원등록 되었습니다.");
			return "redirect:list.ur";
		}else {// 회원등록 실패
			model.addAttribute("errorMsg", "회원등록 실패");
			return "redirect:";
		}
	}
	
	// [김지애] 2. 회원 전체조회 서비스 (페이징)
	@RequestMapping("list.ur")
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		int listCount = uService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<User> list = uService.selectList(pi);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("user/userListView");
		
		return mv;
	}

	// [김지애] 3. 회원 프로필이미지 변경 서비스 - ajax
	@ResponseBody
	@RequestMapping("uploadProfile.ur")
	public User ajaxUploadProfile(MultipartFile uploadFile, User u, String originalFile, HttpSession session) {
		if(uploadFile != null) {
			if(!originalFile.equals("")) {
				new File(session.getServletContext().getRealPath(originalFile)).delete();
			}
			
			String saveFilePath = FileUpload.saveFile(uploadFile, session, "resources/profile_images/");
			u.setUserProfileUrl(saveFilePath);
			
			session.setAttribute("u", u);
		}
	return u;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
