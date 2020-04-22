package com.tj.test01.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.tj.test01.dto.B;
import com.tj.test01.dto.FileUpVO;

public interface BService {
	public List<B> list(B b);
	public int cnt(B b);
	public int write(MultipartHttpServletRequest mRequest, B b);
	public B detail(int bno);
	public int update(MultipartHttpServletRequest mRequest, Model model);
	public int delete(int bno);
	public FileUpVO fileUp(FileUpVO fileUpVO, HttpServletRequest request);
}
