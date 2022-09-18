package com.project.fitty.statistics.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.fitty.user.model.vo.User;
import com.project.fitty.userClass.model.vo.UserClass;

@Repository
public class StatisticsDao {
	
	public ArrayList<User> selectUserCountForYear(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("statisticsMapper.selectUserCountForYear");
	}
	
	public ArrayList<UserClass> selectClassCountByEmp(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("statisticsMapper.selectClassCountByEmp");
	}
	
	public ArrayList<User> selectCouponRateByUser(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("statisticsMapper.selectCouponRateByUser");
	}

}
