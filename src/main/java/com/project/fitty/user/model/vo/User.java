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

	private String userNo; // DB에는 int형임
	private String userName;
	private String userPhone;
	private String userGender;
	private String userBirth;
	private String userType;
	private String userProfileUrl;
	private String userSdate;
	private String userMonth;
	private String userEdate;
	private String userPt;
}
