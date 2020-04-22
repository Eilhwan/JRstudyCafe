package com.jr.studycafe.dao;

import java.util.List;

import com.jr.studycafe.dto.AskBoard;

public interface AskBoardDao {
	public List<AskBoard> ask_boardList(AskBoard askboard);
	public int ask_boardcnt(AskBoard askboard);
	public int ask_write(AskBoard askboard);
	public int ask_hitUp(int ab_no);
	public AskBoard ask_contentboard(int ab_no);
	public AskBoard ask_modifyView_replyView(int ab_no);
	public int ask_boardmodify(AskBoard askboard);
	public int ask_boarddelete(int ab_no);
	public int ask_preReplyStepA(AskBoard askboard);
	public int ask_reWrite(AskBoard askboard);
}
