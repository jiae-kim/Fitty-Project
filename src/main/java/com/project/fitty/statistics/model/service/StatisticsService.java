package com.project.fitty.statistics.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fitty.statistics.model.dao.StatisticsDao;
import com.project.fitty.user.model.vo.User;
import com.project.fitty.userClass.model.vo.UserClass;

@Service
public class StatisticsService {
	
	@Autowired
	private StatisticsDao sDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<User> selectUserCountForYear(){
		return sDao.selectUserCountForYear(sqlSession);
	}
	
	public ArrayList<UserClass> selectClassCountByEmp(){
		return sDao.selectClassCountByEmp(sqlSession);
	}
	
	public ArrayList<User> selectCouponRateByUser(){
		return sDao.selectCouponRateByUser(sqlSession);
	}

}
