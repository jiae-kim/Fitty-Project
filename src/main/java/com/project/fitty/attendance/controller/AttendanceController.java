package com.project.fitty.attendance.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.project.fitty.attendance.model.service.AttendanceService;
import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.common.template.Pagination;
import com.project.fitty.employee.model.service.EmployeeService;
import com.project.fitty.employee.model.vo.Employee;

@Controller
public class AttendanceController {
	
	@Autowired
	private AttendanceService aService;
	@Autowired	
	private EmployeeService eService;
	
	
	@RequestMapping("main.fitty")
	public String goMain() {
		return "common/mainPage";
	}
	
	@RequestMapping("myAtt.att")
	public String goMyAtt() {
		return "attendance/myAttendance";
	}
	
	@RequestMapping("attModifyForm.att")
	public String goMyModifyForm() {
		return "attendance/myAttendanceModify";
	}
	
	
	
	@RequestMapping("resetForm.att")
	public String goResetFormAttendance() {
		return "attendance/resetAttendanceForm";
		// 진짜 그냥 이동만 시켜주고, 리스트는 ajax로 불러옴 > ajax 페이징처리
	}
	
	@ResponseBody
	@RequestMapping(value="reset.att", produces="application/json; charset=utf-8")
	public String goResetAttendance() {
		ArrayList<Employee> levelEmpList =  eService.selectLevelEmployeeList();
		return new Gson().toJson(levelEmpList);
	}
	
	@ResponseBody
	@RequestMapping(value="listInsert.att", produces="application/json; charset=utf-8")
	public String checkEmpNoList(String strInsertListEmpNo){
		String empNo = "(" + strInsertListEmpNo + ")";
		ArrayList<Employee> checkEmpList =  eService.checkEmpNoList(empNo);
		return new Gson().toJson(checkEmpList);
	}
	
	@ResponseBody
	@RequestMapping(value="listDelete.att", produces="application/json; charset=utf-8")
	public String deleteEmpNoList(String strInsertListEmpNo, String deleteEmpNo) {
		
		if(strInsertListEmpNo.trim().isEmpty()) {
			
			String notReadyEmpNo = "";
			ArrayList<Employee> deleteEmpNoList = new ArrayList<Employee>();
			HashMap <String, Object> map = new HashMap<String, Object>();
			map.put("empNo", notReadyEmpNo);
			map.put("deleteEmpNoList", deleteEmpNoList);
		    
			return new Gson().toJson(map);
			
		} else {

			String[] beforeEmpArray = strInsertListEmpNo.split(",");
			final List<String> list =  new ArrayList<String>();
		    Collections.addAll(list, beforeEmpArray); 
		  
		    list.remove(deleteEmpNo);
			
		    String newEmpNo = "";
		    
		    for(int i=0; i<list.size(); i++) {
		    	newEmpNo += list.get(i) + ",";
		    }
		    String notReadyEmpNo = newEmpNo.substring(0, newEmpNo.length() - 1);
		    String empNo = "(" + notReadyEmpNo + ")";
		    
		    ArrayList<Employee> deleteEmpNoList = eService.deleteEmpNoList(empNo);
		    
		    
		    HashMap <String, Object> map = new HashMap<String, Object>();
			map.put("empNo", notReadyEmpNo);
			map.put("deleteEmpNoList", deleteEmpNoList);
		    
			return new Gson().toJson(map);
		}
		
	    
	}
	
	
	
	
	@RequestMapping("centerAtt.att")
	public String goCenterAtt() {
		return "attendance/centerAllAttendance";
		// 진짜 그냥 이동만 시켜주고, 리스트는 ajax로 불러옴 > ajax 페이징처리
	}
	
	@ResponseBody
	@RequestMapping(value="attList.att", produces="application/json; charset=utf-8")
	public String selectAllAttList(@RequestParam(value="cpage", defaultValue="1")int currentPage, HttpSession session) {
		
		int listCount =  eService.selectEmpListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Employee> empList =  eService.selectEmpList(pi);
		if(!empList.isEmpty()) {
			for(Employee e : empList) {
				e.setAttList(aService.selectAllAttList(e));
			}
		}

		/* HashMap 은 넘길 배열이 2개일때만 사용 */
		HashMap <String, Object> map = new HashMap<String, Object>();
		map.put("pi", pi);
		map.put("empList", empList);

		return new Gson().toJson(map);
	}
	
	
	@RequestMapping("resetAtt.att")
	public String resetAttendanceUpdate(String afterEmpNoList, HttpSession session) {
		System.out.println(afterEmpNoList);
		String[] beforeEmpArray = afterEmpNoList.split(",");
		final List<String> empList =  new ArrayList<String>();
	    Collections.addAll(empList, beforeEmpArray);
	    int resetStatusNull = 0;
	    int setWeekDaysX = 0;
	    int count = 0;
	    for(int i=0; i<empList.size(); i++) {
	    	resetStatusNull += aService.insertAttendance(empList.get(i));
	    	setWeekDaysX += aService.updateAttendanceStatus(empList.get(i));
	    	count = i;
	    }
	    int result = count * 365;
	    
	   
	    	session.setAttribute("alertMsg", (count+1) + "명 근태초기화에 성공했습니다.");
	    	return "attendance/centerAllAttendance";
	   
	}

	
	
	
	@RequestMapping("vacControl.att")
	public String goVacControlAtt() {
		return "attendance/centerVacControl";
	}

	
	@RequestMapping("modifyAtt.att")
	public String goModifyAtt() {
		return "attendance/modifyAttendance";
	}

	
	@RequestMapping("enrollForm.emp")
	public String goEnrollForm() {
		return "attendance/employeeEnrollForm";
	}
	
	
	

}
