package com.jr.studycafe.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jr.studycafe.dao.AskBoardDao;
import com.jr.studycafe.dto.AskBoard;

@Service
public class AskBoardServiceImpl implements AskBoardService {
	@Autowired
	private AskBoardDao askboardDao;

	@Override
	public List<AskBoard> ask_boardList(AskBoard askboard) {
		return askboardDao.ask_boardList(askboard);
	}

	@Override
	public int ask_boardcnt(AskBoard askboard) {
		return askboardDao.ask_boardcnt(askboard);
	}

	@Override
	public int ask_write(AskBoard askboard) {
		return askboardDao.ask_write(askboard);
	}

	@Override
	public int ask_hitUp(int ab_no) {
		return askboardDao.ask_hitUp(ab_no);
	}

	@Override
	public AskBoard ask_contentboard(int ab_no) {
		askboardDao.ask_hitUp(ab_no);
		return askboardDao.ask_contentboard(ab_no);
	}

	@Override
	public AskBoard ask_modifyView_replyView(int ab_no) {
		return askboardDao.ask_modifyView_replyView(ab_no);
	}

	@Override
	public int ask_boardmodify(AskBoard askboard) {
		return askboardDao.ask_boardmodify(askboard);
	}

	@Override
	public int ask_boarddelete(int ab_no) {
		return askboardDao.ask_boarddelete(ab_no);
	}

	@Override
	public int ask_preReplyStepA(AskBoard askboard) {
		return askboardDao.ask_preReplyStepA(askboard);
	}

	@Override
	public int ask_reWrite(AskBoard askboard, HttpSession httpSession) {
		askboardDao.ask_preReplyStepA(askboard);
		return askboardDao.ask_reWrite(askboard);
	}
}
