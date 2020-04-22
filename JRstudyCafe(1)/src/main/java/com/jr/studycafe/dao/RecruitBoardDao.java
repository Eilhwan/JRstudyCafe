package com.jr.studycafe.dao;

import java.util.List;

import com.jr.studycafe.dto.RecruitBoard;

public interface RecruitBoardDao {
	public List<RecruitBoard> list_rb(RecruitBoard recruitBoard);
	public RecruitBoard detail_rb(int rb_no);
	public List<RecruitBoard> search_rb(RecruitBoard recruitBoard);
	public int modify_rb(RecruitBoard recruitBoard);
	public int delete_rb(int rb_no);
	public int hit_rb(int rb_no);
	public int cnt_rb(RecruitBoard recruitBoard);
	public int write_rb(RecruitBoard recruitBoard);
	
}
