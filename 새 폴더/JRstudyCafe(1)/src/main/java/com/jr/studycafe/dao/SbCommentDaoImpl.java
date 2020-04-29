package com.jr.studycafe.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jr.studycafe.dto.SbComment;

@Repository
public class SbCommentDaoImpl implements SbCommentDao{
	@Autowired
	private SqlSessionTemplate template;
	@Override
	public List<SbComment> list_sc(SbComment sc) {
		return template.selectList("list_sc", sc);
	}

	@Override
	public SbComment get_sc(int sb_no) {
		return template.selectOne("get_sc", sb_no);
	}

	@Override
	public int cnt_sc(int sb_no) {
		return template.selectOne("cnt_sc", sb_no);
	}

	@Override
	public int modify_sc(SbComment sc) {
		return template.update("modify_sc", sc);
	}

	@Override
	public int delete_sc(int sc_no) {
		return template.update("delete_sc", sc_no);
	}

	@Override
	public List<SbComment> detail_sc(int sb_no) {
		return template.selectList("detail_sc", sb_no);
	}

	@Override
	public int write_sc(SbComment sc) {
		return template.insert("write_sc", sc);
	}

}
