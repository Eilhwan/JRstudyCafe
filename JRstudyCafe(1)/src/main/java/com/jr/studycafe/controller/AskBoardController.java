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
	public String detail(int ab_no, Model model, String pageNum, String u_name, String writer) {
		model.addAttribute("content", askBoardService.ask_contentboard(ab_no));
		model.addAttribute("u_name", u_name);
		model.addAttribute("writer", writer);
		return "ask/ask_content_view";
	}
	@RequestMapping(value="askModifyView")
	public String ModifyView(AskBoard askboard, Model model) {
		askboard = askBoardService.ask_contentboard(askboard.getAb_no());
		model.addAttribute("ask_modify", askboard);
		return "ask/ask_modify_view";
	}
	@RequestMapping(value="askModify", method= RequestMethod.POST )
	public String modify(AskBoard askboard, Model model) {
		int result = askBoardService.ask_boardmodify(askboard);
		if(result==1) {
			model.addAttribute("askModifyResult", "글수정 성공");
			return "forward:askListView.do";
		}else {
			model.addAttribute("askModifyResult", "글수정 실패");
			return "foward:askListView.do";
		}
	}
	@RequestMapping(value="askReplyView", method = RequestMethod.GET)
	public String askReplyView(AskBoard askboard, Model model,int ab_no, String a_id, String a_name) {
		model.addAttribute("ask_modifyView_replyView", askBoardService.ask_modifyView_replyView(ab_no));
		model.addAttribute("a_id", a_id);
		model.addAttribute("a_name", a_name);
		return "ask/ask_reply_view";
		/*model.addAttribute("ask_preReplyStepA", askBoardService.ask_preReplyStepA(askboard));*/
	}
	@RequestMapping(value="askReply", method=RequestMethod.POST)
	public String askReply(AskBoard askboard, Model model, HttpSession httpSession, int ab_group, int ab_step, int ab_indent, String u_id, String a_id, String a_name) {
		model.addAttribute("a_id", a_id);
		model.addAttribute("a_name", a_name);
		int result = askBoardService.ask_reWrite(askboard, httpSession);
		if(result==1) {
			model.addAttribute("askWriteResult", "답변쓰기 성공");
			return "forward:askListView.do";
		}else {
			model.addAttribute("askWriteResult", "답변쓰기 실패");
			return "forward:askListView.do";
		}
	}
		/*model.addAttribute("reply", askBoardService.ask_reWrite(askboard));
		model.addAttribute("a_id", a_id);
		model.addAttribute("a_name", a_name);
		model.addAttribute("u_name", u_name);
		return "forward:askListView.do";*/
	@RequestMapping(value="askDelete")
	public String askDelete(int ab_no, Model model) {
		model.addAttribute("askDelete", askBoardService.ask_boarddelete(ab_no));
		return "redirect:askListView.do";
	}
}
