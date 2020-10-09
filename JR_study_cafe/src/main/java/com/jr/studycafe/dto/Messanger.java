package com.jr.studycafe.dto;

public class Messanger {
	private int m_no;
	private String m_title;
	private String m_content;
	private int m_status;
	private String m_reciever;
	private String m_sender;
	private String m_sendtime;
	
	private int startRow;
	private int endRow;

	
	public String getM_sendtime() {
		return m_sendtime;
	}
	public void setM_sendtime(String m_sendtime) {
		this.m_sendtime = m_sendtime;
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
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getM_title() {
		return m_title;
	}
	public void setM_title(String m_title) {
		this.m_title = m_title;
	}
	public String getM_content() {
		return m_content;
	}
	public void setM_content(String m_content) {
		this.m_content = m_content;
	}
	public int getM_status() {
		return m_status;
	}
	public void setM_status(int m_status) {
		this.m_status = m_status;
	}
	public String getM_reciever() {
		return m_reciever;
	}
	public void setM_reciever(String m_reciever) {
		this.m_reciever = m_reciever;
	}
	public String getM_sender() {
		return m_sender;
	}
	public void setM_sender(String m_sender) {
		this.m_sender = m_sender;
	}
	@Override
	public String toString() {
		return "Messanger [m_no=" + m_no + ", m_title=" + m_title + ", m_content=" + m_content + ", m_status="
				+ m_status + ", m_reciever=" + m_reciever + ", m_sender=" + m_sender + "]";
	}
	
	
}
