package com.jr.studycafe.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.jr.studycafe.dto.StudyBoard;

public interface StudyBoardService {
	public List<StudyBoard> list_sb(StudyBoard studyBoard);
	public List<StudyBoard> notice_sb(StudyBoard studyBoard);
	public StudyBoard detail_sb(int sb_no);
	public int write_sb(StudyBoard studyBoard, HttpSession session);
	public int delete_sb(int sb_no);
	public int modify_sb(StudyBoard studyBoard, HttpSession session);
	public int hitup_sb(int sb_no);
	public int cnt_sb(int sb_no);
}
