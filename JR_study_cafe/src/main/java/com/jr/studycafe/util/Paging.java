package com.jr.studycafe.util;

public class Paging {
	private int currentPage = 1;
	private int pageSize;
	private int blockSize;
	private int startRow;
	private int endRow;
	private int total;
	private int pageCnt;
	private int startPage;
	private int endPage;
	
	public Paging(int total, String pageNum, int pageSize, int blockSize) {
		if(pageNum!=null) {
			currentPage = Integer.parseInt(pageNum);
		}
		this.pageSize = pageSize;
		this.blockSize = blockSize;
		startRow = (currentPage-1) * pageSize +1;
		endRow = startRow + pageSize -1;
		this.total = total;
		pageCnt = (int)Math.ceil((double)total/pageSize);
		startPage = ((currentPage-1) / blockSize) * blockSize +1;
		startPage = currentPage - (currentPage-1)%blockSize;
		endPage = startPage + blockSize -1;
		if(endPage > pageCnt) {
			endPage = pageCnt;
		}
	}
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getBlockSize() {
		return blockSize;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
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
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getPageCnt() {
		return pageCnt;
	}
	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
}
