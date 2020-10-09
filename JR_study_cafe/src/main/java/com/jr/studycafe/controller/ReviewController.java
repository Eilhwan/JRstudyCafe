package com.jr.studycafe.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jr.studycafe.dto.FileUpVO;
import com.jr.studycafe.dto.Review;
import com.jr.studycafe.dto.ReviewComent;
import com.jr.studycafe.service.ReviewComentService;
import com.jr.studycafe.service.ReviewService;
import com.jr.studycafe.util.Paging;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService rService;
	@Autowired
	private ReviewComentService rComentService;
	
	// 글목록
	@RequestMapping(value = "reviewListView")
	public String joinView(Model model, Review review, String pageNum) {
		int totCnt = rService.review_cnt(review);
		Paging paging = new Paging(totCnt, pageNum, 10, 10);
		int inversNum = totCnt - paging.getStartRow() +1;
		review.setStartRow(paging.getStartRow());
		review.setEndRow(paging.getEndRow());
		//totCnt - startRow + 1;
		model.addAttribute("reviewList", rService.review_list(review));
		model.addAttribute("paging", paging);
		model.addAttribute("pageNum", paging.getCurrentPage());
		model.addAttribute("inversNum", inversNum);
		
		return "review/review_list";
	}
	
	// 글쓰기 뷰단
	@RequestMapping(value = "reviewWriteView")
	public String reviewWriteView(Model model, Review review) {
		return "review/review_write_view";
	}
	// ckEditor 이미지파일 업로드
	@RequestMapping(value="reviewWriteFileupload")
	public String fileUpload(FileUpVO fileUploadVO, HttpServletRequest request , Model model){
		fileUploadVO = rService.fileUp(fileUploadVO, request);
		model.addAttribute("filePath", fileUploadVO.getAttachPath() + fileUploadVO.getFilename());
		System.out.println(fileUploadVO);
		model.addAttribute("filename", fileUploadVO.getFilename()); //결과값을
		return "review/ckeditorImageUpload";
    }
	
	// 글쓰기 처리
	@RequestMapping(value = "reviewWrite", method = RequestMethod.POST)
	public String reviewWrite(Model model, Review review, HttpSession httpSession) {
		int result = rService.review_write(review, httpSession);
		if(result==1) {
			model.addAttribute("reviewWriteResult", "글쓰기 성공");
			return "forward:reviewListView.do";
		}else {
			model.addAttribute("reviewWriteResult", "글쓰기 실패");
			return "forward:reviewWriteView.do";
		}
	}
	// 글 상세
	@RequestMapping(value = "reviewDetailView")
	public String reviewDetailView(Model model, Review review, String pageNum, HttpSession httpSession, ReviewComent reviewComent) {
		review = rService.review_detail(review.getRv_no());
		String result = "";
		if(rService.rvlike_Chk(review, httpSession)!=null) {
			result="EXIST";
		}else {
			result="NONEXIST";
		}
		int rv_no = review.getRv_no();
		model.addAttribute("review_detail", review);
		model.addAttribute("likeChk", result);
		// 댓글 
		reviewComent.setRv_no(rv_no);
		model.addAttribute("rvcoment_list", rComentService.rvcoment_list(pageNum, model, reviewComent));
		return "review/review_detail_view";
	}
	
	// 글수정 뷰페이지 review_modify_view
	@RequestMapping(value = "reviewModifyView")
	public String reviewModifyView(Model model, Review review) {
		review = rService.review_detail(review.getRv_no());
		model.addAttribute("review_modify", review);
		return "review/review_modify_view";
	}
	
	// 글 수정 학기
	@RequestMapping(value = "reviewModify", method = RequestMethod.POST)
	public String reviewModify(Model model, Review review) {		
		int result = rService.review_modify(review);
		if(result==1) {
			model.addAttribute("reviewModifyResult", "글수정 성공");
			return "forward:reviewListView.do";
		}else {
			model.addAttribute("reviewModifyResult", "글수정 실패");
			return "foward:reviewModifyView.do";
		}
	}
	// 글삭제
	@RequestMapping(value = "reviewDelete", method = RequestMethod.GET)
	public String reviewDelete(Model model, Review review) {		
		int result = rService.review_delete(review.getRv_no());
		if(result==1) {
			model.addAttribute("reviewDeleteResult", "글삭제 성공");
			return "forward:reviewListView.do";
		}else {
			model.addAttribute("reviewDeleteResult", "글삭제 실패");
			return "foward:reviewDetailView.do";
		}
	}
	//리뷰 좋아요 처리
	@RequestMapping(value = "reviewlikes")
	public String reviewlikes(Review review, Model model, HttpSession httpSession) {		
		Review rvlike_Chk = rService.rvlike_Chk(review, httpSession);
			if(rvlike_Chk==null) {
				rService.rvlike_Insert(review, httpSession);
				model.addAttribute("likeResult", "좋아요");
				return "review/review_likeChk";
				
			}else {
				rService.rvlike_Delete(rvlike_Chk.getLikeno());
				model.addAttribute("likeResult", "좋아요취소");
				return "review/review_likeChk";
			}
	}
	// 댓글 더보기
	@RequestMapping(value="rvcomentAppend", method=RequestMethod.GET)
	public String append(String pageNum, Model model, ReviewComent reviewComent) {
		model.addAttribute("appendList",rComentService.rvcoment_list(pageNum, model, reviewComent));
		return "review/review_coment_append";
	}
	
	// 댓글 등록 reviewComentWrite
	@RequestMapping(value = "reviewComentWrite")
	public String reviewComentWrite(Model model, ReviewComent reviewComent, HttpSession httpSession) {
		System.out.println(reviewComent);
		rComentService.rvcoment_write(reviewComent, httpSession, model);
		return "review/review_coment_write";
	
	}
	// 댓글 삭제 reviewComentDelete
	@RequestMapping(value = "reviewComentDelete")
	public String reviewComentDelete(Model model, ReviewComent reviewComent) {
		rComentService.rvcoment_delete(reviewComent.getC_no());
		return "forward:reviewDetailView.do";
	
	}
}
