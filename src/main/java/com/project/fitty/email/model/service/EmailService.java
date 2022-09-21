package com.project.fitty.email.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.email.model.vo.Email;
import com.project.fitty.email.model.vo.File;


public interface EmailService {
	
	// 메일쓰기
	
		int insertEmail(Email email);
		
		// 받는사람 
		int insertRecipients(String[] emRecipients);
		
		// 숨은 참조된 사람
		int insertRecipientsRe(String[] emRecipient_re);
		
		// 보낸사람
		int insertSender();
		
		// 첨부파일
		int insertFile(File file);
		
		
	// 보낸 메일함
			
		// 보낸 메일 개수 조회
		int sentEmailListCount(Email em);

		// 보낸 메일 리스트 조회
		ArrayList<Email> selectSentEmailList(Email em, PageInfo pi);
		
		
		
	// 받은 메일함
		
		// 받은 메일 개수 조회
		int receivedEmailListCount(Email em);
		
		// 받은 메일 리스트 조회
		ArrayList<Email> selectReceivedEmailList(Email em, PageInfo pi);
		
		
	// 휴지통
		
		// 휴지통 메일 개수 조회
		int trashEmailListCount(Email em);

		// 휴지통 메일 리스트 조회
		ArrayList<Email> selectTrashEmailList(Email em, PageInfo pi);
		
	
	// 내게쓴메일함
		
		// 내게쓴메일함 메일 개수 조회
		int stmEmailListCount(Email em);
		
		// 내게쓴메일함 메일 리스트 조회
		ArrayList<Email> selectStmEmailList(Email em, PageInfo pi);
		
	
		


		
		
		
		
		
	

}
