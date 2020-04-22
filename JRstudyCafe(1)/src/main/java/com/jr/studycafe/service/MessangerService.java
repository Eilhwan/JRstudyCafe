package com.jr.studycafe.service;

import java.util.List;

import com.jr.studycafe.dto.Messanger;

public interface MessangerService {
	public int messangerSend(Messanger messanger);
	public List<Messanger> messangerList(Messanger messanger);
	public int unReadMsgCnt(String u_id);
	public int msgCnt(String u_id);
	public Messanger messageDetail(int m_no);
	public int deleteMessage(String[] checked);
	public int readMessage(int m_no);
	
}
