package com.project.fitty.machine.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.machine.model.dao.MachineDao;
import com.project.fitty.machine.model.vo.Machine;

@Service
public class MachineService {
	
	@Autowired
	private MachineDao mDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int selectListCount() {
		return mDao.selectListCount(sqlSession);
	}
	
	public ArrayList<Machine> selectList(PageInfo pi){
		return mDao.selectList(sqlSession, pi);
	}

}
