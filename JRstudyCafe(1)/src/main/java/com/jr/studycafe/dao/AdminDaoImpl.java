package com.jr.studycafe.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jr.studycafe.dto.Admin;
import com.jr.studycafe.dto.Users;

@Repository
public class AdminDaoImpl implements AdminDao {
	@Autowired
	private SqlSessionTemplate template;


	@Override
	public int insert_admin(Admin admin) {
		return template.insert("insert_admin", admin);
	}

	@Override
	public int delete_admin(String a_id) {
		return template.update("delete_admin", a_id);
	}

	@Override
	public int loginChk_admin(Admin admin) {
		
		return template.selectOne("loginCheck_admin", admin);
	}

	@Override
	public Admin getAdmin(Admin admin) {
		return template.selectOne("get_admin", admin);
	}

	@Override
	public List<Users> list_users(Users users) {
		return template.selectList("list_users", users);
	}

	@Override
	public int get_users_tot() {
		return template.selectOne("get_users_tot");
	}
    
	@Override
	public int a_idConfirm(String a_id) {
		return template.selectOne("a_idConfirm", a_id);
	}

	@Override
	public int get_admins_tot() {
		return template.selectOne("get_admins_tot");
	}

	@Override
	public List<Admin> list_admins(Admin admin) {
		return template.selectList("list_admins", admin);
	}
	@Override
	public List<Users> search_user(Admin admin) {
		return template.selectList("search_user", admin);
	}

	@Override
	public Users users_profile(String u_id) {
		return template.selectOne("users_profile", u_id);
	}

	@Override
	public int black_user(String u_id) {
		return template.update("black_user", u_id);
	}
	


}
