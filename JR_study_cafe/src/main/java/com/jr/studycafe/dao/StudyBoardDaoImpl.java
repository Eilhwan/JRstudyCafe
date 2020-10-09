package com.jr.studycafe.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jr.studycafe.dto.StudyBoard;

@Repository
public class StudyBoardDaoImpl implements StudyBoardDao {
	@Autowired
	private SqlSessionTemplate template;
	@Override
	public List<StudyBoard> list_sb(StudyBoard studyBoard) {
		return template.selectList("list_sb", studyBoard);
	}

	@Override
	public List<StudyBoard> notice_sb(StudyBoard studyBoard) {
		return template.selectList("notice_sb", studyBoard);
	}

	@Override
	public StudyBoard detail_sb(int sb_no) {
		return template.selectOne("detail_sb", sb_no);
	}

	@Override
	public int write_sb(StudyBoard studyBoard) {
		return template.insert("write_sb", studyBoard);
	}

	@Override
	public int delete_sb(int sb_no) {
		return template.update("delete_sb", sb_no);
	}

	@Override
	public int modify_sb(StudyBoard studyBoard) {
		return template.update("modify_sb", studyBoard);
	}

	@Override
	public int hitup_sb(int sb_no) {
		return template.update("hitup_sb", sb_no);
	}

	@Override
	public int cnt_sb(int sb_no) {
		return template.selectOne("cnt_sb", sb_no);
	}

	
}
