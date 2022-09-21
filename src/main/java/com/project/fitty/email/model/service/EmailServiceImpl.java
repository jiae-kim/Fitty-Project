package com.project.fitty.email.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.email.model.dao.EmailDao;
import com.project.fitty.email.model.vo.Email;
import com.project.fitty.email.model.vo.File;
@Service
public class EmailServiceImpl implements EmailService{
	
	@Autowired
	private EmailDao emDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertEmail(Email email) {
		return 0;
	}

	@Override
	public int insertRecipients(String[] emRecipients) {
		return 0;
	}

	@Override
	public int insertRecipientsRe(String[] emRecipient_re) {
		return 0;
	}

	@Override
	public int insertSender() {
		return 0;
	}

	@Override
	public int insertFile(File file) {
		return 0;
	}

	@Override
	public int sentEmailListCount(Email em) {
		return emDao.sentEmailListCount(sqlSession, em);
	}

	@Override
	public ArrayList<Email> selectSentEmailList(Email em, PageInfo pi) {
		return emDao.selectSentEmailList(sqlSession, pi, em);
	}

	@Override
	public int receivedEmailListCount(Email em) {
		return emDao.receivedEmailListCount(sqlSession, em);
	}

	@Override
	public ArrayList<Email> selectReceivedEmailList(Email em, PageInfo pi) {
		return emDao.selectReceivedEmailList(sqlSession, pi, em);
	}

	@Override
	public int trashEmailListCount(Email em) {
		return 0;
	}

	@Override
	public ArrayList<Email> selectTrashEmailList(Email em, PageInfo pi) {
		return null;
	}

	@Override
	public int stmEmailListCount(Email em) {
		return emDao.stmEmailListCount(sqlSession, em);
	}

	@Override
	public ArrayList<Email> selectStmEmailList(Email em, PageInfo pi) {
		return emDao.selectStmEmailList(sqlSession, pi, em);
	}






}
