package com.jr.studycafe.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jr.studycafe.dto.RecruitBoard;
import com.jr.studycafe.dto.RecruitComments;

@Repository
public class RecruitCommentsDaoImpl implements RecruitCommentsDao {
	@Autowired
	private SqlSessionTemplate template;
	
	@Override
	public List<RecruitComments> list_rb_co(int rb_no) {
	
		return template.selectList("list_rb_co", rb_no);
	}

	@Override
	public int write_rb_co(RecruitComments recruitComments) {

		return template.insert("write_rb_co", recruitComments);
	}

	@Override
	public int modify_rb_co(RecruitComments recruitComments) {
		return template.update("modify_rb_co", recruitComments);
	}

	@Override
	public int delete_rb_co(RecruitComments recruitComments) {
		return template.update("delete_rb_co", recruitComments);
	}

	@Override
	public int cnt_rb_co(int rb_no) {
		return template.selectOne("cnt_rb_co", rb_no);
	}

}
