package com.jr.studycafe.dao;

import java.util.List;

import com.jr.studycafe.dto.RecruitBoard;
import com.jr.studycafe.dto.RecruitComments;

public interface RecruitCommentsDao {
	public List<RecruitComments> list_rb_co(int rb_no);
	public int write_rb_co(RecruitComments recruitComments);
	public int modify_rb_co(RecruitComments recruitComments);
	public int delete_rb_co(RecruitComments recruitComments);
	public int cnt_rb_co(int rb_no);
	
}
