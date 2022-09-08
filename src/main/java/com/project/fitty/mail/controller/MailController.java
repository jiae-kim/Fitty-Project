package com.project.fitty.mail.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.fitty.mail.model.service.MailService;

@Controller
public class MailController {
	
	@Autowired
	private MailService mService;
	
	@RequestMapping("mail.re")
	public String selectMailList() {
		
		return "mail/receivedMail";
		}
	
	@RequestMapping("mail.se")
	public String selectSentMailList() {
		
		return "mail/sentMail";
		}
	
	@RequestMapping("mail.stm")
	public String selectSentToMeMailList() {
		
		return "mail/sentToMeMail";
		}
	
	
	@RequestMapping("mail.tem")
	public String selectTemMailList() {
		
		return "mail/temporaryMail";
}
	
	@RequestMapping("mail.tr")
	public String selectTrashMailList() {
		
		return "mail/trashMail";
	}
		
	@RequestMapping("mail.wr")
	public String selectWriteMail() {
		
		return "mail/writeMail";
}
}
