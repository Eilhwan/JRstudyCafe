package com.jr.studycafe.dto;

import java.sql.Timestamp;

public class RecruitBoard {
 private int rb_no;
 private String rb_name;
 private String rb_content;
 private int rb_status;
 private int rb_hit;
 private String u_id;
 private Timestamp rb_rdate;
 private int startRow;
 private int endRow;
 private String schItem;
 private String schWord;
 
public int getRb_no() {
	return rb_no;
}
public void setRb_no(int rb_no) {
	this.rb_no = rb_no;
}
public String getRb_name() {
	return rb_name;
}
public void setRb_name(String rb_name) {
	this.rb_name = rb_name;
}
public String getRb_content() {
	return rb_content;
}
public void setRb_content(String rb_content) {
	this.rb_content = rb_content;
}
public int getRb_status() {
	return rb_status;
}
public void setRb_status(int rb_status) {
	this.rb_status = rb_status;
}
public int getRb_hit() {
	return rb_hit;
}
public void setRb_hit(int rb_hit) {
	this.rb_hit = rb_hit;
}
public String getU_id() {
	return u_id;
}
public void setU_id(String u_id) {
	this.u_id = u_id;
}
public Timestamp getRb_rdate() {
	return rb_rdate;
}
public void setRb_rdate(Timestamp rb_rdate) {
	this.rb_rdate = rb_rdate;
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
@Override
public String toString() {
	return "RecruitBoard [rb_no=" + rb_no + ", rb_name=" + rb_name + ", rb_content=" + rb_content + ", rb_status="
			+ rb_status + ", rb_hit=" + rb_hit + ", u_id=" + u_id + ", rb_rdate=" + rb_rdate + ", startRow=" + startRow
			+ ", endRow=" + endRow + ", schItem=" + schItem + ", schWord=" + schWord + "]";
}

 
}
