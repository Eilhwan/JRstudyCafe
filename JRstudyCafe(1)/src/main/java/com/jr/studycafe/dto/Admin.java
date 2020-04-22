package com.jr.studycafe.dto;

public class Admin {
	private String a_id;
	private String a_pw;
	private String a_name;
	private int a_status;
	private int startRow;
	private int endRow;
	private String key;
	private String keyword;
	
	
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
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getA_id() {
		return a_id;
	}
	public void setA_id(String a_id) {
		this.a_id = a_id;
	}
	public String getA_pw() {
		return a_pw;
	}
	public void setA_pw(String a_pw) {
		this.a_pw = a_pw;
	}
	public String getA_name() {
		return a_name;
	}
	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
	public int getA_status() {
		return a_status;
	}
	public void setA_status(int a_status) {
		this.a_status = a_status;
	}
	@Override
	public String toString() {
		return "Admin [a_id=" + a_id + ", a_pw=" + a_pw + ", a_name=" + a_name + ", a_status=" + a_status + "]";
	}
	
	
}
