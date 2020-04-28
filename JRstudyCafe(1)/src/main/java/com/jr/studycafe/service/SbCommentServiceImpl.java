package com.jr.studycafe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jr.studycafe.dao.SbCommentDao;
import com.jr.studycafe.dto.SbComment;

@Service
public class SbCommentServiceImpl implements SbCommentService{
	@Autowired
	private SbCommentDao scDao;
	
	@Override
	public List<SbComment> list_sc(SbComment sc) {
		return scDao.list_sc(sc);
	}

	@Override
	public SbComment get_sc(int sb_no) {
		return scDao.get_sc(sb_no);
	}

	@Override
	public int cnt_sc(int sb_no) {
		return scDao.cnt_sc(sb_no);
	}

	@Override
	public int modify_sc(SbComment sc) {
		return scDao.modify_sc(sc);
	}

	@Override
	public int delete_sc(int sc_no) {
		return scDao.delete_sc(sc_no);
	}

	@Override
	public List<SbComment> detail_sc(int sb_no) {
		return scDao.detail_sc(sb_no);
	}

}
