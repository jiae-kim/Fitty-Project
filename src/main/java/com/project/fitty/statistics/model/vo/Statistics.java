package com.project.fitty.statistics.model.vo;

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
public class Statistics {

	// 연간 회원수 추이
	private int userNo;
	private String userType;
	private Date userSDate;
	private String userPt;
	private String userStatus;
	
	// 트레이너 별 수업 수
	private String empNo;
	private String empGrade;
	private String empStatus;
	
	private int clNo;
	
	
	// 회원 중에 (도넛) 피티를 하고 있는 회원과 안하고 있는 회원 
	
	
	
	
	
}
