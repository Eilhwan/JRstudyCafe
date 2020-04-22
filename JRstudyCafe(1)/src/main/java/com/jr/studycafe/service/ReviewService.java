package com.jr.studycafe.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.jr.studycafe.dto.FileUpVO;
import com.jr.studycafe.dto.Review;

public interface ReviewService {
	// 게시물 목록 조회 
	public List<Review> review_list(Review review);
	// 글개수 가져오기
	public int review_cnt(Review reivew);
	// 게시물 쓰기
	public int review_write(Review review, HttpSession httpSession);
	// 게시물 수정
	public int review_modify(Review review);
	// 게시물 조회
	public Review review_detail(int rv_no);
	// 게시물 삭제
	public int review_delete (int rv_no);
	// 파일업
	public FileUpVO fileUp(FileUpVO fileUpVO, HttpServletRequest request);
	//좋아요
	public int rvlike_Insert(Review review, HttpSession httpSession); 
	//좋아요 삭제
	public int rvlike_Delete(int likeno); 
	//좋아요 확인
	public Review rvlike_Chk(Review review, HttpSession httpSession);
	//좋아요 
	public int rvLike_Insert_Delete(Review review, HttpSession httpSession);
}
