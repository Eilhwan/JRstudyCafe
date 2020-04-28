package com.jr.studycafe.dto;

public class Studymember {
	private int sm_no;
	private String u_id;
	private int sg_no;
	private String sg_name;
	private int sm_status;
	public int getSm_no() {
		return sm_no;
	}
	public void setSm_no(int sm_no) {
		this.sm_no = sm_no;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
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
	public int getSm_status() {
		return sm_status;
	}
	public void setSm_status(int sm_status) {
		this.sm_status = sm_status;
	}
	@Override
	public String toString() {
		return "Studymember [sm_no=" + sm_no + ", u_id=" + u_id + ", sg_no=" + sg_no + ", sg_name=" + sg_name
				+ ", sm_status=" + sm_status + "]";
	}
	
	
}
