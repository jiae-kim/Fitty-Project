package com.project.fitty.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class chatController {
	@RequestMapping("chat.ch")
	public String goChat() {
		return "chat/chatEmpList";
	}
}
