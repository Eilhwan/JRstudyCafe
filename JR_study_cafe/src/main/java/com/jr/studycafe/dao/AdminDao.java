package com.jr.studycafe.dao;

import java.util.List;

import com.jr.studycafe.dto.Admin;
import com.jr.studycafe.dto.Users;

public interface AdminDao {
	
	public int loginChk_admin(Admin admin);
	public Admin getAdmin(Admin admin);
	public int insert_admin(Admin admin);
	public int delete_admin(String a_id);
	public List<Users> list_users(Users users);
	public int get_users_tot();
	public int a_idConfirm(String a_id);
	public int get_admins_tot();
	public List<Admin> list_admins(Admin admin);
	public List<Users> search_user(Admin admin);
	public Users users_profile(String u_id);
	public int black_user(String u_id);
}
