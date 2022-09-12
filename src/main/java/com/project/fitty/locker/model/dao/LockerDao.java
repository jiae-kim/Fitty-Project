package com.project.fitty.locker.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.locker.model.vo.Locker;

@Repository
public class LockerDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("lockerMapper.selectListCount");
	}
	
	public ArrayList<Locker> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("lockerMapper.selectList", null, rowBounds);
	}
	
	public int addLocker(SqlSessionTemplate sqlSession) {
		return sqlSession.insert("lockerMapper.addLocker");
	}
	
	public int deleteLocker(SqlSessionTemplate sqlSession, String lkNo) {
		return sqlSession.delete("lockerMapper.deleteLocker", lkNo);
	}

}
