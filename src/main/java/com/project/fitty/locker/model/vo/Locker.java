package com.project.fitty.locker.model.vo;

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
public class Locker {

	private int lkNo;
	private Date lkEnrollDate;
	private String lkBlock;
	private int userNo;
	private String userName;
	private Date assignDate; 
	private String startDate;
	private String endDate;
	private String toStartDate;
	private String toEndDate;
	private String mvLkNo;
}
