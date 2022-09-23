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
public class Diet {
	
	private int dietNo;
	private int classNo;
	private String dietDate;
	private String bfContent;
	private String bfImage;
	private String lcContent;
	private String lcImage;
	private String dnContent;
	private String dnImage;
	private String dietEnroll;
	private String reContent;
	private String reImage;
	
	private int userNo;

	
}
