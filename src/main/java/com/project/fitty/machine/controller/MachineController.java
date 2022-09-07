package com.project.fitty.machine.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.common.template.FileUpload;
import com.project.fitty.common.template.Pagination;
import com.project.fitty.machine.model.service.MachineService;
import com.project.fitty.machine.model.vo.Machine;

@Controller
public class MachineController {

	@Autowired	
	private MachineService mService;
	
	@RequestMapping("list.mc")
	public String selectMachineList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = mService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Machine> list = mService.selectList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "machine/machineList";
	}
	
	@RequestMapping("enrollForm.mc")
	public String selectEnrollForm() {
		
		return "machine/machineEnrollForm";
	}
	
	@RequestMapping("insert.mc")
	public String insertMachine(Machine m, MultipartFile upfile, HttpSession session, Model model) {
		
		//System.out.println(upfile); // 첨부파일을 선택했든 안했든 생성된 객체
		
		// 전달된 파일이 있을 경우 => 파일명 수정 작업 후 서버 업로드 => 원본명, 서버업로드된경로를 m에 이어서 담기
		if(!upfile.getOriginalFilename().equals("")) {
			
			// 서버에 업로드 
			String originName = upfile.getOriginalFilename();
			
			String saveFilePath = FileUpload.saveFile(upfile, session, "resources/mahine_images");
			m.setMcImg(saveFilePath);
			
			int result = mService.insertMachine(m);
			
			if(result > 0) {
				
				session.setAttribute("alertMsg", "성공적으로 기구가 등록되었습니다.");
				return "redirect:list.mc";
			}else {
				
				session.setAttribute("errorMsg", "기구등록 실패");
				return "common/errorPage";
			}
			
		}else {
			session.setAttribute("errorMsg", "파일 등록은 필수사항입니다.");
			return "redirect:enrollForm.mc";
		}
	}
	
}


