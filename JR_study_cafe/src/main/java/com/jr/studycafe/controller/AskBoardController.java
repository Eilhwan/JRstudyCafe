package com.jr.studycafe.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jr.studycafe.dto.AskBoard;
import com.jr.studycafe.service.AskBoardService;
import com.jr.studycafe.util.Paging;

@Controller
public class AskBoardController {
	@Autowired
	private AskBoardService askBoardService;
	
	@RequestMapping(value="askListView")
	public String askboardList(Model model, AskBoard askboard, String pageNum) {
		    int pageSize = 10;
	        int blockSize = 10;
	        Paging paging = new Paging(askBoardService.ask_boardcnt(askboard), pageNum, pageSize, blockSize);
			askboard.setStartRow(paging.getStartRow());
			askboard.setEndRow(paging.getEndRow());
			model.addAttribute("askList", askBoardService.ask_boardList(askboard));
			model.addAttribute("paging", paging);
		return "ask/ask_list";
	}
	@RequestMapping(value="askWriteView")
	public String askWriteView(Model model, String u_id, String u_name, String pageNum) {
		model.addAttribute("u_id", u_id);
		model.addAttribute("u_name", u_name);
		return "ask/ask_write_view";
	}
	@RequestMapping(value="askWrite", method= {RequestMethod.GET, RequestMethod.POST} )
	public String write(AskBoard askboard, Model model, String u_id, String u_name) {
		model.addAttribute("ask_write", askBoardService.ask_write(askboard));
		model.addAttribute("u_id", u_id);
		model.addAttribute("u_name", u_name);
		return "redirect:askListView.do";
	}
	@RequestMapping(value="askContent", method = RequestMethod.GET )
	public String detail(int ab_no, Model model, String pageNum) {
		model.addAttribute("content", askBoardService.ask_contentboard(ab_no));
		return "ask/ask_content_view";
	}
	@RequestMapping(value="askModifyView", method = RequestMethod.GET)
	public String ModifyView(int ab_no, Model model, String u_id, String u_name, String ab_name, String ab_content, String pageNum) {
		model.addAttribute("modify", askBoardService.ask_contentboard(ab_no));
		model.addAttribute("u_id", u_id);
		model.addAttribute("u_name", u_name);
		model.addAttribute("ab_name", ab_name);
		model.addAttribute("ab_content", ab_content);
		return "ask/ask_modify_view";
	}
	@RequestMapping(value="askModify", method= RequestMethod.POST )
	public String modify(AskBoard askboard, Model model, String u_id, String u_name, HttpSession httpSession) {
		model.addAttribute("ask_modify", askBoardService.ask_boardmodify(askboard, httpSession));
		model.addAttribute("u_id", u_id);
		model.addAttribute("u_name", u_name);
		return "forward:askListView.do";
    }
	@RequestMapping(value="askReplyView")
	public String askReplyView(AskBoard askboard, Model model, String a_id, String a_name, String ab_no, String ab_name, int ab_group, int ab_step, int ab_indent) {
		model.addAttribute("a_id", a_id);
		model.addAttribute("a_name", a_name);
		model.addAttribute("ab_name", ab_name);
		model.addAttribute("ab_group", ab_group);
		model.addAttribute("ab_step", ab_step);
		model.addAttribute("ab_indent", ab_indent);
		model.addAttribute("ask_preReplyStepA", askBoardService.ask_preReplyStepA(askboard));
		return "ask/ask_reply_view";
	}
	@RequestMapping(value="askReply", method=RequestMethod.POST)
	public String askReply(AskBoard askboard, Model model, String a_id, String a_name) {
		
		model.addAttribute("reply", askBoardService.ask_reWrite(askboard));
		model.addAttribute("a_id", a_id);
		model.addAttribute("a_name", a_name);
		return "redirect:askListView.do";
	}
	@RequestMapping(value="askDelete")
	public String askDelete(int ab_no, Model model) {
		model.addAttribute("askDelete", askBoardService.ask_boarddelete(ab_no));
		return "redirect:askListView.do";
	}
}
