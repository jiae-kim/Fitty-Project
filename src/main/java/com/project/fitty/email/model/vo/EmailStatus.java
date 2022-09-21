package com.project.fitty.email.model.vo;

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

public class EmailStatus{
	private int emNo;
	private String emRecipient;
	private String emRead;
	private String status;
	private String emReference;
	
}
