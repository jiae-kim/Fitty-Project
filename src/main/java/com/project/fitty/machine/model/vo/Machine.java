package com.project.fitty.machine.model.vo;

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
public class Machine {

	private int mcNo;
	private String mcName;
	private String mcStatus;
	private String mcImg;
	private Date mcEnrollDate;
	private int ckNo;
	private Date ckDate;
	private String ckContent;
	private String ckImg;
	private String ckResult;
	
	
}
