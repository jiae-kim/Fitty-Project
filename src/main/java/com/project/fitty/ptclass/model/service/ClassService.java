package com.project.fitty.ptclass.model.service;

import java.util.ArrayList;

import com.project.fitty.ptclass.model.vo.Exercise;
import com.project.fitty.ptclass.model.vo.PtClass;
import com.project.fitty.ptclass.model.vo.Reply;
import com.project.fitty.user.model.vo.User;
import com.project.fitty.userClass.model.vo.Diet;

public interface ClassService {
	
	
	//수업등록 페이지 내 회원조회
	User selectUser(int userNo);
	
	//수업등록
	int insertClass(PtClass pt);
	
	//수업등록 완료 상태로 변경
	int updateStatus(int userNo);

	
	//내 회원 리스트 조회
	ArrayList<User> selectUserList(String empNo);
	
	
	//운동 등록
	int insertExercise(Exercise e);
	
	
	//해당 회원의 모든 운동내역 조회 (달력에 뿌릴)
	ArrayList<Exercise> selectExercise(int classNo);
	
	
	//특정 회원의 운동내역 중 선택된 날짜의 운동만을 조회
	ArrayList<Exercise> selectExerciseList(Exercise e);
	
	
	//운동 수정을 위한 조회
	Exercise selectEx(int exNo);
	
	
	//운동 완료상태 변경
	int updateCheck(Exercise e);
	
	
	//운동 삭제
	int deleteExercise(Exercise e);
	
	
	//운동 수정
	int updateExercise(Exercise e);
	
	
	//수업 번호에 따른 식단일기 조회
	ArrayList<Diet> selectDiet(int classNo);
	
	
	//식단일기 상세조회
	Diet selectDietDetail(Diet di);
	
	
	//댓글 리스트 서비스
	ArrayList<Reply> selectReplyList(int dietNo);
	
	
	//댓글 등록 서비스
	int insertReply(Reply r);
	
	
	//댓글 수정 서비스
	int updateReply(Reply r);
	
	
	//댓글 삭제 서비스
	int deleteReply(int replyNo);
	
}
