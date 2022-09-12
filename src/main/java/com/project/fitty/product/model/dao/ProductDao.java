package com.project.fitty.product.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.product.model.vo.Product;

@Repository
public class ProductDao {

	// [김지애] 1. 헬스장이용권 전체조회 서비스 (페이징)
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("productMapper.selectListCount");
	}

	public ArrayList<Product> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("productMapper.selectList", null, rowBounds);
	}

	// [김지애] 2. 헬스장이용권 등록 서비스
	public int insertProduct(SqlSessionTemplate sqlSession, Product p) {
		return sqlSession.insert("productMapper.insertProduct", p);
	}

	// [김지애] 3. 헬스장이용권 수정 서비스
	public Product selectProduct(SqlSessionTemplate sqlSession, int proNo) {
		return sqlSession.selectOne("productMapper.selectProduct", proNo);
	}
	
	public int updateProduct(SqlSessionTemplate sqlSession, Product p) {
		return sqlSession.update("productMapper.updateProduct", p);
	}


}
