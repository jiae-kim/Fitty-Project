package com.project.fitty.approval.model.vo;

import java.util.ArrayList;

import com.project.fitty.employee.model.vo.Employee;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class ApprovalMember {
	
	private String apprNo; 
	private String empNo;
	private int apprLevel;  
	private String apprDate; 
	private String apprComment; 
	private String apprStatus;
	
	//
	private ArrayList<ApprovalMember> mlist;
	private int apprMemCount;
	private String empName;
	private String grApprGrade;
}
