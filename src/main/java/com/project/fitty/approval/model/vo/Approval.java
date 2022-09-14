package com.project.fitty.approval.model.vo;

import java.sql.Date;

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
public class Approval {
	
	private String apprNo;
	private String empNo;
	private int apprDocType;
	private String apprTitle;
	private Date apprEnrollDate;
	private String apprStatus;
	private String apprStorage;
	private String apprComment;
	private int apprMemCount;

}
