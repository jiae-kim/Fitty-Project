package com.project.fitty.userClass.model.vo;

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
public class UserClass {
	
	//식단
	private int dietNo;
	private int classNo;
	private String dietDate;
	private String bfContent;
	private String bfImage;
	private String lcContent;
	private String lcImage;
	private String dnContent;
	private String dbImage;
	
	//댓글
	
	
	
	//회원정보
	private int userNo;
	private String userName;
	private String userPhone;
	private String userGender;
	private String userBirth;
	private String userProfileUrl;
	
	//수업
	private String empNo;
	private String userHeight;
	private String userWeight;
	private String classStartDate;
	private int classCount;
	private String classGoal;
	private String classResult;
	
	// 통계 추가
	private String empName;

}
