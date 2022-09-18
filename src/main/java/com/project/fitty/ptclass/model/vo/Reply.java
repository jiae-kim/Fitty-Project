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
	private int dietNo; //변수명 컬럼명 확인해봐야할지도
	private String replyWriter;
	private String replyContent;
	private String replyDate;
	private String replyStatus;
	
	private String writerName;
	private String writerType;
	
}
