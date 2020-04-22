package com.tj.test01.dto;

public class B {
	private int bno;
	private String btitle;
	private String bcontent;
	private String bfile;
	private String schItem;
	private String schWord;
	private int startRow;
	private int endRow;
	public B() { }
	public B(int bno, String btitle, String bcontent, String bfile) {
		this.bno = bno;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bfile = bfile;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public String getBfile() {
		return bfile;
	}
	public void setBfile(String bfile) {
		this.bfile = bfile;
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
		return "B [bno=" + bno + ", btitle=" + btitle + ", bcontent=" + bcontent + ", bfile=" + bfile + ", schItem="
				+ schItem + ", schWord=" + schWord + ", startRow=" + startRow + ", endRow=" + endRow + "]";
	}
}
