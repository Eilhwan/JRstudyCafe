package com.jr.studycafe.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jr.studycafe.dao.RecruitCommentsDao;
import com.jr.studycafe.dto.RecruitBoard;
import com.jr.studycafe.dto.RecruitComments;
import com.jr.studycafe.dto.Users;

@Service
public class RecruitCommentsServiceImpl implements RecruitCommentsService {
	@Autowired
	private RecruitCommentsDao rcdao;
	@Override
	public List<RecruitComments> list_rb_co(int rb_no) {
		
		return rcdao.list_rb_co(rb_no);
	}

	@Override
	public int write_rb_co(RecruitComments recruitComments, HttpSession session) {
		Users user = (Users) session.getAttribute("users");
		recruitComments.setU_id(user.getU_id());
		return rcdao.write_rb_co(recruitComments);
	}

	@Override
	public int modify_rb_co(RecruitComments recruitComments, HttpSession session) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete_rb_co(RecruitComments recruitComments) {
		return rcdao.delete_rb_co(recruitComments);
		
	}

	@Override
	public int cnt_rb_co(int rb_no) {
		return rcdao.cnt_rb_co(rb_no);
	}

}
