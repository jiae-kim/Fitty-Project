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
public class ModifyAtt {
	private int moAttNo;
	private String empNo;
	private int attno;
	private String moAttReason;
	private String moAttBack;
	private String moAttStatus;
	private String moAttType;
	private String moAttEnrollD;
	private String moAttModifyD;

}
