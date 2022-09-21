package com.project.fitty.ptclass.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Exercise {
	
	private int classNo;
	private String exDate;
	private String exWriter;
	private String exTitle;
	private int exCount;
	private int exSet;
	private String exComent;
	private String exLink;
	private String exStatus;
	private int exNo;

}
