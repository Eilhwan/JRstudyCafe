package com.jr.studycafe.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.jr.studycafe.dto.AskBoard;

public interface AskBoardService {
	public List<AskBoard> ask_boardList(AskBoard askboard);
	public int ask_boardcnt(AskBoard askboard);
	public int ask_write(AskBoard askboard);
	public int ask_hitUp(int ab_no);
	public AskBoard ask_contentboard(int ab_no);
	public AskBoard ask_modifyView_replyView(int ab_no);
	public int ask_boardmodify(AskBoard askboard);
	public int ask_boarddelete(int ab_no);
	public int ask_preReplyStepA(AskBoard askboard);
	public int ask_reWrite(AskBoard askboard, HttpSession httpSession);
}
