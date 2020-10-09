package com.jr.studycafe.dto;

public class Room {
	private int r_no;
	private String r_name;
	private String r_image;
	private int r_ppr;
	private int r_pph;
	private int r_status;
	
	private int ro_air;
	private int ro_chair;
	private int ro_print;
	private int ro_smoke;
	private int ro_pc;
	private int ro_tv;
	private int ro_wifi;
	private int ro_board;
	
	private int startRow;
	private int EndRow;
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getR_image() {
		return r_image;
	}
	public void setR_image(String r_image) {
		this.r_image = r_image;
	}
	public int getR_ppr() {
		return r_ppr;
	}
	public void setR_ppr(int r_ppr) {
		this.r_ppr = r_ppr;
	}
	public int getR_pph() {
		return r_pph;
	}
	public void setR_pph(int r_pph) {
		this.r_pph = r_pph;
	}
	public int getR_status() {
		return r_status;
	}
	public void setR_status(int r_status) {
		this.r_status = r_status;
	}
	public int getRo_air() {
		return ro_air;
	}
	public void setRo_air(int ro_air) {
		this.ro_air = ro_air;
	}
	public int getRo_chair() {
		return ro_chair;
	}
	public void setRo_chair(int ro_chair) {
		this.ro_chair = ro_chair;
	}
	public int getRo_print() {
		return ro_print;
	}
	public void setRo_print(int ro_print) {
		this.ro_print = ro_print;
	}
	public int getRo_smoke() {
		return ro_smoke;
	}
	public void setRo_smoke(int ro_smoke) {
		this.ro_smoke = ro_smoke;
	}
	public int getRo_pc() {
		return ro_pc;
	}
	public void setRo_pc(int ro_pc) {
		this.ro_pc = ro_pc;
	}
	public int getRo_tv() {
		return ro_tv;
	}
	public void setRo_tv(int ro_tv) {
		this.ro_tv = ro_tv;
	}
	public int getRo_wifi() {
		return ro_wifi;
	}
	public void setRo_wifi(int ro_wifi) {
		this.ro_wifi = ro_wifi;
	}
	public int getRo_board() {
		return ro_board;
	}
	public void setRo_board(int ro_board) {
		this.ro_board = ro_board;
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
		return "StudyRoom [r_no=" + r_no + ", r_name=" + r_name + ", r_image=" + r_image + ", r_ppr=" + r_ppr
				+ ", r_pph=" + r_pph + ", r_status=" + r_status + ", ro_air=" + ro_air + ", ro_chair=" + ro_chair
				+ ", ro_print=" + ro_print + ", ro_smoke=" + ro_smoke + ", ro_pc=" + ro_pc + ", ro_tv=" + ro_tv
				+ ", ro_wifi=" + ro_wifi + ", ro_board=" + ro_board + "]";
	}
	
	

}
