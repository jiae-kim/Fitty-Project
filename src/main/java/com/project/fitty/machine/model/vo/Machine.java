package com.project.fitty.machine.model.vo;

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
	private String mcEnrollDate;
	private int ckNo;
	private String ckDate;
	private String ckTitle;
	private String ckContent;
	private String ckImg;
	private String ckResult;
	private String ckWriter;
	private String ckWriterName;
	
	
}
