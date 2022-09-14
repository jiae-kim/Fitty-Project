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
		
		if(loginUser == null) {
			// 애초에 사번부터 틀렸을 경우
			session.setAttribute("alertMsg", "사번을 다시 확인해주세요.");
			return "main";
		} else {
			// 사번이 맞은 경우 출퇴근 여부 확인
			Employee attFlag = eService.attFlag(e);
			loginUser.setAttIn(attFlag.getAttIn());
			loginUser.setAttOut(attFlag.getAttOut());
			session.setAttribute("loginUser", loginUser);
			return "common/mainPage";
		}
		
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
	
	
	@RequestMapping("delete.emp")
	public String deleteEmployee(String strDeleteListEmpNo, HttpSession session) {
		
		if(strDeleteListEmpNo.length() == 0) {
			session.setAttribute("alertMsg", "❌ 선택한 직원이 없습니다. 다시 선택해주세요! ❌");
			return "redirect:centerAtt.att";
		} else {
			int result = eService.deleteEmployee(strDeleteListEmpNo);
			
			if(result > 0) {
				session.setAttribute("alertMsg", "✔ " + strDeleteListEmpNo + " 님 퇴사 완료 ✔");
				return "redirect:centerAtt.att";
			} else {
				session.setAttribute("alertMsg", "❌ 직원 퇴사에 실패했습니다! ❌");
				return "redirect:centerAtt.att";
			}
		}
		}
	
}
