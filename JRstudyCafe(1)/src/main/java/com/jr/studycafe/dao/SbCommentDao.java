package com.jr.studycafe.dao;

import java.util.List;

import com.jr.studycafe.dto.SbComment;

public interface SbCommentDao {
	public List<SbComment> list_sc(SbComment sc);
	public List<SbComment> detail_sc(int sb_no);
	public SbComment get_sc(int sb_no);
	public int cnt_sc(int sb_no);
	public int modify_sc(SbComment sc);
	public int delete_sc(int sc_no);
	public int write_sc(SbComment sc);
	
}
