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
	
    // [김지애]
	private String bookNo; 	//DB는 INT형
	private int clNo; 	    //DB는 INT형
	private String userNo; 	//DB는 INT형
	private String empNo;
	private String bookDate;
	private String bookStime;
	private String bookEtime;
	private String bookStatus;
	private String clStatus;
	
	// 뿌려줄 것
	private String empName;  // 직원 이름
	private String userName; // 회원 이름
	
}
