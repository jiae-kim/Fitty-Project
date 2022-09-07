package com.project.fitty.alert.model.vo;

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
public class Alert {

	private int alNo;
	private String alType; 
	private String alRecip;
	private String alMsg;
	private int alListNo; 
	private String alReadYn;
	private Date alDate;
}
