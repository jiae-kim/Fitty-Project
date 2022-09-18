package com.project.fitty.attendance.model.vo;

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
public class ModifyAtt {
	private int moAttNo;
	private String empNo;
	private int attNo;
	private String moAttReason;
	private String moAttBack;
	private String moAttStatus;
	private String moAttType;
	private String moAttEnrollD;
	private String moAttModifyD;
	private String moReadFlag;
	private String moAttModifyTime;
	
	
	// 추가생성 필드
	private String empName;
	private String empPhoto;
	private String grName;

	private String gapHour;
	private String gapMinute;
	private String gapSecond;
	private String attIn;
	private String attOut;
	private String attStatus;
	private Date attDate;
	private String attTime;
}
