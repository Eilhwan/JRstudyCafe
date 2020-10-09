package com.jr.studycafe.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class Book {
	private int bk_no;
	private Date bk_date;
	private Timestamp bk_stime;
	private int bk_status;
	private int bk_tp;
	private int bk_tt;
	private Date bk_rdate;
	private Timestamp bk_etime;
	private int startRow;
	private int endRow;
	private String schItem;
	private String schWord;
	private String u_id;
	private int r_no;
	private String subscriber;
	private String roomname;
	public Book() {
		super();
	}
	
	public Book(int bk_no, Date bk_date, Timestamp bk_stime, int bk_status, int bk_tp, int bk_tt, Date bk_rdate,
			Timestamp bk_etime, int startRow, int endRow, String schItem, String schWord, String u_id, int r_no,
			String subscriber, String roomname) {
		this.bk_no = bk_no;
		this.bk_date = bk_date;
		this.bk_stime = bk_stime;
		this.bk_status = bk_status;
		this.bk_tp = bk_tp;
		this.bk_tt = bk_tt;
		this.bk_rdate = bk_rdate;
		this.bk_etime = bk_etime;
		this.startRow = startRow;
		this.endRow = endRow;
		this.schItem = schItem;
		this.schWord = schWord;
		this.u_id = u_id;
		this.r_no = r_no;
		this.subscriber = subscriber;
		this.roomname = roomname;
	}

	public int getBk_no() {
		return bk_no;
	}
	public void setBk_no(int bk_no) {
		this.bk_no = bk_no;
	}
	public Date getBk_date() {
		return bk_date;
	}
	public void setBk_date(Date bk_date) {
		this.bk_date = bk_date;
	}
	public Timestamp getBk_stime() {
		return bk_stime;
	}
	public void setBk_stime(Timestamp bk_stime) {
		this.bk_stime = bk_stime;
	}
	public int getBk_status() {
		return bk_status;
	}
	public void setBk_status(int bk_status) {
		this.bk_status = bk_status;
	}
	public int getBk_tp() {
		return bk_tp;
	}
	public void setBk_tp(int bk_tp) {
		this.bk_tp = bk_tp;
	}
	public int getBk_tt() {
		return bk_tt;
	}
	public void setBk_tt(int bk_tt) {
		this.bk_tt = bk_tt;
	}
	public Date getBk_rdate() {
		return bk_rdate;
	}
	public void setBk_rdate(Date bk_rdate) {
		this.bk_rdate = bk_rdate;
	}
	public Timestamp getBk_etime() {
		return bk_etime;
	}
	public void setBk_etime(Timestamp bk_etime) {
		this.bk_etime = bk_etime;
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
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	
	public String getSubscriber() {
		return subscriber;
	}

	public void setSubscriber(String subscriber) {
		this.subscriber = subscriber;
	}

	public String getRoomname() {
		return roomname;
	}

	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}

	@Override
	public String toString() {
		return "Book [bk_no=" + bk_no + ", bk_date=" + bk_date + ", bk_stime=" + bk_stime + ", bk_status=" + bk_status
				+ ", bk_tp=" + bk_tp + ", bk_tt=" + bk_tt + ", bk_rdate=" + bk_rdate + ", bk_etime=" + bk_etime
				+ ", startRow=" + startRow + ", endRow=" + endRow + ", schItem=" + schItem + ", schWord=" + schWord
				+ ", u_id=" + u_id + ", r_no=" + r_no + ", subscriber=" + subscriber + ", roomname=" + roomname + "]";
	}

	
	
	
}
