package com.jr.studycafe.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jr.studycafe.dto.RecruitBoard;
import com.jr.studycafe.dto.Users;

@Repository
public class RecruitBoardDaoImpl implements RecruitBoardDao {
	@Autowired
	private SqlSessionTemplate template;

	@Override
	public List<RecruitBoard> list_rb(RecruitBoard recruitBoard) {
		return template.selectList("list_rb", recruitBoard);
	}

	@Override
	public RecruitBoard detail_rb(int rb_no) {
		return template.selectOne("detail_rb", rb_no);
	}

	@Override
	public List<RecruitBoard> search_rb(RecruitBoard recruitBoard) {
		return template.selectList("search_rb", recruitBoard);
	}

	@Override
	public int modify_rb(RecruitBoard recruitBoard) {
		return template.update("modify_rb", recruitBoard);
	}

	@Override
	public int delete_rb(int rb_no) {
		return template.update("delete_rb", rb_no);
	}

	@Override
	public int hit_rb(int rb_no) {
		// TODO Auto-generated method stub
		return template.update("hit_rb", rb_no);
	}

	@Override
	public int cnt_rb(RecruitBoard recruitBoard) {
		return template.selectOne("cnt_rb", recruitBoard);
	}

	@Override
	public int write_rb(RecruitBoard recruitBoard) {
		return template.insert("write_rb", recruitBoard);
	}

	@Override
	public List<RecruitBoard> user_rb_post(Users users) {
		return template.selectList("user_rb_post", users);
	}
	

}
