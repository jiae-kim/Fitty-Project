package com.project.fitty.approval.model.service;

import java.util.ArrayList;

import com.project.fitty.approval.model.vo.Approval;
import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.employee.model.vo.Employee;

public interface ApprovalService {
	// 직원리스트
	ArrayList<Employee> selectEmpList();
	
	// 기안문서함(페이징)
	int selectListCount(String empNo);
	ArrayList<Approval> selectList(PageInfo pi, String empNo);
	
	// 기안문서함(ajax)
	int ajaxSelectListCount(Approval ap);
	ArrayList<Approval> ajaxSelectList(PageInfo pi, Approval ap);
	
	// 임시저장함(페이징)
	int selectStorageListCount(String empNo);
	ArrayList<Approval> selectStorageList(PageInfo pi, String empNo);
	
	// 결재문서함(페이징)
	int selectSignListCount(String empNo);
	ArrayList<Approval> selectSignList(PageInfo pi, String empNo);
	
	// 결재문서함(ajax)
	int ajaxSelectSignListCount(Approval ap);
	ArrayList<Approval> ajaxSelectSignList(PageInfo pi, Approval ap);
}
