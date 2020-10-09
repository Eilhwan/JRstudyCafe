package com.jr.studycafe.dao;

import java.util.List;

import com.jr.studycafe.dto.Studygroup;
import com.jr.studycafe.dto.Studymember;

public interface StudygroupDao {
	public int studygroupOpen(Studygroup studyGroup);
	public List<Studygroup> user_studygroup_list(String u_id);
	public List<Studygroup> leader_studygroup_list(String u_id);
	public Studygroup studygroup_view(int sg_no);
	public int studymember_cnt(int sg_no);
	public int studygroup_invite(Studymember studymember);
	public int dropout_member(String u_id);
	public List<Studymember> studymember_list(int sg_no);
	public Studymember studymember_view(Studymember studyMember);
	public Studygroup findWithsgname(String sg_name);
}
