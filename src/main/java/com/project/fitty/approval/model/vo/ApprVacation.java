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
public class ApprVacation {
	
	private String apprNo;
	private String vtcStatus;
	private String vctStartDate;
	private String vctEndDate;
	private String vctReason;
	private String vctCount;

}
