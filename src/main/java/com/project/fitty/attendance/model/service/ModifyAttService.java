package com.project.fitty.attendance.model.service;

import java.util.ArrayList;

import com.project.fitty.attendance.model.vo.ModifyAtt;

public interface ModifyAttService {

	
	ArrayList<ModifyAtt> selectModifyList(String empNo);
	
	ModifyAtt selectModifyDetail(String moAttNo);
}
