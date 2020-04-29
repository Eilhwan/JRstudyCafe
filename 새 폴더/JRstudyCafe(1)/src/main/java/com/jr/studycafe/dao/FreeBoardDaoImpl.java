package com.jr.studycafe.dao;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jr.studycafe.dto.FreeBoard;
import com.jr.studycafe.dto.Users;
@Repository
public class FreeBoardDaoImpl implements FreeBoardDao {
	@Autowired
	private SqlSession sessionTemplate;
	@Override
	public List<FreeBoard> freeBoardList(FreeBoard b) {
		return sessionTemplate.selectList("freeBoardList", b);
	}
	@Override
	public int freeBoardCnt(FreeBoard b) {
		return sessionTemplate.selectOne("freeBoardCnt", b);
	}
	@Override
	public int freeBoardUserWrite(FreeBoard b) {
		return sessionTemplate.insert("freeBoardUserWrite", b);
	}
	@Override
	public int freeBoardAdminWrite(FreeBoard b) {
		return sessionTemplate.insert("freeBoardAdminWrite", b);
	}
	@Override
	public FreeBoard freeBoardDetail(int fb_no) {
		return sessionTemplate.selectOne("freeBoardDetail", fb_no);
	}
	@Override
	public int freeBoardUpdate(FreeBoard b) {
		return sessionTemplate.update("freeBoardUpdate", b);
	}
	@Override
	public int freeBoardDelete(int fb_no) {
		return sessionTemplate.delete("freeBoardDelete", fb_no);
	}
	@Override
	public int freeBoardHit(int fb_no) {
		return sessionTemplate.delete("freeBoardHit", fb_no);
	}
	@Override
	public int freeLikesInsert(FreeBoard b) {
		return sessionTemplate.insert("freeLikesInsert", b);
	}
	@Override
	public int freeLikesCnt(FreeBoard b) {
		return sessionTemplate.selectOne("freeLikesCnt", b);
	}
	@Override
	public List<FreeBoard> user_fb_post(Users users) {
		return sessionTemplate.selectList("user_fb_post", users);
	}
}