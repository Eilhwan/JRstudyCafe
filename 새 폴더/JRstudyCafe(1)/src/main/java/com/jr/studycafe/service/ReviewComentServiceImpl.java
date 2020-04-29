package com.jr.studycafe.service;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.jr.studycafe.dao.ReviewComentDao;
import com.jr.studycafe.dto.ReviewComent;
import com.jr.studycafe.dto.Users;
import com.jr.studycafe.util.Paging;
@Service
public class ReviewComentServiceImpl implements ReviewComentService {
	@Autowired
	private ReviewComentDao rcDao;
	// 댓글리스트
	@Override
	public List<ReviewComent> rvcoment_list(String pageNum, Model model, ReviewComent reviewComent) {
		Paging paging = new Paging(rcDao.rvcoment_cnt(reviewComent.getRv_no()), pageNum, 10, 10);
		model.addAttribute("paging", paging);
		reviewComent.setStartRow(paging.getStartRow());
		reviewComent.setEndRow(paging.getEndRow());
		if (paging.getCurrentPage()>paging.getPageCnt()) {
			model.addAttribute("noMore", "더이상 없는 페이지 입니다.");
		}
		model.addAttribute("rvcoment_cnt", rcDao.rvcoment_cnt(reviewComent.getRv_no()));
		return rcDao.rvcoment_list(reviewComent);
	}

	// 댓글 쓰기
	@Override
	public int rvcoment_write(ReviewComent reviewComent, HttpSession httpSession, Model model) {
		String u_id = "";
		if(httpSession.getAttribute("users")!=null) {
			u_id = ((Users)httpSession.getAttribute("users")).getU_id();
		}
		reviewComent.setU_id(u_id);
		reviewComent.setC_rdate(new Timestamp(System.currentTimeMillis()));
		System.out.println(reviewComent);
		int result =rcDao.rvcoment_write(reviewComent);
		reviewComent.setStartRow(1);
		reviewComent.setEndRow(1);
		System.out.println("들어왔냐?"+rcDao.rvcoment_list(reviewComent));
		model.addAttribute("insert_list", rcDao.rvcoment_list(reviewComent));
		return result;
	}
	// 댓글 수정
	@Override
	public int rvcoment_modify(ReviewComent reviewComent) {
		
		return rcDao.rvcoment_modify(reviewComent);
	}
	// 댓글 삭제
	@Override
	public int rvcoment_delete(int c_no) {
		
		return rcDao.rvcoment_delete(c_no);
	}
	// 댓글개수
	@Override
	public int rvcoment_cnt(int rv_no) {
		
		return rcDao.rvcoment_cnt(rv_no);
	}
	

}
