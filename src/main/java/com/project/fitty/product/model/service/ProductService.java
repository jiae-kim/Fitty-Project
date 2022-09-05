package com.project.fitty.product.model.service;

import com.project.fitty.product.model.vo.Product;

public interface ProductService {

	// [김지애] 헬스장이용권 조회 서비스
	
	// [김지애] 헬스장이용권 등록 서비스
	int insertProduct(Product p);
	
	// [김지애] 헬스장이용권 수정 서비스
	int updateProduct(Product p);
	
	// [김지애] 헬스장이용권 삭제 서비스
	int deleteProduct(String proNo);
}
