package com.jr.studycafe.dto;

import java.sql.Timestamp;

public class ReviewComent {
	private int	      c_no        ;
	private String    c_content   ;
	private int    	  c_status    ;
	private Timestamp c_rdate     ;
	private int       rv_no       ;
	private String    u_id        ;
	private String    u_nickname  ;
	private String    u_image     ;
	private String 	  u_name	  ;
	private int    	  startRow	  ;
	private int       endRow	  ;
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
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
	public int getRv_no() {
		return rv_no;
	}
	public void setRv_no(int rv_no) {
		this.rv_no = rv_no;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public Timestamp getC_rdate() {
		return c_rdate;
	}
	public void setC_rdate(Timestamp c_rdate) {
		this.c_rdate = c_rdate;
	}
	public String getU_nickname() {
		return u_nickname;
	}
	public void setU_nickname(String u_nickname) {
		this.u_nickname = u_nickname;
	}
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
	public String getU_image() {
		return u_image;
	}
	public void setU_image(String u_image) {
		this.u_image = u_image;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	@Override
	public String toString() {
		return "ReviewComent [c_no=" + c_no + ", c_content=" + c_content + ", c_status=" + c_status + ", c_rdate="
				+ c_rdate + ", rv_no=" + rv_no + ", u_id=" + u_id + ", u_nickname=" + u_nickname + ", u_image="
				+ u_image + ", u_name=" + u_name + ", startRow=" + startRow + ", endRow=" + endRow + "]";
	}
	
	
}
