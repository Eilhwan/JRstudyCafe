package com.jr.studycafe.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jr.studycafe.dto.RecruitBoard;
import com.jr.studycafe.dto.RecruitComments;
import com.jr.studycafe.dto.Users;
import com.jr.studycafe.service.MessangerService;
import com.jr.studycafe.service.RecruitBoardService;
import com.jr.studycafe.service.RecruitCommentsService;
import com.jr.studycafe.util.Paging;

@Controller
public class BoardController {
	
	@Autowired
	private MessangerService mService;
	@Autowired
	private RecruitBoardService rbService;
	@Autowired
	private RecruitCommentsService rcService;

	@ModelAttribute
	public String messageCnt(HttpSession session, Model model) {
		if (session.getAttribute("users") != null) {
			Users user = (Users) session.getAttribute("users");
			String u_id = user.getU_id();			
			model.addAttribute("msgcnt", mService.unReadMsgCnt(u_id));
		}
		return "main/header";
	}
	
	@RequestMapping(value="recruitBoard", method = RequestMethod.GET)
	public String recruitBoard(RecruitBoard recruitBoard, String pageNum, Model model) {
		int blockSize = 10;
		int pageSize = 10;
		if (pageNum == null) {
			pageNum = "1";
		}
		Paging paging = new Paging(rbService.cnt_rb(recruitBoard), pageNum, pageSize, blockSize);
		recruitBoard.setStartRow(paging.getStartRow());
		recruitBoard.setEndRow(paging.getEndRow());
		model.addAttribute("recruitboards", rbService.list_rb(recruitBoard));
		model.addAttribute("paging", paging);
		return "board/recruit_board";
	}
	@RequestMapping(value="rbSearch", method = RequestMethod.GET)
	public String rbSearch(RecruitBoard recruitBoard, String pageNum, Model model) {
		int blockSize = 10;
		int pageSize = 10;
		if (pageNum == null) {
			pageNum = "1";
		}
		Paging paging = new Paging(rbService.cnt_rb(recruitBoard), pageNum, pageSize, blockSize);
		recruitBoard.setStartRow(paging.getStartRow());
		recruitBoard.setEndRow(paging.getEndRow());
		model.addAttribute("recruitboards", rbService.search_rb(recruitBoard));
		model.addAttribute("paging", paging);
		return "board/search_result";
	}
	@RequestMapping(value="rbWriteView", method = RequestMethod.GET)
	public String rbWriteView() {
		return "board/recruit_write_view";
	}
	@RequestMapping(value="rbWrite", method = RequestMethod.POST)
	public String rbWrite(RecruitBoard recruitBoard, MultipartHttpServletRequest mRequest, HttpSession session) {
		Users users = (Users) session.getAttribute("users");
		recruitBoard.setU_id(users.getU_id());
		rbService.write_rb(mRequest, recruitBoard);
		return "redirect:recruitBoard.do";
	}
	@RequestMapping(value="rbDetail", method = {RequestMethod.POST, RequestMethod.GET})
	public String rbDetail(int rb_no, Model model) {
		model.addAttribute("rb", rbService.detail_rb(rb_no));
		model.addAttribute("rcs", rcService.list_rb_co(rb_no));
		model.addAttribute("cnt_rc", rcService.cnt_rb_co(rb_no));
		
		return "board/recruit_detail";
	}
	@RequestMapping(value="rbModifyView", method = {RequestMethod.POST, RequestMethod.GET})
	public String rbModifyView(int rb_no, Model model) {
		model.addAttribute("rb", rbService.detail_rb(rb_no));
		
		return "board/recruit_modify";
	}
	@RequestMapping(value="rbModify", method = RequestMethod.POST)
	public String rbModify(RecruitBoard recruitBoard, MultipartHttpServletRequest mRequest, HttpSession session, Model model) {
		Users users = (Users) session.getAttribute("users");
		recruitBoard.setU_id(users.getU_id());
		rbService.modify_rb(mRequest, recruitBoard, model);
		return "redirect:recruitBoard.do";
	}
	@RequestMapping(value="rbDelete.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String rbDelete(int rb_no, Model model) {
		rbService.delete_rb(rb_no);
		return "redirect:recruitBoard.do";
	}
	
	//댓글 작성
	@RequestMapping(value="rcWrite", method = {RequestMethod.POST, RequestMethod.GET})
	public String rcWrite(RecruitComments recruitComments, HttpSession session, Model model) {
		
		rcService.write_rb_co(recruitComments, session);
		model.addAttribute("rb_no", recruitComments.getRb_no());
		return "redirect:rbDetail.do";
	}
	@RequestMapping(value="rcDelete", method = {RequestMethod.POST, RequestMethod.GET})
	public String rcDelete(RecruitComments recruitComments, int rb_no, Model model) {
		
		rcService.delete_rb_co(recruitComments);
		model.addAttribute("rb_no", rb_no);
		System.out.println(recruitComments.getRb_no());
		
		return "redirect:rbDetail.do";
	}
	
}
