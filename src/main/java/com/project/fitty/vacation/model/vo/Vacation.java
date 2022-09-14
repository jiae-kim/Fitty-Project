package com.project.fitty.vacation.model.vo;

import java.sql.Date;
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
public class Vacation {

	
	private int vacNo;
	private String empNo;
	private int vacOper;
	private String vacStatus;
	private String vacNormal;
	private String vacStart;
	private String vacEnd;
	private int vacCount;
	private String vacReason;
	private Date vacCreateDate;
	private String attStatus;
	
	// 실제 오라클 db에는 없지만 필요에 의해 만든 컬럼
	private ArrayList<Vacation> empVacList;
	private String plusYearVac;
	private String minusYearVac;
	private String plusVac;
	private String minusVac;
}
