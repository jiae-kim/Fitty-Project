package com.project.fitty.ptclass.model.vo;

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
public class PtClass {
	
	private int classNo;
	private String empNo;
	private int userNo;
	private String userHeight;
	private String userWeight;
	private String classStartDate;
	private int classCount;
	private String classGoal;
	private String classResult;

}
