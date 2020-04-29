package com.jr.studycafe.dao;

import java.util.List;

import com.jr.studycafe.dto.FreeBoard;
import com.jr.studycafe.dto.Users;

public interface FreeBoardDao {
	public List<FreeBoard> freeBoardList(FreeBoard b);
	public int freeBoardCnt(FreeBoard b);
	public int freeBoardUserWrite(FreeBoard b);
	public int freeBoardAdminWrite(FreeBoard b);
	public FreeBoard freeBoardDetail(int fb_no);
	public int freeBoardUpdate(FreeBoard b);
	public int freeBoardDelete(int fb_no);
	public int freeBoardHit(int fb_no);
	public int freeLikesInsert(FreeBoard b);
	public int freeLikesCnt(FreeBoard b);
	public List<FreeBoard> user_fb_post(Users users);
}
