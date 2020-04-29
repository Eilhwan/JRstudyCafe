package com.jr.studycafe.dto;

import java.sql.Timestamp;

public class SbComment {
	private int sc_no;
	private String u_id;
	private String u_name;
	private String u_image;
	private String c_content;
	private int c_status;
	private Timestamp c_rdate;
	private int sb_no;
	private int sg_no;
	private int startRow;
	private int EndRow;
	public int getSc_no() {
		return sc_no;
	}
	public void setSc_no(int sc_no) {
		this.sc_no = sc_no;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_image() {
		return u_image;
	}
	public void setU_image(String u_image) {
		this.u_image = u_image;
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
	public Timestamp getC_rdate() {
		return c_rdate;
	}
	public void setC_rdate(Timestamp c_rdate) {
		this.c_rdate = c_rdate;
	}
	
	public int getSb_no() {
		return sb_no;
	}
	public void setSb_no(int sb_no) {
		this.sb_no = sb_no;
	}
	public int getSg_no() {
		return sg_no;
	}
	public void setSg_no(int sg_no) {
		this.sg_no = sg_no;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return EndRow;
	}
	public void setEndRow(int endRow) {
		EndRow = endRow;
	}
	@Override
	public String toString() {
		return "SbComment [sc_no=" + sc_no + ", u_id=" + u_id + ", u_name=" + u_name + ", u_image=" + u_image
				+ ", c_content=" + c_content + ", c_status=" + c_status + ", c_rdate=" + c_rdate + ", sb_no=" + sb_no
				+ ", sg_no=" + sg_no + ", startRow=" + startRow + ", EndRow=" + EndRow + "]";
	}

	
}
