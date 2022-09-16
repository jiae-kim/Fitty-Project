package com.project.fitty.alert.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.project.fitty.alert.model.service.AlertService;
import com.project.fitty.alert.model.vo.Alert;
import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.common.template.Pagination;
import com.project.fitty.employee.model.vo.Employee;
import com.project.fitty.machine.model.service.MachineService;
import com.project.fitty.machine.model.vo.Machine;

@Controller
public class AlertController {

	@Autowired
	private AlertService aService;
	
	@Autowired
	private MachineService mService;
	
	@ResponseBody
	@RequestMapping("minsert.at") /** 기구 점검 alert insert **/
	public String ajaxInsertAlertM(Alert a) {
		
		System.out.println(a);
		
		//현재 마지막으로 실행된 alNo를 조회해오기 
		int lastNo = aService.selectLastAlNo();
		
		String senderName = aService.selectSenderName(a.getAlSender());
		
	    a.setAlMsg("<a href='ckList2.mc?alNo=" + lastNo + "&alRecip="+ a.getAlRecip() +"'>"+ senderName + "님이 " + a.getAlListNo() + "번 기구점검을 처리완료 하였습니다.</a>");
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
	
	@RequestMapping("ckList2.mc") /** 기구 점검 리스트[알림읽으러 이동하는] **/
	public String updateAlertReadStateM(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, int alNo, String alRecip, Model model, HttpSession session) {

		// 기구 점검 리스트 조회  
		int listCount = mService.selectCheckListCount();

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Machine> list = mService.selectCheckList(pi);
		
		// alNo로 읽음처리 해주기
	    int result = aService.updateReadYn(alNo);
		
	    if(result > 0) {
	    	
	    	// session.setAttribute("msgList"로 메세지 조회해와서 담아주기)
	    	ArrayList<Alert> msgList = aService.selectAlertList(alRecip);
	    	session.setAttribute("msgList", msgList);
	    	
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);

			return "machine/machineCheckList";
	    }else {
	    	session.setAttribute("errorMsg", "알림 읽기 실패");
	    	return "common/errorPage";
	    }
		
	}
	
}
