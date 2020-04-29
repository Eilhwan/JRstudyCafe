package com.jr.studycafe.dao;

import java.sql.ResultSet;
import java.sql.SQLException;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.jr.studycafe.dto.Users;
@Repository
public class UsersDaoImpl implements UsersDao {
	@Autowired
	private SqlSessionTemplate sqlTemplate;
	private JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	@Override
	public int u_join(Users users) {
		return sqlTemplate.insert("u_join", users);
	}

	@Override
	public int u_idCofirm(String u_id) {
		
		return sqlTemplate.selectOne("u_idCofirm", u_id);
	}

	@Override
	public Users u_getUsers(String u_id) {
		
		return sqlTemplate.selectOne("u_getUsers", u_id);
	}

	@Override
	public Users u_idfind(Users users) {
		
		return sqlTemplate.selectOne("u_idfind", users);
	}

	@Override
	public int u_modify(Users users) {
		
		return sqlTemplate.update("u_modify", users);
	}

	@Override
	public Users u_getId(String u_email, String u_name) {
		String sql = "SELECT * FROM USERS WHERE u_email=? AND u_name=?";
		try {
			return template.queryForObject(sql, new Object[] {u_email, u_name},
					new RowMapper<Users>() {
				@Override
				public Users mapRow(ResultSet rs, int rowNum) throws SQLException{
					Users u = new Users();
					u.setU_id(rs.getString("u_id"));
					u.setU_pw(rs.getString("u_pw"));
					u.setU_name(rs.getString("u_name"));
					u.setU_nickname(rs.getString("u_nickname"));
					u.setU_phone(rs.getString("u_phone"));
					u.setU_tel(rs.getString("u_tel"));
					u.setU_email(rs.getString("u_email"));
					u.setU_addr(rs.getString("u_addr"));
					u.setU_birth(rs.getDate("u_birth"));
					u.setU_image(rs.getString("u_image"));
					return u;
				}
			});
		}catch(Exception e) {
		return null;
		}
	}

	@Override
	public boolean u_findId(String u_email, String u_name) {
		Users u = u_getId(u_email, u_name);
		if( u != null) {
			String id = u.getU_id();
			return true;
		}
		return false;
	}
	@Override
	public int u_pwfind(Users users) {
		
		return sqlTemplate.update("u_pwfind", users);
	}
}
