package com.project.fitty.user.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
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
import com.project.fitty.product.model.service.ProductService;
import com.project.fitty.product.model.vo.Product;
import com.project.fitty.user.model.service.UserService;
import com.project.fitty.user.model.vo.User;

@Controller
public class UserController {

	@Autowired
	private UserService uService;
	
	@Autowired
	private ProductService pService;
	
	// [김지애] 1. 회원등록 서비스
	@RequestMapping("enrollForm.ur")
	public ModelAndView enrollForm(ModelAndView mv) {
		// db에 있는 이용권 조회해서 mv에 담아 등록페이지 포워딩
		ArrayList<Product> product = pService.selectProList();
		
		//System.out.println(product);
		mv.addObject("product", product)
		  .setViewName("user/userEnrollForm");
		
		return mv;
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
		
		//System.out.println(list);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("user/userListView");
		
		return mv;
	}
	
	// [김지애] 3. 회원 상세조회 서비스
	@RequestMapping("updateForm.ur")
	public String updateForm(int no, Model model) {
		// 수정할 회원 번호만 받아서 한행 조회 후 model에 담아 수정페이지 포워딩
		model.addAttribute("u", uService.selectUser(no));
		
		// db에 있는 이용권 조회해서 model에 담아 수정페이지 포워딩
		model.addAttribute("product", pService.selectProList());
		
		return "user/userUpdateForm";
	}
	
	// [김지애] 4. 회원수정 서비스
	@RequestMapping("update.ur")
	public String updateUser(User u, HttpSession session) {
		// u로부터 type을 뽑아서 그 값이 P일 경우 => u.setProMonth(0);
		if(u.getUserType().equals("P")) {
			u.setUserMonth("0");
		}
		
		int result = uService.updateUser(u);
		
		if(result > 0) {// 수정 성공 => 조회페이지
			session.setAttribute("alertMsg", "✔ 회원정보가 수정되었습니다 ✔");
			return "redirect:list.ur";
		}else {// 수정 실패 => 수정페이지
			session.setAttribute("alertMsg", "❌ 회원정보 수정에 실패했습니다 ❌");
			return "common/errorPage";
		}
		
	}
	
	// [김지애] 5. 회원 프로필이미지 변경 서비스 - ajax
	@ResponseBody
	@RequestMapping("uploadProfile.ur") 
	public void ajaxUploadProfile(MultipartFile uploadFile, User u, String originalFile, HttpSession session) { 
		//System.out.println(u.getUserNo());
		//System.out.println(uploadFile);
	  
		if(uploadFile != null) {// 넘어온 파일이 있을 경우
			// 저장경로 : 넘기려는 파일, session, 저장위치
			String saveFilePath = FileUpload.saveFile(uploadFile, session, "resources/upload_profileImg/");
			u.setUserProfileUrl(saveFilePath);
			
			int result = uService.uploadProfileImg(u);
			
			if(result > 0) {// db에 사진 변경 성공
				// db에 업데이트 :번호, 사진만 
				//u.setUserNo(result);

				// 기존 프로필 이미지가 있었을 경우 : 기존 프로필 이미지 삭제
				if(!originalFile.equals("")){ 
					new File(session.getServletContext().getRealPath(originalFile)).delete();
				}
			}
		} 
	}
	 
	// [김지애] 6. 회원삭제 서비스
	@RequestMapping("delete.ur")
	public String deleteUser(int userNo, String filePath, HttpSession session) {
		int result = uService.deleteUser(userNo);
		
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
	
	// [김지애] 7. 회원등록 시 전화번호 중복체크 - ajax
	@ResponseBody
	@RequestMapping("telCheck.ur")
	public String ajaxTelCheck(String checkTel) {
		// 사용자가 입력했던 전화번호값 == 중복확인해볼 전화번호
		int count = uService.telCheck(checkTel);
		
		return count > 0 ? "fail" : "success";
	}
	
	// [김지애] 8. 회원 검색 (페이징)
	@ResponseBody
	@RequestMapping("search.ur")
	public ModelAndView searchUser(ModelAndView mv, @RequestParam(value="cpage", defaultValue="1")int currentPage,
								   String keyword, String condition) {
		// 검색결과에 맞는 페이징처리
		int listCount = uService.selectSearchCount(condition, keyword);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		// 검색 조회
		ArrayList<User> list = uService.selectSearchList(condition, keyword, pi);
		
		// 검색 결과에 해당하는 객체들
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("condition", condition)
		  .addObject("keyword", keyword)
		  .setViewName("user/userListView");
		
		return mv;
	}
	
}
