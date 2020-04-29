package com.jr.studycafe.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.jr.studycafe.dto.ReviewComent;

public interface ReviewComentService {
	// 댓글목록
	public List<ReviewComent> rvcoment_list(String pageNum, Model model, ReviewComent reviewComent);
	// 댓글개수
	public int rvcoment_cnt(int rv_no);
	// 댓글 쓰기
	public int rvcoment_write(ReviewComent reviewComent, HttpSession httpSession, Model model);
		
	// 댓글 수정
	public int rvcoment_modify(ReviewComent reviewComent);
		
	// 댓글 삭제
	public int rvcoment_delete (int c_no);
}
