package com.jr.studycafe.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jr.studycafe.dao.AdminDao;
import com.jr.studycafe.dto.Admin;
import com.jr.studycafe.dto.Users;
import com.jr.studycafe.util.Paging;


@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDao adao;


	@Override
	public int loginChk_admin(Admin admin) {
		return adao.loginChk_admin(admin);
	}

	@Override
	public int insert_admin(Admin admin) {
		return adao.insert_admin(admin);
	}

	@Override
	public int delete_admin(String a_id) {
		return adao.delete_admin(a_id);
	}

	@Override
	public Admin login_admin(Admin admin, HttpSession session) {
		if (loginChk_admin(admin) == 1) {
			session.setAttribute("admin", adao.getAdmin(admin));
		}else if (loginChk_admin(admin) == 0) {
			
		}
		return null;
	}

	@Override
	public List<Users> list_users(String pageNum) {
		int pageSize = 10;
		int blockSize = 10;
		Users users = new Users();
		Paging paging = new Paging(adao.get_users_tot(), pageNum, pageSize, blockSize);
		users.setStartRow(paging.getStartRow());
		users.setEndRow(paging.getEndRow());
		return adao.list_users(users);
		
	}

	@Override
	public int get_users_tot() {
		
		return adao.get_users_tot();
	}
	
	@Override
	public int a_idConfirm(String a_id) {
		return adao.a_idConfirm(a_id);
	}

	@Override
	public int get_admins_tot() {
		return adao.get_admins_tot();
	}

	@Override
	public List<Admin> list_admins(String pageNum) {
		int pageSize = 5;
		int blockSize = 5;
		Admin admin = new Admin();
		Paging paging = new Paging(adao.get_admins_tot(), pageNum, pageSize, blockSize);
		admin.setStartRow(paging.getStartRow());
		admin.setEndRow(paging.getEndRow());
		return adao.list_admins(admin);
	}

	@Override
	public List<Users> search_user(Admin admin) {
		return adao.search_user(admin);
	}

	@Override
	public Users user_profile(String u_id) {
	
		return adao.users_profile(u_id);
	}

	@Override
	public int black_user(String u_id) {
		int result = 0;
		if (adao.black_user(u_id) == 1) {
			result = 1;
		}
		return 0;
	}

	
	

}
