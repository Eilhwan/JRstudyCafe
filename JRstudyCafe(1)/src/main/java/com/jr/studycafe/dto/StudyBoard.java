package com.jr.studycafe.dto;

import java.sql.Timestamp;

public class StudyBoard {
	private int sb_no;
	private String sb_title;
	private String sb_content;
	private int sb_hit;
	private int sb_status;
	private int sg_no;
	private String u_id;
	private String u_name;
	private String u_image;	
	private Timestamp sb_rdate;
	private int startRow;
	private int endRow;
	
	public int getSb_no() {
		return sb_no;
	}
	public void setSb_no(int sb_no) {
		this.sb_no = sb_no;
	}
	public String getSb_title() {
		return sb_title;
	}
	public void setSb_title(String sb_title) {
		this.sb_title = sb_title;
	}
	public String getSb_content() {
		return sb_content;
	}
	public void setSb_content(String sb_content) {
		this.sb_content = sb_content;
	}
	public int getSb_hit() {
		return sb_hit;
	}
	public void setSb_hit(int sb_hit) {
		this.sb_hit = sb_hit;
	}
	public int getSb_status() {
		return sb_status;
	}
	public void setSb_status(int sb_status) {
		this.sb_status = sb_status;
	}
	public int getSg_no() {
		return sg_no;
	}
	public void setSg_no(int sg_no) {
		this.sg_no = sg_no;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public Timestamp getSb_rdate() {
		return sb_rdate;
	}
	public void setSb_rdate(Timestamp sb_rdate) {
		this.sb_rdate = sb_rdate;
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
	@Override
	public String toString() {
		return "StudyBoard [sb_no=" + sb_no + ", sb_title=" + sb_title + ", sb_content=" + sb_content + ", sb_hit="
				+ sb_hit + ", sb_status=" + sb_status + ", sg_no=" + sg_no + ", u_id=" + u_id + ", sb_rdate=" + sb_rdate
				+ "]";
	}
	
	
}
