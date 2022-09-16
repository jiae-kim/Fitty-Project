package com.project.fitty.employee.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import com.project.fitty.attendance.model.vo.Attendance;

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
public class Employee {
	
	private String empNo;
	private String empName;
	private String empGrade;
	private String empGender;
	private String empMail;
	private String empPhone;
	private String empBirth;
	private String empPhoto;
	private Date empEnrollDate;
	private Date empModifyDate;
	
	
	// db에는 없지만 편의상 추가된 필드
	private String grName;
	private String gradeString;
	private ArrayList<Attendance> attList;
	private String thisYear;
	private String thisMonth;
	private ArrayList<Attendance> countList;
	
	private String attIn;
	private String attOut;
	private String attFlag;
	private String nowTime;

}
