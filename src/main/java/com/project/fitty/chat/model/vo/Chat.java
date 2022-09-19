package com.project.fitty.chat.model.vo;

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
public class Chat {
	
	
	// tb_chat
	private int chatRoomNo;
	private String empNo;
	private String chatIorg;
	private Date chatCreateDate;
	private Date chatDeleteDate;
	private String chatStatus;
	
	// tb_invite
	private Date invInDate;
	private Date invOutDate;
	
	// tb_bubble
	private int bblNo;
	private String bblContent;
	private Date bblDate;
}
