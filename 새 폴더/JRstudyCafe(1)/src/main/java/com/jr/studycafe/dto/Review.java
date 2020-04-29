package com.jr.studycafe.dto;

import java.sql.Date;

public class Review {
	private int    rv_no 		   ; 
	private String rv_name         ; 
	private String rv_content      ; 
	private int    rv_status       ; 
	private int    rv_hit 		   ;
	private Date   rv_date		   ;
	private String u_id		       ;
	private int    r_no            ;
	private String bf_name         ;
	private String u_nickname      ;
	private int    likecnt         ;
	private int    likeno    	   ;
	private int    startRow		   ;
	private int    endRow		   ;
	private String schItem         ;
	private String schWord         ;
	
	public int getRv_no() {
		return rv_no;
	}
	public void setRv_no(int rv_no) {
		this.rv_no = rv_no;
	}
	public String getRv_name() {
		return rv_name;
	}
	public void setRv_name(String rv_name) {
		this.rv_name = rv_name;
	}
	public String getRv_content() {
		return rv_content;
	}
	public void setRv_content(String rv_content) {
		this.rv_content = rv_content;
	}
	public int getRv_status() {
		return rv_status;
	}
	public void setRv_status(int rv_status) {
		this.rv_status = rv_status;
	}
	public int getRv_hit() {
		return rv_hit;
	}
	public void setRv_hit(int rv_hit) {
		this.rv_hit = rv_hit;
	}
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public String getBf_name() {
		return bf_name;
	}
	public void setBf_name(String bf_name) {
		this.bf_name = bf_name;
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
	
	public int getLikecnt() {
		return likecnt;
	}
	public void setLikecnt(int likecnt) {
		this.likecnt = likecnt;
	}
	public String getSchItem() {
		return schItem;
	}
	public void setSchItem(String schItem) {
		this.schItem = schItem;
	}
	public String getSchWord() {
		return schWord;
	}
	public void setSchWord(String schWord) {
		this.schWord = schWord;
	}
	public Date getRv_date() {
		return rv_date;
	}
	public void setRv_date(Date rv_date) {
		this.rv_date = rv_date;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public int getLikeno() {
		return likeno;
	}
	public void setLikeno(int likeno) {
		this.likeno = likeno;
	}
	public String getU_nickname() {
		return u_nickname;
	}
	public void setU_nickname(String u_nickname) {
		this.u_nickname = u_nickname;
	}
	@Override
	public String toString() {
		return "Review [rv_no=" + rv_no + ", rv_name=" + rv_name + ", rv_content=" + rv_content + ", rv_status="
				+ rv_status + ", rv_hit=" + rv_hit + ", rv_date=" + rv_date + ", u_id=" + u_id + ", r_no=" + r_no
				+ ", bf_name=" + bf_name + ", u_nickname=" + u_nickname + ", likecnt=" + likecnt + ", likeno=" + likeno
				+ ", startRow=" + startRow + ", endRow=" + endRow + ", schItem=" + schItem + ", schWord=" + schWord
				+ "]";
	}
		
}
