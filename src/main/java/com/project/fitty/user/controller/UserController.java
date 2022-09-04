package com.project.fitty.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.project.fitty.user.model.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService uService;
	
}
