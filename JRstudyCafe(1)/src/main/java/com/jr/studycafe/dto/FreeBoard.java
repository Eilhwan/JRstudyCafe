package com.jr.studycafe.dto;


public class FreeBoard {
	private int fb_no;
	private String fb_name;
	private String fb_content;
	private int fb_status;
	private int fb_hit;
	private String u_id;
	private String a_id;
	private String writer;
	private int likecnt;
	private String schItem;
	private String schWord;
	private int startRow;
	private int endRow;
	private String bf_name;
	public FreeBoard() { }
	public int getFb_no() {
		return fb_no;
	}
	public void setFb_no(int fb_no) {
		this.fb_no = fb_no;
	}
	public String getFb_name() {
		return fb_name;
	}
	public void setFb_name(String fb_name) {
		this.fb_name = fb_name;
	}
	public String getFb_content() {
		return fb_content;
	}
	public void setFb_content(String fb_content) {
		this.fb_content = fb_content;
	}
	public int getFb_status() {
		return fb_status;
	}
	public void setFb_status(int fb_status) {
		this.fb_status = fb_status;
	}
	public int getFb_hit() {
		return fb_hit;
	}
	public void setFb_hit(int fb_hit) {
		this.fb_hit = fb_hit;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getA_id() {
		return a_id;
	}
	public void setA_id(String a_id) {
		this.a_id = a_id;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	public String getBf_name() {
		return bf_name;
	}
	public void setBf_name(String bf_name) {
		this.bf_name = bf_name;
	}
	@Override
	public String toString() {
		return "글번호는 "+fb_no + " / ";
//		return "FreeBoard [fb_no=" + fb_no + ", fb_name=" + fb_name + ", fb_content=" + fb_content + ", fb_status="
//				+ fb_status + ", fb_hit=" + fb_hit + ", u_id=" + u_id + ", a_id=" + a_id + ", writer=" + writer
//				+ ", likecnt=" + likecnt + ", schItem=" + schItem + ", schWord=" + schWord + ", startRow=" + startRow
//				+ ", endRow=" + endRow + "]";
	}
	
}
