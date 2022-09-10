package com.project.fitty.machine.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.fitty.common.model.vo.PageInfo;
import com.project.fitty.common.template.FileUpload;
import com.project.fitty.common.template.Pagination;
import com.project.fitty.machine.model.service.MachineService;
import com.project.fitty.machine.model.vo.Machine;

@Controller
public class MachineController {

	@Autowired
	private MachineService mService;

	@RequestMapping("list.mc")
	public String selectMachineList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model) {

		int listCount = mService.selectListCount();

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Machine> list = mService.selectList(pi);

		model.addAttribute("pi", pi);
		model.addAttribute("list", list);

		return "machine/machineList";
	}

	@RequestMapping("enrollForm.mc")
	public String selectEnrollForm() {

		return "machine/machineEnrollForm";
	}

	@RequestMapping("insert.mc")
	public String insertMachine(Machine m, MultipartFile upfile, HttpSession session) {

		// System.out.println(upfile); // 첨부파일을 선택했든 안했든 생성된 객체

		// 전달된 파일이 있을 경우 => 파일명 수정 작업 후 서버 업로드 => 원본명, 서버업로드된경로를 m에 이어서 담기
		if (!upfile.getOriginalFilename().equals("")) {

			// 서버에 업로드
			String originName = upfile.getOriginalFilename();

			String saveFilePath = FileUpload.saveFile(upfile, session, "resources/machine_images/");
			m.setMcImg(saveFilePath);

			int result = mService.insertMachine(m);

			if (result > 0) {

				session.setAttribute("alertMsg", "성공적으로 기구가 등록되었습니다.");
				return "redirect:list.mc";
			} else {

				session.setAttribute("errorMsg", "기구등록 실패");
				return "common/errorPage";
			}

		} else {
			session.setAttribute("alertMsg", "파일 등록은 필수사항입니다.");
			return "redirect:enrollForm.mc";
		}
	}

	@RequestMapping("delete.mc")
	public String deleteMachine(HttpServletRequest request, HttpSession session) {

		String[] arr = request.getParameterValues("ckMachine");
		int result = 0;

		for (int i = 0; i < arr.length; i++) {
			result += mService.deleteMachine(arr[i]);
		}

		if (result == arr.length) {
			session.setAttribute("alertMsg", "성공적으로 기구 삭제하였습니다.");
			return "redirect:list.mc";
		} else {
			session.setAttribute("errorMsg", "기구삭제 실패");
			return "common/errorPage";
		}
	}

	@RequestMapping("ckList.mc")
	public String selectCheckList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model) {

		int listCount = mService.selectCheckListCount();

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Machine> list = mService.selectCheckList(pi);

		model.addAttribute("pi", pi);
		model.addAttribute("list", list);

		return "machine/machineCheckList";
	}

	@RequestMapping("ckEnrollForm.mc")
	public String selectCkEnrollForm(Model model) {

		ArrayList<Machine> list = mService.selectAllMachine();

		model.addAttribute("list", list);

		return "machine/machineCheckEnrollForm";
	}

	@RequestMapping("ckInsert.mc")
	public String insertCheck(Machine m, @RequestParam(value = "empNo") String empNo, MultipartFile upfile,
			HttpSession session) {

		if (!upfile.getOriginalFilename().equals("")) {

			// 서버에 업로드

			String saveFilePath = FileUpload.saveFile(upfile, session, "resources/machine_ck_images/");
			m.setCkImg(saveFilePath);
			m.setCkWriter(empNo);

			int result = mService.insertCheck(m);

			if (result > 0) {

				session.setAttribute("alertMsg", "성공적으로 시설 점검이 등록되었습니다.");
				return "redirect:ckList.mc";
			} else {

				session.setAttribute("errorMsg", "시설 점검 등록 실패");
				return "common/errorPage";
			}

		} else {
			session.setAttribute("alertMsg", "파일 등록은 필수사항입니다.");
			return "redirect:ckEnrollForm.mc";
		}
	}

	@RequestMapping("ckDetail.mc")
	public ModelAndView selectCheck(int no, ModelAndView mv) {
		
		Machine m = mService.selectCheck(no);
		mv.addObject("m", m).setViewName("machine/machineCheckDetail");
		return mv;
	}
	
	@RequestMapping("broken.mc")
	public String updateMachineBroken(int ckNo, int mcNo, HttpSession session) {
		
		// 체크 상태 변경, 기구 고장 등록
		
		int result1 = mService.updateCheckState(ckNo);
		
		int result2 = mService.updateMachineBroken(mcNo);
		
		if(result1 * result2 > 0) {
			session.setAttribute("alertMsg", "성공적으로 기구 고장 등록하였습니다.");
			return "redirect:ckList.mc";
		}else {
			session.setAttribute("errorMsg", "기구 고장 등록 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("normal.mc")
	public String updateMachineNormal(int ckNo, HttpSession session) {
		
		// 체크 상태 변경
		
		int result = mService.updateCheckState(ckNo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 기구 정상 처리하였습니다.");
			return "redirect:ckList.mc";
		}else {
			session.setAttribute("errorMsg", "기구 정상 등록 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("ckDelete.mc")
	public String deleteCheck(int ckNo, HttpSession session) {
		
		int result = mService.deleteCheck(ckNo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 기구 점검 삭제하였습니다.");
			return "redirect:ckList.mc";
		}else {
			session.setAttribute("errorMsg", "기구 점검 삭제 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("bkList.mc")
	public String selectBrokenList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model) {
		
		int listCount = mService.selectBrokenListCount();

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Machine> list = mService.selectBrokenList(pi);

		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "machine/machineBrokenList";
	}
	
	@RequestMapping("repair.mc")
	public String repairMachine(HttpServletRequest request, HttpSession session) {

		String[] arr = request.getParameterValues("ckMachine");
		int result = 0;

		for (int i = 0; i < arr.length; i++) {
			result += mService.repairMachine(arr[i]);
		}

		if (result == arr.length) {
			session.setAttribute("alertMsg", "성공적으로 수리 완료하였습니다.");
			return "redirect:bkList.mc";
		} else {
			session.setAttribute("errorMsg", "수리 완료 실패");
			return "common/errorPage";
		}
	}
}
