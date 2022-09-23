package com.project.fitty.userClass.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.project.fitty.common.template.FileUpload;
import com.project.fitty.userClass.model.service.UserClassServiceImpl;
import com.project.fitty.userClass.model.vo.Diet;
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
	public String userExercise(int classNo, HttpSession session) {
		session.setAttribute("classNo", classNo);
		return "userClass/userExercise";
	}
	
	
	//식단일기 페이지로 이동
	@RequestMapping("userDi.cl")
	public String userDiet() {
		return "userClass/userDiet";
	}

	
	//식단일기 상세조회
	/**
	 * @param di : 수업번호, 해당날짜 => diet : 수업번호, 해당날짜, 글번호를 포함한 모든 사항이 조회되어 넘어옴
	 * @param model
	 * @return
	 */
	@RequestMapping("userDiDetail.cl")
	public String dietDetail(Diet di, Model model) {
		
		Diet diet = ucService.selectUserDiet(di);
		
		if(diet != null) { //insert된 내용이 존재하는 경우
			model.addAttribute("d", diet);
		}else { //insert된 내용이 존재하지 않는 경우
			model.addAttribute("d", di);
		}
		return "userClass/userDietDetail";
	}
	
	
	//식단일기 등록 (dietEnroll == 'N')
	/**
	 * Author : 정다혜
	 * @param time : 아.점.저 중 어떤 시간에 해당하는 글인지 구분해주는 문자열
	 * @param di : 수업번호, 해당 게시글 날짜, 해당하는 시간의 내용과 이미지 (insert 되면서 글번호가 생성, di_enroll 상태가 Y로 변경됨)
	 * @param upfile
	 * @param session
	 * @return
	 */
	@RequestMapping("insertDi.cl")
	public String insertDietBoard(Diet di, String time, MultipartFile upfile, HttpSession session) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			
			String saveFilePath = FileUpload.saveFile(upfile, session, "resources/diet/");
			
			//넘어온 첨부파일이 어느 타임때의 글인지 구분하여 첨부파일 담기
			if(time.equals("bf")) {
				di.setBfImage(saveFilePath);
			}else if(time.equals("lc")) {
				di.setLcImage(saveFilePath);
			}else {
				di.setDnImage(saveFilePath);
			}
			
		}
		
		int result = ucService.insertUserDiet(di); //첨부파일까지 담은채로 insert요청
		
		if(result > 0) {
			session.setAttribute("alertMsg", "식단 등록에 성공했습니다.");
			return "redirect:userDiDetail.cl?classNo=" + di.getClassNo() + "&dietDate=" + di.getDietDate();
		}else {
			session.setAttribute("alertMsg", "식단 등록에 실패했습니다. 다시 시도해주세요.");
			return "redirect:userDiDetail.cl?classNo=" + di.getClassNo() + "&dietDate=" + di.getDietDate();
		}
		
	}
	
	
	
//	//식단일기 업데이트 (이미 하나의 이미지를 등록한 상태일 때 dietEnroll == 'Y')
	@RequestMapping("updateDi.cl")
	public String updateDietBoard(Diet d, String time, MultipartFile reupfile, HttpSession session) {
		
		Diet di = ucService.selectUserDiet(d);
		
		//새로 넘어온 첨부파일이 있을 경우
		if(!reupfile.getOriginalFilename().equals("")) {
			
			if(time.equals("bf")) {
				String saveFilePath = FileUpload.saveFile(reupfile, session, "resources/diet/");
				di.setBfImage(saveFilePath);
				di.setBfContent(d.getBfContent());
				
			}else if(time.equals("lc")) {
				String saveFilePath = FileUpload.saveFile(reupfile, session, "resources/diet/");
				di.setLcImage(saveFilePath);
				di.setLcContent(d.getLcContent());
				
			}else if(time.equals("dn")) {
				String saveFilePath = FileUpload.saveFile(reupfile, session, "resources/diet/");
				di.setDnImage(saveFilePath);
				di.setDnContent(d.getDnContent());
			}else {
				String saveFilePath = FileUpload.saveFile(reupfile, session, "resources/diet/");
				di.setReImage(saveFilePath);
				di.setReContent(d.getReContent());
			}
		}	
		
		int result = ucService.updateDietBoard(di);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 게시글이 수정되었습니다.");
			return "redirect:userDiDetail.cl?classNo=" + di.getClassNo() + "&dietDate=" + di.getDietDate();
		}else {
			session.setAttribute("alertMsg", "다시 시도해주세요.");
			return "redirect:userDiDetail.cl?classNo=" + di.getClassNo() + "&dietDate=" + di.getDietDate();
		}
	}
	
	

}
