package com.project.fitty.attendance.model.vo;

import java.util.ArrayList;

import com.project.fitty.vacation.model.vo.Vacation;

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
	
	
	// 실제 오라클 db에는 없지만 필요에 의해 만든 컬럼
	private String thisMonth;
	private String thisYear;
	
	private String grName;
	private String empName;
	private String empEnrollDate;
	
	private String beforeYear;
	private String beforeMonth;
	private String lastDay;
	private ArrayList<Attendance> perYearMonthList;
	private ArrayList<Vacation> empVacList;
	
	private String workYear;
	private String perYear;
	private String perMonth;
	
	private String moAttModifyTime;
	
	
	
	private int countO;
	private int countX;
	private int countL;
	private int countE;
	private int countYH;
	private int countV;
	private int countPtime;
	
	private String nowTime;
	private String gapHour;
	private String gapMinute;
	private String gapSecond;
	
	private String gapYearVac;
	private String gapVac;
	
}
