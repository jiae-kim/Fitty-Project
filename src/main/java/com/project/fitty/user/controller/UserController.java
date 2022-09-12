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
	
	// [김지애] 1. 회원등록 서비스 
	@RequestMapping("enrollForm.ur")
	public String enrollForm() {
		return "user/userEnrollForm";
	}
	
	// [김지애] 1. 회원등록 서비스 (FileUpload)
	@RequestMapping("insert.ur")
	public String insertUser(User u, MultipartFile upfile, Model model, HttpSession session) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			String saveFilePath = FileUpload.saveFile(upfile, session, "resources/upload_profileImg/");
			u.setUserProfileUrl(saveFilePath);
		}
		
		int result = uService.insertUser(u);
		
		if(result > 0) {// 회원등록 성공 => 조회페이지
			session.setAttribute("alertMsg", "✔ 성공적으로 회원등록 되었습니다 ✔");
			return "redirect:list.ur";
		}else {// 회원등록 실패 => 등록페이지
			session.setAttribute("alertMsg", "❌ 회원등록에 실패했습니다 ❌");
			return "redirect:insert.ur";
		}
	}
	
	// [김지애] 2. 회원 전체조회 서비스 (페이징)
	@RequestMapping("list.ur")
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		int listCount = uService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<User> list = uService.selectList(pi);
		
		System.out.println(list);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("user/userListView");
		
		return mv;
	}

	/*
	// [김지애] 3. 회원 상세조회 서비스
	@RequestMapping("uDetail.ur")
	public ModelAndView uDetailPage(int userNo, ModelAndView mv) {
		User u = uService.selectUser(userNo);
		mv.addObject("u", u).setViewName("user/userDetailView");
		
		return mv;
	}
	*/
	
	// [김지애] 4. 회원수정 서비스
	@RequestMapping("updateForm.ur")
	public String updateForm(int no, Model model) {
		// 수정할 회원 번호만 받아서 한행 조회 후 model에 담아 수정하기 페이지로 포워딩
		model.addAttribute("u", uService.selectUser(no));
		return "user/userUpdateForm";
	}
	
	// [김지애] 4. 회원수정 서비스
	@RequestMapping("update.ur")
	public String updateUser(User u, HttpSession session) {
		int result = uService.updateUser(u);
		
		if(result > 0) {// 수정 성공 => 조회페이지
			session.setAttribute("alertMsg", "✔ 회원정보가 수정되었습니다 ✔");
			return "redirect:list.ur";
		}else {// 수정 실패 => 수정페이지
			session.setAttribute("alertMsg", "❌ 회원정보 수정에 실패했습니다 ❌");
			return "redirect:update.ur";
		}
		
	}
	
	// [김지애] 5. 회원 프로필이미지 변경 서비스 - ajax
	@ResponseBody
	@RequestMapping("uploadProfile.ur") 
	public void ajaxUploadProfile(MultipartFile uploadFile, User u, String originalFile, HttpSession session) { 
	  
		if(uploadFile != null) {// 넘어온 파일이 있을 경우
			// 저장경로 : 넘기려는 파일, session, 저장위치
			String saveFilePath = FileUpload.saveFile(uploadFile, session, "resources/upload_profielImg/");
			// u.setUserProfileUrl(saveFilePath);
			
			int result = uService.uploadProfileImg(u);
			
			if(result > 0) {// db에 사진 변경 성공
				// db에 업데이트 :번호, 사진만 
				u.setUserNo(result);
				u.setUserProfileUrl(saveFilePath);
				
				// 기존 프로필 이미지가 있었을 경우 : 기존 프로필 이미지 삭제
				if(!originalFile.equals("")){ 
					new File(session.getServletContext().getRealPath(originalFile)).delete();
				}
			}
		} 
	}
	 
	// [김지애] 6. 회원삭제 서비스
	@RequestMapping("delete.ur")
	public String deleteUser(int no, String filePath, HttpSession session) {
		int result = uService.deleteUser(no);
		
		if(result >0) {// db에서 삭제 성공 ('N'으로 변경)
			
			if(!filePath.equals("")) {
				// 첨부파일이 있을 경우 => 파일 삭제
				new File(session.getServletContext().getRealPath(filePath)).delete();
			}
			
			session.setAttribute("alertMsg", "✔ 성공적으로 회원정보가 삭제되었습니다 ✔");
			return "redirect:list.ur";
		}else {
			session.setAttribute("alertMsg", "❌ 회원정보 삭제에 실패했습니다 ❌");
			return "redirect:update.ur";
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
