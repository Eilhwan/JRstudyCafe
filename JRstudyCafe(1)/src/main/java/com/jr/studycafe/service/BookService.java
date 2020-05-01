package com.jr.studycafe.service;

import java.util.List;

import com.jr.studycafe.dto.Book;

public interface BookService {
	public List<Book> bookList(Book book);
	public List<Book> bookList_present(Book book);
	public List<Book> bookList_past(Book book);
	public int bookcnt_present(String u_id);
	public int bookcnt_past(String u_id);
	public int bookcnt(Book book);
	public int booking(Book book);
	public Book book_detail(int bk_no);
	public int book_delete(int bk_no);
	public int book_Confirm(Book book);
	public List<Book> bookviewlist(Book book);
}
