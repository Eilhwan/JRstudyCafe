package com.jr.studycafe.dao;

import java.util.List;

import com.jr.studycafe.dto.Book;

public interface BookDao {
	public List<Book> bookList(Book book);
	public List<Book> bookList_present(Book book);
	public List<Book> bookList_past(Book book);
	public int bookcnt(Book book);
	public int booking(Book book);
	public Book book_detail(int bk_no);
	public int book_delete(int bk_no);
	public int book_Confirm(Book book);
	public List<Book> bookviewlist(Book book);
}
