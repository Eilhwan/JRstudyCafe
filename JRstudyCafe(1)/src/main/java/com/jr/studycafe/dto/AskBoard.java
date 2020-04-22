package com.jr.studycafe.dto;

import java.sql.Date;

public class AskBoard {
	private int ab_no;
	private String ab_name;
	private String ab_content;
	private Date ab_rdate;
	private int ab_status;
	private int ab_hit;
	private int ab_group;
	private int ab_step;
	private int ab_indent;
	private int startRow;
	private int endRow;
	private String schItem;
	private String schWord;
	private String u_id;
	private String a_id;
	private String writer;
	
	public AskBoard() {}

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



	public int getAb_no() {
		return ab_no;
	}
	public void setAb_no(int ab_no) {
		this.ab_no = ab_no;
	}
	public String getAb_name() {
		return ab_name;
	}
	public void setAb_name(String ab_name) {
		this.ab_name = ab_name;
	}
	public String getAb_content() {
		return ab_content;
	}
	public void setAb_content(String ab_content) {
		this.ab_content = ab_content;
	}
	public Date getAb_rdate() {
		return ab_rdate;
	}
	public void setAb_rdate(Date ab_rdate) {
		this.ab_rdate = ab_rdate;
	}
	public int getAb_status() {
		return ab_status;
	}
	public void setAb_status(int ab_status) {
		this.ab_status = ab_status;
	}
	public int getAb_hit() {
		return ab_hit;
	}
	public void setAb_hit(int ab_hit) {
		this.ab_hit = ab_hit;
	}
	public int getAb_group() {
		return ab_group;
	}
	public void setAb_group(int ab_group) {
		this.ab_group = ab_group;
	}
	public int getAb_step() {
		return ab_step;
	}
	public void setAb_step(int ab_step) {
		this.ab_step = ab_step;
	}
	public int getAb_indent() {
		return ab_indent;
	}
	public void setAb_indent(int ab_indent) {
		this.ab_indent = ab_indent;
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



	public AskBoard(int ab_no, String ab_name, String ab_content, Date ab_rdate, int ab_status, int ab_hit,
			int ab_group, int ab_step, int ab_indent, int startRow, int endRow, String schItem, String schWord,
			String u_id, String a_id, String writer) {
		this.ab_no = ab_no;
		this.ab_name = ab_name;
		this.ab_content = ab_content;
		this.ab_rdate = ab_rdate;
		this.ab_status = ab_status;
		this.ab_hit = ab_hit;
		this.ab_group = ab_group;
		this.ab_step = ab_step;
		this.ab_indent = ab_indent;
		this.startRow = startRow;
		this.endRow = endRow;
		this.schItem = schItem;
		this.schWord = schWord;
		this.u_id = u_id;
		this.a_id = a_id;
		this.writer = writer;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	@Override
	public String toString() {
		return "AskBoard [ab_no=" + ab_no + ", ab_name=" + ab_name + ", ab_content=" + ab_content + ", ab_rdate="
				+ ab_rdate + ", ab_status=" + ab_status + ", ab_hit=" + ab_hit + ", ab_group=" + ab_group + ", ab_step="
				+ ab_step + ", ab_indent=" + ab_indent + ", startRow=" + startRow + ", endRow=" + endRow + ", schItem="
				+ schItem + ", schWord=" + schWord + ", u_id=" + u_id + ", a_id=" + a_id + ", writer=" + writer + "]";
	}
	
	
}
