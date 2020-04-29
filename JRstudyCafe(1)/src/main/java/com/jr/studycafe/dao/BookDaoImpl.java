package com.jr.studycafe.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jr.studycafe.dto.Book;
@Repository
public class BookDaoImpl implements BookDao {
	@Autowired
	private SqlSessionTemplate template;
	
	@Override
	public List<Book> bookList(Book book) {
		return template.selectList("bookList", book);
	}

	@Override
	public int bookcnt(Book book) {
		return template.selectOne("bookcnt", book);
	}

	@Override
	public int booking(Book book) {
		return template.insert("booking", book);
	}

	@Override
	public Book book_detail(int bk_no) {
		return template.selectOne("book_detail", bk_no);
	}

	@Override
	public int book_delete(int bk_no) {
		return template.update("book_delete", bk_no);
	}

	@Override
	public int book_Confirm(Book book) {
		return template.selectOne("book_Confirm", book);
	}

	@Override
	public List<Book> bookList_present(Book book) {
		return template.selectList("bookList_present", book);
	}

	@Override
	public List<Book> bookList_past(Book book) {
		return template.selectList("bookList_past", book);
	}
	@Override
	public List<Book> bookviewlist(Book book) {
		return template.selectList("bookviewlist", book);
	}

}
