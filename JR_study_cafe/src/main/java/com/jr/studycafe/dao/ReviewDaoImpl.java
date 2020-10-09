package com.jr.studycafe.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jr.studycafe.dto.Review;
@Repository
public class ReviewDaoImpl implements ReviewDao {
	@Autowired
	private SqlSessionTemplate sqlTemplate;
	@Override
	public List<Review> review_list(Review review) {
		return sqlTemplate.selectList("review_list", review);
	}

	@Override
	public int review_cnt(Review review) {
		
		return sqlTemplate.selectOne("review_cnt", review);
	}

	@Override
	public int review_write(Review review) {
		
		return sqlTemplate.insert("review_write", review);
	}

	@Override
	public int review_hitup(int rv_no) {
		
		return sqlTemplate.update("review_hitup", rv_no);
	}

	@Override
	public int review_modify(Review review) {
		
		return sqlTemplate.update("review_modify", review);
	}

	@Override
	public Review review_detail(int rv_no) {
		
		return sqlTemplate.selectOne("review_detail", rv_no);
	}

	@Override
	public int review_delete(int rv_no) {
		
		return sqlTemplate.update("review_delete", rv_no);
	}
	
	@Override
	public int rvlike_Insert(Review review) {
		return sqlTemplate.insert("rvlike_Insert", review);
	}

	@Override
	public int rvlike_Delete(int likeno) {
		return sqlTemplate.delete("rvlike_Delete", likeno);
	}
	@Override
	public Review rvlike_Chk(Review review) {
		
		return sqlTemplate.selectOne("rvlike_Chk", review);
	}
}
