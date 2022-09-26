package com.project.fitty.ptclass.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.project.fitty.ptclass.model.service.ClassService;
import com.project.fitty.ptclass.model.vo.Exercise;
import com.project.fitty.ptclass.model.vo.PtClass;
import com.project.fitty.ptclass.model.vo.Reply;
import com.project.fitty.schedule.model.vo.Booking;
import com.project.fitty.user.model.vo.User;
import com.project.fitty.userClass.model.vo.Diet;

@Controller
public class ClassController {
	
	@Autowired
	private ClassService cService;
	
	
	//회원페이지에서 수업등록 페이지 이동(회원정보 조회 포함)
	/**Author : 정다혜 
	 * @param no : 회원번호 (userNo)
	 * @param mv
	 * @return
	 */
	@RequestMapping("enroll.cl")
	public ModelAndView classEnrollForm(int no, ModelAndView mv) {
		
		User u = cService.selectUser(no);

		if(u != null) {
			mv.addObject("u", u).setViewName("class/classEnrollForm");
		}else {
			
		}
		
		return mv;
	}
	
	
	//수업등록 페이지 이동
	@RequestMapping("enrollPage.cl")
	public String enrollForm() {
		return "class/classEnroll";
	}
	
	
	
	
	//수업등록
	/**Author : 정다혜
	 * @param pt
	 * @param session
	 * @return
	 */
	@RequestMapping("insert.cl")
	public String insertClass(PtClass pt, HttpSession session) {
		
		int result = cService.insertClass(pt);

		int userNo = pt.getUserNo();
		
		if(result > 0) {
			int statusUpdate = cService.updateStatus(userNo);
			session.setAttribute("alertMsg", "수업등록에 성공했습니다.");
			return "redirect:list.ur";
		}else {
			session.setAttribute("alertMsg", "수업등록에 실패했습니다. 다시 시도해주세요");
			return "redirect:list.ur";
		}
	}
	
	
	//예약확인 페이지로 이동
	@RequestMapping("bookList.cl")
	public String myBookedList() {
		return "class/classBookingList";
	}
	
	
	
	//예약조회
	@ResponseBody
	@RequestMapping(value="booking.cl", produces="application/json; charset=UTF-8")
	public String ajaxBoockingList(String empNo) {
		ArrayList<Booking> list = cService.selectBooking(empNo);
		return new Gson().toJson(list);
	}
	
	
	
	//내 회원 목록 조회
	@RequestMapping("userList.cl")
	public ModelAndView selectUserList(String empNo, ModelAndView mv) {
		
		//페이징처리 필요
		ArrayList<User> list = cService.selectUserList(empNo);
		
		if(!list.isEmpty()) {
			mv.addObject("list", list).setViewName("class/classList");
		}else {
			mv.addObject("alertMsg", "회원 조회에 실패했습니다.").setViewName("class/classList");
		}
		
		return mv;
	}
	
	
	
	//회원 클릭시 달력으로 이동 && 회원카드에 담을 정보 조회
	@RequestMapping("main.cl")
	public ModelAndView classMainView(int classNo, HttpSession session, ModelAndView mv) {
		
		session.setAttribute("classNo", classNo);
		
		PtClass c = cService.selectUserInfo(classNo);
		mv.addObject("classNo", classNo).addObject("c", c).setViewName("class/classMain");
		
		return mv;
	}

	
	
	//달력에 식단, 운동 내역 출력
	@ResponseBody
	@RequestMapping(value="select.cl", produces="application/json; charset=UTF-8")
	public String ajaxSelectClass(int classNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<Exercise> e = cService.selectExercise(classNo);
		ArrayList<Diet> d = cService.selectDiet(classNo);
		System.out.println(e);
		System.out.println(d);
		map.put("e", e);
		map.put("d", d);
		
		ArrayList<Exercise> all = cService.selectAll(classNo);
		map.put("all", all);
		System.out.println(all);
		
		ArrayList<Exercise> com = cService.selectCom(classNo);
		map.put("com", com);
		System.out.println(com);
		
		return new Gson().toJson(map);
	}
	
	
	
