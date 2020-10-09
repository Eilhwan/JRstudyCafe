package com.jr.studycafe.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.jr.studycafe.dto.RecruitBoard;
import com.jr.studycafe.dto.RecruitComments;

public interface RecruitCommentsService {
	public List<RecruitComments> list_rb_co(int rb_no);
	public int write_rb_co(RecruitComments recruitComments, HttpSession session);
	public int modify_rb_co(RecruitComments recruitComments, HttpSession session);
	public int delete_rb_co(RecruitComments recruitComments);
	public int cnt_rb_co(int rb_no);
}
