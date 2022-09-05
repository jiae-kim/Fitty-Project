package com.project.fitty.schedule.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.project.fitty.schedule.model.service.ScheduleService;

@Controller
public class ScheduleController {

	@Autowired
	private ScheduleService sdService;
}
