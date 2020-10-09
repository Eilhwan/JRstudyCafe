package com.jr.studycafe.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jr.studycafe.dto.FileUpVO;
import com.jr.studycafe.dto.FreeBoard;

public interface FreeBoardService {
	public List<FreeBoard> freeBoardList(FreeBoard b);
	public int freeBoardCnt(FreeBoard b);
	public int freeBoardUserWrite(MultipartHttpServletRequest mRequest, FreeBoard b);
	public int freeBoardAdminWrite(MultipartHttpServletRequest mRequest, FreeBoard b);
	public FreeBoard freeBoardDetail(int fb_no);
	public int freeBoardUpdate(MultipartHttpServletRequest mRequest, FreeBoard b);
	public int freeBoardDelete(int fb_no);
	public int freeBoardHit(int fb_no);
	public void insert50();
	public FileUpVO fileUp(FileUpVO fileUpVO, HttpServletRequest request);
	public int freeLikesInsert(FreeBoard b);
	public int freeLikesCnt(FreeBoard b);
}
