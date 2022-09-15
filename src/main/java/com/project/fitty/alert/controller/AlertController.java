package com.project.fitty.alert.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.project.fitty.alert.model.service.AlertService;
import com.project.fitty.alert.model.vo.Alert;

@Controller
public class AlertController {

	@Autowired
	private AlertService aService;
	
	@ResponseBody
	@RequestMapping("minsert.at") /** 기구 점검 alert insert **/
	public String ajaxInsertAlertM(Alert a) {
		
		System.out.println(a);
		
	    a.setAlMsg("<a href='ckList.mc'>"+ a.getAlSender() + "님이 " + a.getAlListNo() + "번 기구점검을 처리완료 하였습니다.</a>");
		int result = aService.insertAlertM(a); 
		
		return result > 0 ? "success" : "fail";
	}
	
	@ResponseBody
	@RequestMapping(value="alist.at", produces="application/json; charset=utf-8")
	public String ajaxSelectAlertList(String alRecip) {
		
		ArrayList<Alert> list = aService.selectAlertList(alRecip);
		System.out.println("실행 잘됨 ");
		return new Gson().toJson(list);
	}
	
}
