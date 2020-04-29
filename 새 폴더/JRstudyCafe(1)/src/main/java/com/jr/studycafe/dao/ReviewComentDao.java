package com.jr.studycafe.dao;

import java.util.List;

import com.jr.studycafe.dto.Review;
import com.jr.studycafe.dto.ReviewComent;

public interface ReviewComentDao {
	// 댓글목록
	public List<ReviewComent> rvcoment_list(ReviewComent reviewComent);
	// 댓글 개수
	public int rvcoment_cnt(int rv_no);
	// 댓글 쓰기
	public int rvcoment_write(ReviewComent reviewComent);
	
	// 댓글 수정
	public int rvcoment_modify(ReviewComent reviewComent);
	
	// 댓글 삭제
	public int rvcoment_delete (int c_no);
	
	
	
}
