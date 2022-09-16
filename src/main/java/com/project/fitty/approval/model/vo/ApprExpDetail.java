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
public class ApprExpDetail {
	
	private String apprNo;
	private String expDate;
	private String expStatus;
	private int expAmount;
	private String expHistory;
	private String expNote;

}
