package com.jr.studycafe.dao;

import java.util.List;

import com.jr.studycafe.dto.StudyBoard;

public interface StudyBoardDao {
	public List<StudyBoard> list_sb(StudyBoard studyBoard);
	public List<StudyBoard> notice_sb(StudyBoard studyBoard);
	public StudyBoard detail_sb(int sb_no);
	public int write_sb(StudyBoard studyBoard);
	public int delete_sb(int sb_no);
	public int modify_sb(StudyBoard studyBoard);
	public int hitup_sb(int sb_no);
	public int cnt_sb(int sb_no);
}
