package com.project.fitty.schedule.model.vo;

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
public class Booking {
	
	private String bookNo; 	//DB는 INT형임
	private String clNo; 	//DB는 INT형임
	private String userNo; 	//DB는 INT형임
	private String empNo;
	private String bookDate;
	private String bookStime;
	private String bookEtime;
	private String bookStatus;
	private String clStatus;
}
