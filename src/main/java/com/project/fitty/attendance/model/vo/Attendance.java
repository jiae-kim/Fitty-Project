package com.project.fitty.attendance.model.vo;

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
public class Attendance {
	
	private int attNo;
	private String empNo;
	private String attDate;
	private String attIn;
	private String attOut;
	private String attStatus;
	private String attPlusWork;
	private String attNworkTime;
	private String attPworkTime;
	
	private String thisMonth;
	private String thisYear;
	
}
