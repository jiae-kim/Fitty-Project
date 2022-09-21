package com.project.fitty.email.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
		
		return "mail/insertEmail";
	}
	
	// 받은메일함
	@RequestMapping("received.em")
	public String selectReceivedMailList(Model model, HttpSession session) {
//		
		String empMail = ((Employee) session.getAttribute("loginUser")).getEmpMail();
//		
		Email em = new Email();
		em.setEmRecipient(empMail);
		
		int listCount = emService.receivedEmailListCount(em);
//		
//		
//		return mv;
		
		return "mail/receivedEmail";
		}
	
	// 보낸메일함
	@RequestMapping("sent.em")
	public String selectSentMailList(Model model, HttpSession session) {
		
//		String empMail = ((Employee) session.getAttribute("loginUser")).getEmpMail();
//		
//		Email em = new Email();
//		em.setEmRecipient(empMail);
//		
//		int listCount = emService.sentEmailListCount(em);
//		
//		return mv;
		
		return "mail/sentEmail";
		}
	
	// 내게쓴메일함
	@RequestMapping("stm.em")
	public String selectStmMailList() {
		
		return "mail/sentToMeEmail";
		}
	
	// 임시보관함
	@RequestMapping("tem.em")
	public String selectTemMailList() {
		
		return "mail/temporaryEmail";
	}
	
	// 휴지통
	@RequestMapping("trash.em")
	public String selectTrashMailList() {
		
		return "mail/trashEmail";
	}
	

}
