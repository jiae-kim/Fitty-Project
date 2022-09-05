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

	private String proNo; // DB에는 int형임
	private String product;
	private int proPrice;
	private String proStatus;
}
