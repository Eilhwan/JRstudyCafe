package com.jr.studycafe.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jr.studycafe.dto.SbComment;
import com.jr.studycafe.dto.StudyBoard;
import com.jr.studycafe.dto.Studygroup;
import com.jr.studycafe.dto.Studymember;
import com.jr.studycafe.dto.Users;
import com.jr.studycafe.service.MessangerService;
import com.jr.studycafe.service.SbCommentService;
import com.jr.studycafe.service.StudyBoardService;
import com.jr.studycafe.service.StudygroupService;

@Controller
public class StudygroupController {
	@Autowired
	private MessangerService mService;
	@Autowired
	private StudygroupService sgService;
	@Autowired
	private StudyBoardService sbService;
	@Autowired
	private SbCommentService scService;
	@ModelAttribute
	public String messageCnt(HttpSession session, Model model) {
		if (session.getAttribute("users") != null) {
			Users user = (Users) session.getAttribute("users");
			String u_id = user.getU_id();			
			model.addAttribute("msgcnt", mService.unReadMsgCnt(u_id));
		}
		return "main/header";
	}
	
	@RequestMapping(value="studygroupPage", method = RequestMethod.GET)
	public String studygroupPage(HttpSession session, Model model) {
		if (session.getAttribute("users") == null) {
			model.addAttribute("resultmsg", "로그인 후에 이용하세요.");
		}else {
			model.addAttribute("l_studygroups", sgService.leader_studygroup_list(session));			
			model.addAttribute("u_studygroups", sgService.user_studygroup_list(session));			
		}
		return "studygroup/studygroup_page";
		
	}
	@RequestMapping(value="studygroupCondition", method = RequestMethod.GET)
	public String studygroupCondition() {
		return "studygroup/studygroup_condition";
				
	}
	@RequestMapping(value="studygroupForm", method = RequestMethod.GET)
	public String studygroupForm() {
		return "studygroup/studygroup_form";
		
	}
	@RequestMapping(value="studygroupView", method = RequestMethod.GET)
	public String studygroupView(int sg_no, Model model) {
		StudyBoard sb = new StudyBoard();
		SbComment sc = new SbComment();
		
		sb.setSg_no(sg_no);
		sb.setStartRow(1);
		sb.setEndRow(3);

		sc.setSg_no(sg_no);
		
		model.addAttribute("sg", sgService.studygroup_view(sg_no));
		model.addAttribute("sm_cnt", sgService.studymember_cnt(sg_no));
		model.addAttribute("notice", sbService.notice_sb(sb));
		model.addAttribute("list", sbService.list_sb(sb));
		model.addAttribute("comments", scService.list_sc(sc));

		return "studygroup/studygroup_view";
		
	}
	@RequestMapping(value="studyNotice", method = RequestMethod.GET)
	public String studyNotice(StudyBoard studyBoard, Model model) {
		model.addAttribute("notices", sbService.notice_sb(studyBoard));
		return "studygroup/studygroup_notice";
	}
	@RequestMapping(value="studyNoticeDetail", method = RequestMethod.GET)
	public String studyNoticeDetail(int sb_no, Model model) {
		sbService.hitup_sb(sb_no);
		model.addAttribute("notice", sbService.detail_sb(sb_no));
		model.addAttribute("comments", scService.detail_sc(sb_no));
		System.out.println(sbService.detail_sb(sb_no));
		return "studygroup/study_notice";
	}
	@RequestMapping(value="studyIntro", method = RequestMethod.GET)
	public String studyIntro(int sg_no, Model model) {
		model.addAttribute("sg", sgService.studygroup_view(sg_no));
		return "studygroup/studygroup_intro";
	}
	
	@RequestMapping(value="sbList", method = RequestMethod.GET)
	public String sbList(String pageNum, int sg_no, Model model) {
		int page = Integer.parseInt(pageNum);		
		StudyBoard sb = new StudyBoard();
		sb.setStartRow(page * 3 - 2);
		sb.setEndRow(page * 3);
		sb.setSg_no(sg_no);
		model.addAttribute("list", sbService.list_sb(sb));
		return "studygroup/study_list";
		
	}
	
	@RequestMapping(value="scList", method = RequestMethod.GET)
	public String scList(String pageNum, int sb_no, Model model) {
		int page = Integer.parseInt(pageNum);		
		SbComment sc = new SbComment();
		sc.setStartRow(page * 3 - 2);
		sc.setEndRow(page * 3);
		sc.setSb_no(sb_no);
		model.addAttribute("list", scService.list_sc(sc));
		return "studygroup/study_list";
		
	}
	
	
	@RequestMapping(value="studygroupOpen", method = RequestMethod.POST)
	public String studygroupOpen(Studygroup studygroup, HttpSession session, MultipartHttpServletRequest mRequest) {
		Users users = (Users) session.getAttribute("users");
		studygroup.setU_id(users.getU_id());
		Studymember member = new Studymember();
		member.setSg_name(studygroup.getSg_name());
		member.setU_id(users.getU_id());
		member.setSm_status(5);
		System.out.println(member);
		sgService.studygroupOpen(studygroup, mRequest);
		sgService.studygroup_invite(member);
		return "studygroup/studygroup_form";
	}
	
}
