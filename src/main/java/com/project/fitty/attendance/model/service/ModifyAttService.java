package com.project.fitty.attendance.model.service;

import java.util.ArrayList;

import com.project.fitty.attendance.model.vo.ModifyAtt;

public interface ModifyAttService {

	
	ArrayList<ModifyAtt> selectModifyList(String empNo);
	
	ModifyAtt selectModifyDetail(String moAttNo);
	
	int insertMoAtt(ModifyAtt m);
	
	
	
	// 어드민쪽 수정리스트 전체조회
	ArrayList<ModifyAtt> selectAllModifyList();
	
	// 어드민 근태수정 업데이트
	int updateModifyAtt(ModifyAtt m);
	
	int cantUpdateModifyAtt(ModifyAtt m);
}
