package com.project.fitty.email.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.common.template.Pagination;
import com.project.fitty.email.model.service.EmailService;
import com.project.fitty.employee.model.vo.Employee;
import com.project.fitty.email.model.vo.Email;



@Controller
public class EmailController {
	
	@Autowired
	private EmailService emService;
	
	// 메일 쓰기
	@RequestMapping("insert.em")
	public String selectWriteMail() {
		
		return "email/insertEmail";
	}
	
	// 받은메일함
	@RequestMapping("received.em")
	public String selectReceivedEmailList(@RequestParam(value = "cpage", defaultValue = "1")int currentPage, Model model, HttpSession session) {
		
		String empMail = ((Employee) session.getAttribute("loginUser")).getEmpMail();
		
		Email em = new Email();
		em.setEmRecipient(empMail);
		
		int listCount = emService.receivedEmailListCount(em);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);

		ArrayList<Email> mList = emService.selectReceivedEmailList(em, pi);
		model.addAttribute("mList", mList);
		
		return "email/receivedEmail";
		}
	
	// 보낸메일함
	@RequestMapping("sent.em")
	public String selectSentEmailList(@RequestParam(value = "cpage", defaultValue = "1")int currentPage, Model model, HttpSession session) {
		
		String empMail = ((Employee) session.getAttribute("loginUser")).getEmpMail();
		
		Email em = new Email();
		em.setEmSender(empMail);
		
		int listCount = emService.sentEmailListCount(em);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);

		ArrayList<Email> mList = emService.selectSentEmailList(em, pi);
		model.addAttribute("mList", mList);
		
		return "email/sentEmail";
		}
	
	// 내게쓴메일함
	@RequestMapping("stm.em")
		public String selectStmEmailList(@RequestParam(value = "cpage", defaultValue = "1")int currentPage, Model model, HttpSession session) {
			
			String empMail = ((Employee) session.getAttribute("loginUser")).getEmpMail();
			
			Email em = new Email();
			em.setEmSender(empMail);
			
			int listCount = emService.stmEmailListCount(em);
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);

			ArrayList<Email> mList = emService.selectStmEmailList(em, pi);
			model.addAttribute("mList", mList);
		
		return "email/sentToMeEmail";
		}
	
	// 임시보관함
	@RequestMapping("tem.em")
	public String selectTemMailList() {
		
		return "email/temporaryEmail";
	}
	
	// 휴지통
	@RequestMapping("trash.em")
	public String selectTrashMailList() {
		
		return "email/trashEmail";
	}
	

}
