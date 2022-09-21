package com.project.fitty.email.model.vo;

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

public class Email {

	private int emNo;
	private String emTitle;
	private String emContent;
	private Date emSdate;
	private String emStatus;
	private String emNotice;
	private String emStm;
	private String emSender;
	private String emRecipient;
	private String emRecipientRe;
}
