package com.project.fitty.employee.model.vo;

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
	

}
