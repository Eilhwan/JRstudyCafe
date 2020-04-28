package com.jr.studycafe.dto;

public class Studygroup {
	private int sg_no;
	private String sg_name;
	private String u_id;
	private String u_name;
	private String sg_person;
	private String sg_explain;
	private String sg_img;
	private int st_no;
	public int getSg_no() {
		return sg_no;
	}
	public void setSg_no(int sg_no) {
		this.sg_no = sg_no;
	}
	public String getSg_name() {
		return sg_name;
	}
	public void setSg_name(String sg_name) {
		this.sg_name = sg_name;
	}
	public String getU_id() {
		return u_id;
	}
	
	public String getSg_img() {
		return sg_img;
	}
	public void setSg_img(String sg_img) {
		this.sg_img = sg_img;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getSg_person() {
		return sg_person;
	}
	public void setSg_person(String sg_person) {
		this.sg_person = sg_person;
	}
	public String getSg_explain() {
		return sg_explain;
	}
	public void setSg_explain(String sg_explain) {
		this.sg_explain = sg_explain;
	}
	public int getSt_no() {
		return st_no;
	}
	public void setSt_no(int st_no) {
		this.st_no = st_no;
	}
	
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	@Override
	public String toString() {
		return "StudyGroup [sg_no=" + sg_no + ", sg_name=" + sg_name + ", u_id=" + u_id + ", sg_person=" + sg_person
				+ ", sg_explain=" + sg_explain + ", st_no=" + st_no + "]";
	}
	
	
}
