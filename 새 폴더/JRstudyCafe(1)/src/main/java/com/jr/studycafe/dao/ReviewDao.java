package com.jr.studycafe.dao;

import java.util.List;

import com.jr.studycafe.dto.Review;

public interface ReviewDao {
	// 게시물 목록 조회
	public List<Review> review_list(Review review);
	// 게시물 개수
	public int review_cnt(Review review);
	// 게시물 쓰기
	public int review_write(Review review);
	// 조회수 올리기
	public int review_hitup (int rv_no);
	// 게시물 수정
	public int review_modify (Review review);
	// 게시물 조회
	public Review review_detail(int rv_no);
	// 게시물 삭제
	public int review_delete (int rv_no);
	// 좋아요 
	public int rvlike_Insert (Review review);
	// 좋아요 삭제
	public int rvlike_Delete (int likeno);
	// 좋아요 확인
	public Review rvlike_Chk (Review review);
	
}
