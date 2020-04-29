package com.jr.studycafe.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.jr.studycafe.dto.Admin;
import com.jr.studycafe.dto.Users;

public interface AdminService {
	public int loginChk_admin(Admin admin);
	public Admin login_admin(Admin admin, HttpSession session);
	public int insert_admin(Admin admin);
	public int delete_admin(String a_id);
	public List<Users> list_users(String pageNum);
	public int get_users_tot();
	public int a_idConfirm(String a_id);
	public int get_admins_tot();
	public List<Admin> list_admins(String pageNum);
	public List<Users> search_user(Admin admin);
	public Users user_profile(String u_id);
	public int black_user(String u_id);
}
