package com.jr.studycafe.service;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jr.studycafe.dto.Users;

public interface UsersService {
	public Users u_getUsers(String u_id);
	public int u_idCofirm(String u_id);
	public int u_join(Users users, HttpSession httpSession, MultipartHttpServletRequest mRequest);
	public String loginCheck(String u_id, String u_pw, HttpSession httpSession); 
	public int u_modify(Users users, HttpSession httpSession, MultipartHttpServletRequest mRequest);
	public int u_idfind(Users users);
	public int u_pwfind(Users users);
}
