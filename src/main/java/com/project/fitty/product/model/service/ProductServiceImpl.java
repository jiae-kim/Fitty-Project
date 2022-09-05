package com.project.fitty.product.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fitty.product.model.dao.ProductDao;
import com.project.fitty.product.model.vo.Product;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ProductDao pDao;
	
	@Override
	public int insertProduct(Product p) {
		return 0;
	}

	@Override
	public int updateProduct(Product p) {
		return 0;
	}

	@Override
	public int deleteProduct(String proNo) {
		return 0;
	}

}
