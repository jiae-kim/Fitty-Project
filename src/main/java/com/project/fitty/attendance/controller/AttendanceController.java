package com.project.fitty.attendance.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.project.fitty.attendance.model.service.AttendanceService;
import com.project.fitty.attendance.model.vo.Attendance;
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
	
	
	
	@RequestMapping(value="centerAtt.att", produces="application/json; charset=utf-8")
	public ModelAndView goCenterAtt(ModelAndView mv) {
		
		ArrayList<Integer> yearList = new ArrayList<>();
		ArrayList<Integer> monthList = new ArrayList<>();
		int thisYear = Calendar.getInstance().get(Calendar.YEAR);
		int thisMonth = Calendar.getInstance().get(Calendar.MONTH) + 1;
		
		for(int i=(Calendar.getInstance().get(Calendar.YEAR) - 5); i<10; i++) {
			yearList.add(i);
		}
		
		for(int i=1; i<=12; i++) {
			monthList.add(i);
		}
		
		// 진짜 그냥 이동 + 년 월에 대한 리스트만 올려 시켜주고, 리스트는 ajax로 불러옴 > ajax 페이징처리
		
		mv.addObject("yearList", yearList).addObject("monthList", monthList)
		  .addObject("thisYear", thisYear).addObject("thisMonth", thisMonth).setViewName("attendance/centerAllAttendance");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="attList.att", produces="application/json; charset=utf-8")
	public String selectAllAttList(@RequestParam(value="cpage", defaultValue="1")int currentPage, HttpSession session, String thisMonth, String thisYear) {
		
		int listCount =  eService.selectEmpListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Employee> empList =  eService.selectEmpList(pi);
		
		if(!empList.isEmpty()) {
			for(Employee e : empList) {
				e.setThisYear(thisYear);
				e.setThisMonth(thisMonth);
				e.setAttList(aService.selectAllAttList(e));
				e.setCountList(aService.selectCountList(e));
			}
		}
		
		// HashMap 은 넘길 배열이 2개일때만 사용
		HashMap <String, Object> map = new HashMap<String, Object>();
		map.put("pi", pi);
		map.put("empList", empList);

		return new Gson().toJson(map);
	}
	/*
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

		// HashMap 은 넘길 배열이 2개일때만 사용
		HashMap <String, Object> map = new HashMap<String, Object>();
		map.put("pi", pi);
		map.put("empList", empList);

		return new Gson().toJson(map);
	}
	*/
	
	@RequestMapping("resetAtt.att")
	public String resetAttendanceUpdate(String afterEmpNoList, HttpSession session) {
		String[] beforeEmpArray = afterEmpNoList.split(",");
		final List<String> empList =  new ArrayList<String>();
	    Collections.addAll(empList, beforeEmpArray);
	    
	    //String thisYear = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy"));
	    String thisYear = Integer.toString(Calendar.getInstance().get(Calendar.YEAR));
	    int resetStatusNull = 0;
	    int setWeekDaysX = 0;
	    int count = 0;
	    for(int i=0; i<empList.size(); i++) {
	    	resetStatusNull += aService.insertAttendance(empList.get(i), thisYear);
	    	setWeekDaysX += aService.updateAttendanceStatus(empList.get(i), thisYear);
	    	count = i;
	    }
	    
	   
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
