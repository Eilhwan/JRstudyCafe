package com.jr.studycafe.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jr.studycafe.dto.Studygroup;
import com.jr.studycafe.dto.Users;
import com.jr.studycafe.service.MessangerService;
import com.jr.studycafe.service.StudygroupService;

@Controller
public class StudygroupController {
	@Autowired
	private MessangerService mService;
	@Autowired
	private StudygroupService sgService;
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
	public String studygroupPage() {
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
	@RequestMapping(value="studygroupOpen", method = RequestMethod.GET)
	public String studygroupOpen(Studygroup studygroup, HttpSession session) {
		Users users = (Users) session.getAttribute("users");
		studygroup.setU_id(users.getU_id());
		sgService.studygroupOpen(studygroup);
		return "studygroup/studygroup_form";
	}
	
}
