package com.jr.studycafe.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jr.studycafe.dto.Messanger;

@Repository
public class MessangerDaoImpl implements MessangerDao {
	@Autowired
	private SqlSessionTemplate template;
	@Override
	public int messangerSend(Messanger messanger) {
		return template.insert("messangerSend", messanger);
	}
	@Override
	public List<Messanger> messangerList(Messanger messanger) {
		return template.selectList("messangerList", messanger);
	}
	@Override
	public int unReadMsgCnt(String u_id) {
		return template.selectOne("unReadMsgCnt", u_id);
	}
	@Override
	public int msgCnt(String u_id) {
		return template.selectOne("msgCnt", u_id);
	}
	@Override
	public Messanger messageDetail(int m_no) {
		return template.selectOne("messageDetail", m_no);
	}
	@Override
	public int deleteMessage(int m_no) {
		return template.delete("deleteMessage", m_no);
	}
	@Override
	public int readMessage(int m_no) {
		return template.update("readMessage", m_no);
	}

}
