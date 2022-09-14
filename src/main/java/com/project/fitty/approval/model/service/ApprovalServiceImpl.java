package com.project.fitty.approval.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fitty.approval.model.dao.ApprovalDao;
import com.project.fitty.approval.model.vo.Approval;
import com.project.fitty.common.model.vo.PageInfo;

@Service
public class ApprovalServiceImpl implements ApprovalService{
	
	@Autowired
	private ApprovalDao aDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectListCount(String empNo) {
		return aDao.selectListCount(sqlSession, empNo);
	}

	@Override
	public ArrayList<Approval> selectList(PageInfo pi, String empNo) {
		return aDao.selectList(sqlSession, pi, empNo);
	}

	@Override
	public int ajaxSelectListCount(Approval ap) {
		return aDao.ajaxSelectListCount(sqlSession, ap);
	}

	@Override
	public ArrayList<Approval> ajaxSelectList(PageInfo pi, Approval ap) {
		return aDao.ajaxSelectList(sqlSession, pi, ap);
	}

}
