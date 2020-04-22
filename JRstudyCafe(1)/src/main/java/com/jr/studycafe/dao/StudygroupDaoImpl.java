package com.jr.studycafe.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jr.studycafe.dto.Studygroup;


@Repository
public class StudygroupDaoImpl implements StudygroupDao {
	@Autowired
	private SqlSessionTemplate template;
	
	@Override
	public int studygroupOpen(Studygroup studyGroup) {
		return template.insert("studygroup_open", studyGroup);
	}

}
