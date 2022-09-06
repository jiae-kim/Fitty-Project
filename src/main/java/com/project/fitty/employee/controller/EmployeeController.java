package com.project.fitty.employee.controller;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.fitty.common.template.FileUpload;
import com.project.fitty.employee.model.service.EmployeeService;
import com.project.fitty.employee.model.vo.Employee;

@Controller
public class EmployeeController {
	
	@Autowired	
	private EmployeeService eService;
	
	
	
	@RequestMapping("login.emp")
	public String loginEmployee(Employee e, HttpSession session) {
		
		Employee loginUser = eService.loginEmployee(e);
		
		if(loginUser != null) {
			session.setAttribute("loginUser", loginUser);
			return "common/mainPage";
		} else {
			session.setAttribute("alertMsg", "사번을 다시 확인해주세요.");
			return "main";
		}
	}
	
	
	@RequestMapping("logout.me")
	public String logoutEmployee(HttpSession session) {
		session.invalidate();
		// 메인페이지 url 재요청
		// 그리고 퇴근시간 update 문도 실행해야함!
		return "common/login";
	}
	
	
	@ResponseBody
	@RequestMapping("nextEmpNo.emp")
	public String selectNextEmpNo() {
		
		return eService.selectNextEmpNo();
	}
	
	
	
	
	@ResponseBody
	@RequestMapping("uploadProfile.emp")
	public Employee ajaxUploadProfile(MultipartFile uploadFile, Employee e, String originalFile, HttpSession session) {
		
		
		if(uploadFile != null) {
			
			if(!originalFile.equals("")) {
				// 기존의 프사가 있었을경우 해당 파일 삭제
				new File(session.getServletContext().getRealPath(originalFile)).delete();
			} 
			// 넘어온 파일이 있을 경우
			String saveFilePath = FileUpload.saveFile(uploadFile, session, "resources/profile_images/");
			e.setEmpPhoto(saveFilePath);
			
			
				// session 에 profileImg 가 업데이트된 새 로그인객체 담기!
				session.setAttribute("e", e);
			}
		return e;
				
		}
		
	
	
	
	@RequestMapping("insert.emp")
	public String insertMember(Employee e, HttpSession session) {
		
		if (e.getEmpGrade().equals("T")) {
			e.setGradeString("TRN");
		} else {
			e.setGradeString("ADM");
		}
		
		int result = eService.insertEmployee(e);
		if(result > 0) {
			session.setAttribute("alertMsg", "✔ 신규 직원 등록 성공! ✔");
			return "redirect:centerAtt.att";
		} else {
			session.setAttribute("alertMsg", "❌ 직원 등록에 실패했습니다! ❌");
			return "redirect:enrollForm.emp";
		}
	}
	
}
