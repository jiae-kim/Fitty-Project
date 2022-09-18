package com.project.fitty.user.model.vo;

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
public class User {

	private int userNo; 
	private String userName;
	private String userPhone;
	private String userGender;
	private String userBirth;
	private String userType;
	private String userProfileUrl; // DB컬럼명 : USER_PROFILE_URL
	private String userSdate;
	private String userMonth;
	private String userEdate;
	private String userPt;
	private String userStatus;
	
	//[정다혜] 
	private int classNo;
	private String empNo;
	private String classStartDate;
	private int classCount;
	
}
