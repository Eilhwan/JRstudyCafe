package com.jr.studycafe.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jr.studycafe.dto.ReviewComent;
@Repository
public class ReviewComentDaoImpl implements ReviewComentDao {
	@Autowired
	private SqlSessionTemplate sqlTemplate;
	@Override
	public List<ReviewComent> rvcoment_list(ReviewComent reviewComent) {
		return sqlTemplate.selectList("rvcoment_list", reviewComent);
	}

	@Override
	public int rvcoment_write(ReviewComent reviewComent) {
		
		return sqlTemplate.insert("rvcoment_write", reviewComent);
	}

	@Override
	public int rvcoment_modify(ReviewComent reviewComent) {
		
		return sqlTemplate.update("rvcoment_modify", reviewComent);
	}

	@Override
	public int rvcoment_delete(int c_no) {
		
		return sqlTemplate.update("rvcoment_delete", c_no);
	}

	@Override
	public int rvcoment_cnt(int rv_no) {
		
		return sqlTemplate.selectOne("rvcoment_cnt", rv_no);
	}

}
