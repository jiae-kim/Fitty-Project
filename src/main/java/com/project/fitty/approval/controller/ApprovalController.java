package com.project.fitty.approval.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.project.fitty.approval.model.service.ApprovalService;
import com.project.fitty.approval.model.vo.ApprExpDetail;
import com.project.fitty.approval.model.vo.ApprExpense;
import com.project.fitty.approval.model.vo.ApprOvertime;
import com.project.fitty.approval.model.vo.ApprVacation;
import com.project.fitty.approval.model.vo.Approval;
import com.project.fitty.approval.model.vo.ApprovalMember;
import com.project.fitty.approval.model.vo.File;
import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.common.template.FileUpload;
import com.project.fitty.common.template.Pagination;
import com.project.fitty.employee.model.vo.Employee;

@Controller
public class ApprovalController {
	
	@Autowired
	private ApprovalService aService;
	
	@RequestMapping("apprMain.ap")
	public String goApproval() {
		return "approval/approvalMainView";
	}
	
	@RequestMapping(value="vacation.ap", produces="application/json; charset=utf-8")
	public ModelAndView goVacation(ModelAndView mv) {
		ArrayList<Employee> list = aService.selectEmpList();
		mv.addObject("list", list).setViewName("approval/vacationEnrollForm");
		
		return mv;
	}
	
	@RequestMapping(value="overtime.ap", produces="application/json; charset=utf-8")
	public ModelAndView goOvertime(ModelAndView mv) {
		ArrayList<Employee> list = aService.selectEmpList();
		mv.addObject("list", list).setViewName("approval/overtimeEnrollForm");
		return mv;
	}
	
