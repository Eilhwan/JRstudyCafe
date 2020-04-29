package com.jr.studycafe.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	@RequestMapping(value="main", method = RequestMethod.GET)
	public String main() {
		return "main/main";
	}
	@RequestMapping(value="logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:main.do";
	}
	@RequestMapping(value="profile", method = RequestMethod.GET)
	public String profile(HttpSession session) {
		session.invalidate();
		return "member/profile";
	}
	@RequestMapping(value="board")
	public String board() {
		return "board/board";
	}
}