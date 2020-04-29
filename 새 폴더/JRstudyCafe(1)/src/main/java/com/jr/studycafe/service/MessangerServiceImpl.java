package com.jr.studycafe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jr.studycafe.dao.MessangerDao;
import com.jr.studycafe.dao.UsersDao;
import com.jr.studycafe.dto.Messanger;

@Service
public class MessangerServiceImpl implements MessangerService {
	@Autowired
	private MessangerDao mdao;
	@Autowired
	private UsersDao udao;
	@Override
	public int messangerSend(Messanger messanger) {
		if (udao.u_idCofirm(messanger.getM_reciever()) == 1) {
			return mdao.messangerSend(messanger);			
		}else {
			return 0;
		}
	}

	@Override
	public List<Messanger> messangerList(Messanger messanger) {
		
		return mdao.messangerList(messanger);
	}

	@Override
	public int unReadMsgCnt(String u_id) {
		
		return mdao.unReadMsgCnt(u_id);
	}

	@Override
	public Messanger messageDetail(int m_no) {
		
		return mdao.messageDetail(m_no);
	}

	@Override
	public int deleteMessage(String[] checked) {
		int i = 0;
		for (i = 0; i < checked.length; i++) {
			mdao.deleteMessage(Integer.parseInt(checked[i]));
		}
		if (i == checked.length) {
			return 1;
		}
		return 0;
	}

	@Override
	public int readMessage(int m_no) {
		return mdao.readMessage(m_no);
	}

	@Override
	public int msgCnt(String u_id) {
		System.out.println("service" + u_id);
		return mdao.msgCnt(u_id);
	}

}
