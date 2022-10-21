package com.project.fitty.product.model.vo;

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
public class Product {

    // [김지애]
	private int proNo; 
	private String pro; //DB에는 PRODUCT로 되어있음
	private String proPrice;
	private String proStatus;
	private String proMonth;
	private int month; //DB에는 해당 컬럼 없음
}
