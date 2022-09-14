package com.project.fitty.approval.model.service;

import java.util.ArrayList;

import com.project.fitty.approval.model.vo.Approval;
import com.project.fitty.common.model.vo.PageInfo;

public interface ApprovalService {
	
	// 기안문서함(페이징)
	int selectListCount(String empNo);
	ArrayList<Approval> selectList(PageInfo pi, String empNo);
	
	// 기안문서함(ajax)
	int ajaxSelectListCount(Approval ap);
	ArrayList<Approval> ajaxSelectList(PageInfo pi, Approval ap);
	
	// 임시저장함(페이징)
	int selectStorageListCount(String empNo);
	ArrayList<Approval> selectStorageList(PageInfo pi, String empNo);

}
