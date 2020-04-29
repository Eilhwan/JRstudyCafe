package com.jr.studycafe.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jr.studycafe.dao.StudyBoardDao;
import com.jr.studycafe.dto.StudyBoard;
import com.jr.studycafe.dto.Users;

@Service
public class StudyBoardServiceImpl implements StudyBoardService {
	@Autowired
	private StudyBoardDao sbDao;
	
	@Override
	public List<StudyBoard> list_sb(StudyBoard studyBoard) {
	
		return sbDao.list_sb(studyBoard);
	}

	@Override
	public List<StudyBoard> notice_sb(StudyBoard studyBoard) {
		return sbDao.notice_sb(studyBoard);
	}

	@Override
	public StudyBoard detail_sb(int sb_no) {
		
		return sbDao.detail_sb(sb_no);
	}

	@Override
	public int write_sb(StudyBoard studyBoard, HttpSession session) {
		if (session.getAttribute("users") == null) {
			return 0;
			
		}else {
			Users users = (Users) session.getAttribute("users");
			String u_id = users.getU_id();
			
			studyBoard.setU_id(u_id);
			
			
			return sbDao.write_sb(studyBoard);
		}
	}

	@Override
	public int delete_sb(int sb_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modify_sb(StudyBoard studyBoard, HttpSession session) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int hitup_sb(int sb_no) {
		return sbDao.hitup_sb(sb_no);
	}

	@Override
	public int cnt_sb(int sb_no) {
		// TODO Auto-generated method stub
		return 0;
	}


}
