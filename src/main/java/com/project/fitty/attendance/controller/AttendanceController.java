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
import com.project.fitty.vacation.model.service.VacationService;

@Controller
public class AttendanceController {
	
	@Autowired
	private AttendanceService aService;
	@Autowired	
	private EmployeeService eService;
	@Autowired
	private VacationService vService;
	
	
	@RequestMapping("main.fitty")
	public String goMain() {
		return "common/mainPage";
	}
	
	@RequestMapping("workIn.att")
	public ModelAndView updateWorkIn(HttpSession session, Attendance a, ModelAndView mv) {
		int result = aService.updateWorkIn(a);
		Attendance att = aService.selectInAttendance(a);
		
		Employee e = new Employee();
		e.setEmpNo(a.getEmpNo());
		Employee loginUser = eService.loginEmployee(e);
		
		if(result > 0 && att != null && loginUser != null) {
			Employee attFlag = eService.attFlag(e);
			loginUser.setAttIn(attFlag.getAttIn());
			loginUser.setAttOut(attFlag.getAttOut());
			session.setAttribute("alertMsg", a.getEmpNo() + "님 오늘도 화이팅하세요!💘");
			mv.addObject("att", att).addObject("loginUser", loginUser).setViewName("common/mainPage");
		} else {
			session.setAttribute("alertMsg", a.getEmpNo() + "님 출근 실패 관리자에게 문의하세요😅");
			mv.setViewName("common/mainPage");
		}
		
		return mv;
	}
	
	
	
	@RequestMapping("workOut.att")
	public ModelAndView  updateWorkOutLogout(HttpSession session, Attendance a, ModelAndView mv) {
		int result = aService.updateWorkOutLogOut(a);
		Attendance att = aService.selectInAttendance(a);
		
		Employee e = new Employee();
		e.setEmpNo(a.getEmpNo());
		Employee loginUser = eService.loginEmployee(e);

		if(result > 0 && att != null && loginUser != null) {
			Employee attFlag = eService.attFlag(e);
			loginUser.setAttIn(attFlag.getAttIn());
			loginUser.setAttOut(attFlag.getAttOut());
			session.setAttribute("alertMsg", a.getEmpNo() + "님 금일 근무시간은 " + att.getGapHour() + " 시간 " + att.getGapMinute() + " 분 " + att.getGapSecond() + " 초 입니다!💘");
			mv.addObject("att", att).addObject("loginUser", loginUser).setViewName("common/mainPage");
		} else {
			session.setAttribute("alertMsg", a.getEmpNo() + "님 퇴근 실패 관리자에게 문의하세요😅");
			mv.setViewName("common/mainPage");
		}
		
		return mv;
	
	}
	
	
	
	
	@RequestMapping("logout.me")
	public String onlyLogOut(HttpSession session) {
		session.invalidate();
		return "common/login";
	}
	
	
	@RequestMapping("myAtt.att")
	public String goMyAtt(Attendance a, ModelAndView mv) {
		//Attendance att = aService.selectMyAttendance(a);
		
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
	
	
	@ResponseBody
	@RequestMapping(value="otherAttList.att", produces="application/json; charset=utf-8")
	public String selectOtherAttList(@RequestParam(value="cpage", defaultValue="1")int currentPage, HttpSession session, String thisMonth, String thisYear) {
		
		int listCount =  eService.selectEmpListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Employee> empList =  eService.selectEmpList(pi);
		
		if(!empList.isEmpty()) {
			for(Employee e : empList) {
				e.setThisYear(thisYear);
				e.setThisMonth(thisMonth);
				e.setAttList(aService.selectOtherAttList(e));
				e.setCountList(aService.selectOtherCountList(e));
			}
		}
		
		// HashMap 은 넘길 배열이 2개일때만 사용
		HashMap <String, Object> map = new HashMap<String, Object>();
		map.put("pi", pi);
		map.put("empList", empList);

		return new Gson().toJson(map);
	}
	
	
	
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
	public String goVacControl() {
		return "attendance/centerVacControl";
	}
	
	
	@ResponseBody
	@RequestMapping(value="vacList.att", produces="application/json; charset=utf-8")
	public String goVacControlAtt(@RequestParam(value="cpage", defaultValue="1")int currentPage, HttpSession session, String addSql, String sqlEmpName, String searchFlag) {
		int listCount = 0;
		HashMap <String, Object> sqlMap = new HashMap<String, Object>();
		sqlMap.put("addSql", addSql);
		sqlMap.put("sqlEmpName", sqlEmpName);
		
		if(searchFlag.equals("N")) {
			// 맨 처음 호출될때
			listCount = eService.selectEmpListCount();
		} else {
			// 서치된 값으로 호출될때 searchFlag = Y
			listCount = eService.selectVacSearchListCount(sqlMap);
		}
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Attendance> aList = aService.selectVacList(pi, sqlMap);
		
		Calendar calendar = Calendar.getInstance();
		int tYear = Calendar.getInstance().get(Calendar.YEAR);
		int bYear = Calendar.getInstance().get(Calendar.YEAR)-1;
		int bMonth = Calendar.getInstance().get(Calendar.MONTH);
		calendar.set(bYear, bMonth, 1);
		int lDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		String thisYear = Integer.toString(tYear);
		String beforeYear = Integer.toString(bYear);
		String beforeMonth = Integer.toString(bMonth);
		String lastDay = Integer.toString(lDay);
		
		if(aList.isEmpty()) {
			
		} else {
			for(Attendance a: aList) {
				// 한 회원번호당 1년-한달 근태퍼센트, 남은 휴가등 구하기
			a.setThisYear(thisYear);
			a.setBeforeYear(beforeYear);
			a.setBeforeMonth(beforeMonth);
			a.setLastDay(lastDay);
			// null이던 null이 아니던 일단 담고.. 자스에서 undefined 검사..?
			a.setPerYearMonthList(aService.selectPerYearMonthList(a));
			a.setEmpVacList(vService.selectEmpVacList(a));
			}
		}
		HashMap <String, Object> map = new HashMap<String, Object>();
		map.put("pi", pi);
		map.put("aList", aList);
		return new Gson().toJson(map);
		
	}
	
	@ResponseBody
	@RequestMapping(value="orderByVac.att", produces="application/json; charset=utf-8")
	public String selectOrderByVac(String orderByWorkTime, String orderByAtt, String searchText, HttpSession session) {
		String searchFlag = "Y";
		return goVacControlAtt(1, session, orderByWorkTime, searchText, searchFlag );
		
		
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
