package com.project.fitty.ptclass.model.vo;

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
public class Reply {
	
	private int replyNo;
	private int dietBoardNo;
	private String replyWriter;
	private String replyContent;
	private String replyDate;
	private String replyStatus;
	
}
