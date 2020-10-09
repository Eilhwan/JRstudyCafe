package com.jr.studycafe.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jr.studycafe.dto.Studygroup;
import com.jr.studycafe.dto.Studymember;


@Repository
public class StudygroupDaoImpl implements StudygroupDao {
	@Autowired
	private SqlSessionTemplate template;
	
	@Override
	public int studygroupOpen(Studygroup studyGroup) {
		return template.insert("studygroup_open", studyGroup);
	}

	@Override
	public List<Studygroup> user_studygroup_list(String u_id) {
		return template.selectList("user_studygroup_list", u_id);
	}

	@Override
	public List<Studygroup> leader_studygroup_list(String u_id) {
		return template.selectList("leader_studygroup_list", u_id);
	}

	@Override
	public int studygroup_invite(Studymember studymember) {
		return template.insert("studygroup_invite", studymember);
	}

	@Override
	public int dropout_member(String u_id) {
		return template.delete("dropout_member", u_id);
	}

	@Override
	public Studygroup studygroup_view(int sg_no) {
		return template.selectOne("studygroup_view", sg_no);
	}

	@Override
	public int studymember_cnt(int sg_no) {
		return template.selectOne("studymember_cnt", sg_no);
	}

	@Override
	public List<Studymember> studymember_list(int sg_no) {
		return template.selectList("studymember_list", sg_no);
	}

	@Override
	public Studymember studymember_view(Studymember studyMember) {
		return template.selectOne("studymember_view", studyMember);
	}

	@Override
	public Studygroup findWithsgname(String sg_name) {
		return template.selectOne("findWithsgname", sg_name);
	}

}
