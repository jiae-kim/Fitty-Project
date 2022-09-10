package com.project.fitty.locker.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.locker.model.dao.LockerDao;
import com.project.fitty.locker.model.vo.Locker;

@Service
public class LockerService {

	@Autowired
	private LockerDao lDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int selectListCount() {
		return lDao.selectListCount(sqlSession);
	}
	
	public ArrayList<Locker> selectList(PageInfo pi){
		return lDao.selectList(sqlSession, pi);
	}
	
}
