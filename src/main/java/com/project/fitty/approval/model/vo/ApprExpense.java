package com.project.fitty.approval.model.vo;

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
public class ApprExpense {
	
	private String apprNo;
	private String expMem;
	private String expDate;
	private int expTotalAmount;
	private String expReason;
	
	private String originName;
	private String changeName;
	
	//
	private String empName;
	private String empNo;
	private String apprTitle;
	private String apprEnrollDate;
	private String grApprGrade;
	private String apprDocType;

}
