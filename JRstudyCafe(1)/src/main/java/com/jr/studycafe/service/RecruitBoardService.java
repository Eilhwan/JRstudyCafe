package com.jr.studycafe.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jr.studycafe.dto.FileUpDto;
import com.jr.studycafe.dto.RecruitBoard;

public interface RecruitBoardService {
	public List<RecruitBoard> list_rb(RecruitBoard recruitBoard);
	public RecruitBoard detail_rb(int rb_no);
	public List<RecruitBoard> search_rb(RecruitBoard recruitBoard);
	public int modify_rb(MultipartHttpServletRequest mRequest, RecruitBoard recruitBoard, Model model);
	public int delete_rb(int rb_no);
	public int hit_rb(int rb_no);
	public int cnt_rb(RecruitBoard recruitBoard);
	public int write_rb(MultipartHttpServletRequest mRequest, RecruitBoard recruitBoard);
	public FileUpDto fileUp(FileUpDto fileUpDto, HttpServletRequest request);
}
