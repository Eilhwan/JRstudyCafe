package com.jr.studycafe.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jr.studycafe.dao.StudygroupDao;
import com.jr.studycafe.dto.Studygroup;

@Service
public class StudygroupServiceImpl implements StudygroupService {
	@Autowired
	private StudygroupDao sdao;
	

	@Override
	public int studygroupOpen(Studygroup studygroup) {
		return sdao.studygroupOpen(studygroup);
	}

}
