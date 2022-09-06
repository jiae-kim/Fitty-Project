package com.project.fitty.approval.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.fitty.approval.model.service.ApprovalService;

@Controller
public class ApprovalController {
	
	@Autowired
	private ApprovalService aService;
	
	@RequestMapping("apprMain.ap")
	public String goApproval() {
		return "approval/approvalMainView";
	}
	
	

}
