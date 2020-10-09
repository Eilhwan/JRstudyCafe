package com.jr.studycafe.dto;

import java.sql.Date;

public class Users {
	private String u_id;
	private String u_pw;
	private String u_name;
	private String u_nickname;
	private String u_phone;
	private String u_tel;
	private String u_email;
	private String u_addr;
	private Date u_birth;
	private int u_status;
	private String u_image;
	private int startRow;
	private int endRow;
	
	// getters - setters
	
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_pw() {
		return u_pw;
	}
	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_nickname() {
		return u_nickname;
	}
	public void setU_nickname(String u_nickname) {
		this.u_nickname = u_nickname;
	}
	public String getU_phone() {
		return u_phone;
	}
	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}
	public String getU_tel() {
		return u_tel;
	}
	public void setU_tel(String u_tel) {
		this.u_tel = u_tel;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public String getU_addr() {
		return u_addr;
	}
	public void setU_addr(String u_addr) {
		this.u_addr = u_addr;
	}
	public Date getU_birth() {
		return u_birth;
	}
	public void setU_birth(Date u_birth) {
		this.u_birth = u_birth;
	}
	public int getU_status() {
		return u_status;
	}
	public void setU_status(int u_status) {
		this.u_status = u_status;
	}
	public String getU_image() {
		return u_image;
	}
	public void setU_image(String u_image) {
		this.u_image = u_image;
	}
	
	//toString
	@Override
	public String toString() {
		return "Users [u_id=" + u_id + ", u_pw=" + u_pw + ", u_name=" + u_name + ", u_nickname=" + u_nickname
				+ ", u_phone=" + u_phone + ", u_tel=" + u_tel + ", u_email=" + u_email + ", u_addr=" + u_addr
				+ ", u_birth=" + u_birth + ", u_status=" + u_status + ", u_img=" + u_image + "]";
	}
	
	
	
}
