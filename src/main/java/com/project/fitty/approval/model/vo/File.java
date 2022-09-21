package com.project.fitty.approval.model.vo;

import java.util.ArrayList;

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
public class File {
	private String fileNo;
	private String originName;
	private String changeName;
	private String fileReType;
	private String fileReNo;

}
