package com.project.fitty.approval.model.vo;

import java.util.ArrayList;

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
public class ApprOvertime {
	
	private String apprNo;
	private String ovtDate;
	private String ovtStartTime;
	private String ovtEndTime;
	private String ovtReason;
	
	//
	private ArrayList<ApprOvertime> olist;

}