	//오늘의 운동으로 이동
	@RequestMapping("exercise.cl")
	public String exerciseView(int classNo, String exDate, HttpSession session) {
		session.setAttribute("classNo", classNo);
		session.setAttribute("exDate", exDate);
		return "class/exercise";
	}
	
	
	
	
	//선택 날짜 운동조회
	/**
	 * @param e : classNo, exDate
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="exList.cl", produces="application/json; charset=UTF-8")
	public String ajaxSelectExerciseList(Exercise e){
		
		ArrayList<Exercise> list = cService.selectExerciseList(e);
		return new Gson().toJson(list);
		
	}
	
	
	
	//운동 진행률을 위한 조회
	@ResponseBody
	@RequestMapping("progress.cl")
	public int ajaxSelectExAll(Exercise e) {
		
		int all = cService.selectExAll(e); //전체 갯수
		int complete = cService.selectComplete(e); //완료된 갯수
		
		double c = complete;
		int result = (int)Math.round((c / all) * 100); //int값으로 반환하기위함
		
		return result;
	}
	

	
	//글번호로 운동 조회 (수정폼에 뿌려줄 내용)
	@ResponseBody
	@RequestMapping(value="selectEx.cl", produces="application/json; charset=UTF-8")
	public String ajaxSelectEx(int exNo) {
		
		Exercise ex = cService.selectEx(exNo);
		return new Gson().toJson(ex);
	}
	
	
	//트레이너 피드백 등록
	@ResponseBody
	@RequestMapping("feedback.cl")
	public int ajaxUpdateFeedback(Exercise e) {
		int result = cService.updateFeedback(e);
		return result;
	}
	
	//피드백 조회
	@ResponseBody
	@RequestMapping(value="selectFeedback.cl", produces="application/json; charset=UTF-8")
	public String ajaxSelectFeedback(Exercise e) {
		Exercise ee = cService.selectFeedback(e);
		return new Gson().toJson(ee);
	}
	
	
	//운동 등록 (오늘)
	@ResponseBody
	@RequestMapping("insertEx.cl")
	public int ajaxInsertExercise(Exercise e) {
		int result = cService.insertExercise(e);
		return result;
	}
	
	
	//운동리스트 체크박스 상태 변경 (N -> Y)
	@ResponseBody
	@RequestMapping("checkEx.cl")
	public int ajaxUpdateCheck(Exercise e) {
		int result = cService.updateCheck(e);
		return result;
	}
	
	
	//운동 삭제
	@ResponseBody
	@RequestMapping("deleteEx.cl")
	public int ajaxDeleteExercise(Exercise e) {
		int result = cService.deleteExercise(e);
		return result;
	}
	
	
	//운동 수정
	@ResponseBody
	@RequestMapping("updateEx.cl")
	public int ajaxUpdateExercise(Exercise e) {
		int result = cService.updateExercise(e);
		return result;
	}
	

	
	
	/*
	 * //식단 페이지(달력)로 이동
	 * 
	 * @RequestMapping("diet.cl") public String dietListView(int classNo,
	 * HttpSession session) { session.setAttribute("classNo", classNo); return
	 * "class/dietList"; }
	 */
	
	
	
	//식단 페이지 상세로 이동
	/**
	 * @param di : classNo, dietDate
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("dietDetail.cl")
	public String selectDietDetail(Diet di, Model model, HttpSession session) {
		
		
		Diet diet = cService.selectDietDetail(di);
		
		//선택한 날짜와 클래스 번호로 조회해온 글이 null인 경우
		if(diet == null) {
			//session.setAttribute("alertMsg", "식단이 등록되지 않은 날짜입니다! 다시 선택해주세요.");
			model.addAttribute("d", di);
			return "class/dietDetailView";
		}else {
			model.addAttribute("d", diet);
			return "class/dietDetailView";
		}
		
	}
	
	
	//댓글 조회 (회원 : rlist.di)
	@ResponseBody
	@RequestMapping(value="relist.di", produces="application/json; charset=UTF-8")
	public String ajaxSelectReplyList(int no) {
		ArrayList<Reply> list = cService.selectReplyList(no);
		return new Gson().toJson(list);
	}
	
	
	//댓글 등록 (회원 : rinsert.di)
	@ResponseBody
	@RequestMapping("rinsert.di")
	public int ajaxInsertReply(Reply r) {
		System.out.println(r);
		
		int result = cService.insertReply(r);
		System.out.println(result);
		return result;
	}

	
	//댓글 수정 (직원 : update.re)
	@ResponseBody
	@RequestMapping("update.re")
	public String ajaxUpdateReply(Reply r) {
		int result = cService.updateReply(r);
		return result>0 ? "success" : "fail";
	}
	
	
	//댓글 삭제 (직원 : rdelete.di)
	@ResponseBody
	@RequestMapping("delete.di")
	public int ajaxDeleteReply(int replyNo) {
		int result  = cService.deleteReply(replyNo);
		return result;
	}
	
	
	
	
}