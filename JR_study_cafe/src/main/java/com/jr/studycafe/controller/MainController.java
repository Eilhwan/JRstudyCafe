package com.jr.studycafe.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jr.studycafe.dto.Users;
import com.jr.studycafe.service.MessangerService;

@Controller
public class MainController {
	@Autowired
	private MessangerService mService;
	@ModelAttribute
	public String messageCnt(HttpSession session, Model model) {
		if (session.getAttribute("users") != null) {
			Users user = (Users) session.getAttribute("users");
			String u_id = user.getU_id();			
			model.addAttribute("msgcnt", mService.unReadMsgCnt(u_id));
		}
		return "main/header";
	}
	
	@RequestMapping(value="main", method = RequestMethod.GET)
	public String main() {
		return "main/main";
	}
	@RequestMapping(value="logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:main.do";
	}
	@RequestMapping(value="introCafe", method = RequestMethod.GET)
	public String introCafe() {
		return "main/intro";
	}
	@RequestMapping(value="infoCafe", method = RequestMethod.GET)
	public String infCafe() {
		return "main/info";
	}
}