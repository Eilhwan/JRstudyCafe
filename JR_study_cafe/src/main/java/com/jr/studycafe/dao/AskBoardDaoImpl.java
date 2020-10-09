package com.jr.studycafe.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jr.studycafe.dto.AskBoard;
@Repository
public class AskBoardDaoImpl implements AskBoardDao {
	@Autowired
	private SqlSessionTemplate template;

	@Override
	public List<AskBoard> ask_boardList(AskBoard askboard) {
		return template.selectList("ask_boardList", askboard);
	}

	@Override
	public int ask_boardcnt(AskBoard askboard) {
		return template.selectOne("ask_boardcnt",askboard);
	}

	@Override
	public int ask_write(AskBoard askboard) {
		return template.insert("ask_write", askboard);
	}

	@Override
	public int ask_hitUp(int ab_no) {
		return template.update("ask_hitUp", ab_no);
	}

	@Override
	public AskBoard ask_contentboard(int ab_no) {
		return template.selectOne("ask_contentboard", ab_no);
	}

	@Override
	public AskBoard ask_modifyView_replyView(int ab_no) {
		return template.selectOne("ask_modifyView_replyView", ab_no);
	}

	@Override
	public int ask_boardmodify(AskBoard askboard) {
		return template.update("ask_boardmodify", askboard);
	}

	@Override
	public int ask_boarddelete(int ab_no) {
		return template.delete("ask_boarddelete", ab_no);
	}

	

	@Override
	public int ask_reWrite(AskBoard askboard) {
		return template.insert("ask_reWrite", askboard );
	}

	@Override
	public int ask_preReplyStepA(AskBoard askboard) {
		return template.update("ask_preReplyStepA",askboard);
	}

}
