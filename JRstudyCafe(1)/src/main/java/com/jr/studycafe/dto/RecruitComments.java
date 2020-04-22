package com.jr.studycafe.dto;

public class RecruitComments {
	private int c_no;
	private String u_id;
	private String c_content;
	private int c_status;
	private int rb_no;
	private String c_rdate;
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public int getC_status() {
		return c_status;
	}
	public void setC_status(int c_status) {
		this.c_status = c_status;
	}
	public int getRb_no() {
		return rb_no;
	}
	public void setRb_no(int rb_no) {
		this.rb_no = rb_no;
	}
	public String getC_rdate() {
		return c_rdate;
	}
	public void setC_rdate(String c_rdate) {
		this.c_rdate = c_rdate;
	}
	@Override
	public String toString() {
		return "RecruitComments [c_no=" + c_no + ", u_id=" + u_id + ", c_content=" + c_content + ", c_status="
				+ c_status + ", rb_no=" + rb_no + ", c_rdate=" + c_rdate + "]";
	}
	
}
