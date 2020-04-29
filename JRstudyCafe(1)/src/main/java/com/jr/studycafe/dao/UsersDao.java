package com.jr.studycafe.dao;

import com.jr.studycafe.dto.Users;

public interface UsersDao {
	public int u_join(Users users);
	public int u_idCofirm(String u_id);
	public Users u_getUsers(String u_id);
	public int u_modify(Users users);
	public Users u_getId(String u_email, String u_name);
	public int u_idfind(Users users);
	public int u_pwfind(Users users);
}