	@RequestMapping(value="expense.ap", produces="application/json; charset=utf-8")
	public ModelAndView goExpense(ModelAndView mv) {
		ArrayList<Employee> list = aService.selectEmpList();
		mv.addObject("list", list).setViewName("approval/expenseEnrollForm");
		return mv;
	}
	
	
	@RequestMapping(value="draftList.ap", produces="application/json; charset=utf-8")
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, String empNo, ModelAndView mv) {
		int listCount = aService.selectListCount(empNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Approval> list = aService.selectList(pi, empNo);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("approval/draftListView");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="changeDraft.ap", produces="application/json; charset=utf-8")
	public String ajaxChangeDraft(@RequestParam(value="cpage", defaultValue="1") int currentPage, String empNo, String apprStatus) {
		Approval ap = new Approval();
		
		if(!apprStatus.isEmpty()) {
			ap.setEmpNo(empNo);
			ap.setApprStatus(apprStatus);
			
			int listCount = aService.ajaxSelectListCount(ap);
			
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			ArrayList<Approval> list = aService.ajaxSelectList(pi, ap);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("pi", pi);
			map.put("list", list);
			
			return new Gson().toJson(map);
		}else {
			
			int listCount = aService.selectListCount(empNo);
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			ArrayList<Approval> list = aService.selectList(pi, empNo);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("pi", pi);
			map.put("list", list);
			return new Gson().toJson(map);
		}
		
	}
	
	@RequestMapping(value="storageList.ap", produces="application/json; charset=utf-8")
	public ModelAndView selectstorageList(@RequestParam(value="cpage", defaultValue="1") int currentPage, String empNo, ModelAndView mv) {
		int listCount = aService.selectStorageListCount(empNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Approval> list = aService.selectStorageList(pi, empNo);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("approval/storageListView");
		
		return mv;
	}
	
	@RequestMapping(value="signList.ap", produces="application/json; charset=utf-8")
	public ModelAndView selectSignList(@RequestParam(value="cpage", defaultValue="1") int currentPage, String empNo, ModelAndView mv) {
		int listCount = aService.selectSignListCount(empNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Approval> list = aService.selectSignList(pi, empNo);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("approval/signListView");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="changeSign.ap", produces="application/json; charset=utf-8")
	public String ChangeSign(@RequestParam(value="cpage", defaultValue="1") int currentPage, String empNo, String apprStatus) {
		Approval ap = new Approval();
		
		if(!apprStatus.isEmpty()) {
			ap.setEmpNo(empNo);
			ap.setApprStatus(apprStatus);
			
			int listCount = aService.ajaxSelectListCount(ap);
			
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			ArrayList<Approval> list = aService.ajaxSelectSignList(pi, ap);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("pi", pi);
			map.put("list", list);
			
			return new Gson().toJson(map);
		}else {
			int listCount = aService.selectListCount(empNo);
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			ArrayList<Approval> list = aService.selectSignList(pi, empNo);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("pi", pi);
			map.put("list", list);
			return new Gson().toJson(map);
		}
	}
	
	@RequestMapping("insertVct.ap")
	public String insertApprVct(Approval ap, ApprovalMember am, ApprVacation vct, HttpSession session, Model model) {
		ArrayList<ApprovalMember> list = am.getMlist();
		
		for(int i=0; i<am.getMlist().size(); i++) {
			list.get(i).setApprLevel(i+1);
			System.out.println(list.get(i));
		}
		
		int result1 = aService.insertApproval(ap);
		int result2 = aService.insertApprMember(list);
		int result3 = aService.insertApprVct(vct);
		
		if(result1>0 && result2>0 && result3>0) {
			session.setAttribute("alertMsg", "결재가 요청되었습니다.");
			return "redirect:draftList.ap";
		}else {
			model.addAttribute("errorMsg", "결재 요청 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("insertOvt.ap")
	public String insertApprOvt(Approval ap, ApprovalMember am, ApprOvertime ovt, HttpSession session, Model model) {
		ArrayList<ApprovalMember> list = am.getMlist();
		
		for(int i=0; i<am.getMlist().size(); i++) {
			list.get(i).setApprLevel(i+1);
		}
		
		int result1 = aService.insertApproval(ap);
		int result2 = aService.insertApprMember(list);
		int result3 = aService.insertApprOvt(ovt);
		
		if(result1>0 && result2>0 && result3>0) {
			session.setAttribute("alertMsg", "결재가 요청되었습니다.");
			return "redirect:draftList.ap";
		}else {
			model.addAttribute("errorMsg", "결재 요청 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("insertExp.ap")
	public String insertApprExp(Approval ap, ApprovalMember am, ApprExpense exp, ApprExpDetail expd, File f, MultipartFile[] upfile, HttpSession session, Model model) {
		ArrayList<ApprovalMember> list = am.getMlist();
		ArrayList<ApprExpDetail> dlist = expd.getDlist();
		ArrayList<File> flist = new ArrayList<>();
		
		for(int i=0; i<am.getMlist().size(); i++) {
			list.get(i).setApprLevel(i+1);
		}
		
		if(upfile.length != 0) {
			for(int i=0; i<upfile.length; i++) {
				flist.add(f);
				String saveFilePath = FileUpload.saveFile(upfile[i], session, "resources/approval_images/");
				flist.get(i).setOriginName(upfile[i].getOriginalFilename());
				flist.get(i).setChangeName(saveFilePath);
				flist.get(i).setFileReNo(ap.getApprNo());
			}
			
		}
		int sum = 0;
		for(int i=0; i<dlist.size(); i++) {
			sum += dlist.get(i).getExpAmount();
			exp.setExpTotalAmount(sum);
		}
		
		int result1 = aService.insertApproval(ap);
		int result2 = aService.insertApprMember(list);
		int result3 = aService.insertApprExp(exp);
		int result4 = aService.insertApprExpDetail(dlist);
		int result5 = aService.insertApprFile(flist);
		
		if(result1>0 && result2>0 && result3>0 && result4>0 && result5>0) {
			session.setAttribute("alertMsg", "결재가 요청되었습니다.");
			return "redirect:draftList.ap";
		}else {
			model.addAttribute("errorMsg", "결재 요청 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("insertStorage.ap")
	public String insertStorage(Approval ap, ApprVacation vct, ApprOvertime ovt, ApprExpense exp, ApprExpDetail expd, File f, MultipartFile[] upfile, HttpSession session, Model model) {
		ArrayList<ApprExpDetail> dlist = expd.getDlist();
		ArrayList<File> flist = new ArrayList<>();
		
		
		int result1 = aService.insertStorage(ap);
		
		if(ap.getApprDocType() == 1) {
			int result2 = aService.insertApprVct(vct);
			if(result1>0 && result2>0) {
				session.setAttribute("alertMsg", "내용이 저장되었습니다.");
				return "redirect:storageList.ap";
			}else {
				model.addAttribute("errorMsg", "임시저장 실패");
				return "common/errorPage";
			}
			
		}else if(ap.getApprDocType() == 2) {
			int result3 = aService.insertApprOvt(ovt);
			
			if(result1>0 && result3>0) {
				session.setAttribute("alertMsg", "내용이 저장되었습니다.");
				return "redirect:storageList.ap";
			}else {
				model.addAttribute("errorMsg", "임시저장 실패");
				return "common/errorPage";
			}
		}else {

			if(upfile.length != 0) {
				for(int i=0; i<upfile.length; i++) {
					flist.add(f);
					String saveFilePath = FileUpload.saveFile(upfile[i], session, "resources/approval_images/");
					flist.get(i).setOriginName(upfile[i].getOriginalFilename());
					flist.get(i).setChangeName(saveFilePath);
					flist.get(i).setFileReNo(ap.getApprNo());
				}
				
				int sum = 0;
				for(int i=0; i<dlist.size(); i++) {
					sum += dlist.get(i).getExpAmount();
					exp.setExpTotalAmount(sum);
				}
			}
			
			int result4 = aService.insertApprExp(exp);
			int result5 = aService.insertApprExpDetail(dlist);
			int result6 = aService.insertApprFile(flist);
			
			if(result1>0 && result4>0 && result5>0 && result6>0) {
				session.setAttribute("alertMsg", "내용이 저장되었습니다.");
				return "redirect:storageList.ap";
			}else {
				model.addAttribute("errorMsg", "임시저장 실패");
				return "common/errorPage";
			}
			
		}
	}
	
	@RequestMapping(value="duleList.ap", produces="application/json; charset=utf-8")
	public ModelAndView scheduleList(@RequestParam(value="cpage", defaultValue="1") int currentPage, String empNo, ModelAndView mv) {
		int listCount = aService.selectListCount(empNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Approval> list = aService.selectScheduleList(pi, empNo);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("approval/apprScheduleListView");
		
		return mv;
	}
	
	@RequestMapping(value="waitingList.ap", produces="application/json; charset=utf-8")
	public ModelAndView waitingList(@RequestParam(value="cpage", defaultValue="1") int currentPage, String empNo, ModelAndView mv) {
		int listCount = aService.selectWaitingListCount(empNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Approval> list = aService.selectWaitingList(pi, empNo);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("approval/apprWaitingListView");
		
		return mv;
		
	}

}
