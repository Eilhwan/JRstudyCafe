package com.jr.studycafe.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jr.studycafe.dto.Studygroup;
import com.jr.studycafe.dto.Studymember;

public interface StudygroupService {
	public int studygroupOpen(Studygroup studyGroup, MultipartHttpServletRequest mRequest);
	public List<Studygroup> user_studygroup_list(HttpSession session);
	public List<Studygroup> leader_studygroup_list(HttpSession session);
	public int studymember_cnt(int sg_no);
	public Studygroup studygroup_view(int sg_no);
	public int studygroup_invite(Studymember studymember);
	public int dropout_member(String u_id);
	public List<Studymember>studymember_list(int sg_no);
	public Studymember studymember_view(Studymember studyMember, HttpSession session);
	public Studygroup findWithsgname(String sg_name);
}
