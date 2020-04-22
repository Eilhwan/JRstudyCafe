package com.tj.test01.dao;

import java.util.List;

import com.tj.test01.dto.B;

public interface BDao {
	public List<B> list(B b);
	public int cnt(B b);
	public int write(B b);
	public B detail(int bno);
	public int update(B b);
	public int delete(int bno);
}
