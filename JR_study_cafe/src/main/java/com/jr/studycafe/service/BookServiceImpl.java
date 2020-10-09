package com.jr.studycafe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.jr.studycafe.dao.BookDao;
import com.jr.studycafe.dto.Book;
@Service
public class BookServiceImpl implements BookService {
	@Autowired
	private BookDao bookDao;
	
	@Override
	public List<Book> bookList(Book book) {
		return bookDao.bookList(book);
	}

	@Override
	public int bookcnt(Book book) {
		return bookDao.bookcnt(book);
	}
	
	@Override
	public int bookcnt_present(String u_id) {
		return bookDao.bookcnt_present(u_id);
	}
	
	@Override
	public int bookcnt_past(String u_id) {
		return bookDao.bookcnt_past(u_id);
	}

	@Override
	public int booking(Book book) {
		return bookDao.booking(book);
	}

	@Override
	public Book book_detail(int bk_no) {
		return bookDao.book_detail(bk_no);
	}

	@Override
	public int book_delete(int bk_no) {
		return bookDao.book_delete(bk_no);
	}

	@Override
	public int book_Confirm(Book book) {
		return bookDao.book_Confirm(book);
	}

	@Override
	public List<Book> bookList_present(Book book) {
		return bookDao.bookList_present(book);
	}

	@Override
	public List<Book> bookList_past(Book book) {
		return bookDao.bookList_past(book);
	}
	
	@Override
	public List<Book> bookviewlist(Book book) {
		return bookDao.bookviewlist(book);
	}

}
