package com.jr.studycafe.controller;

import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jr.studycafe.dto.Book;
import com.jr.studycafe.dto.Room;
import com.jr.studycafe.service.BookService;
import com.jr.studycafe.service.RoomService;
import com.jr.studycafe.util.Paging;

@Controller
public class BookController {
	@Autowired
	private BookService bookService;
	@Autowired
	private RoomService roomService;
	
	@RequestMapping(value="bookingView")
	public String booking(Model model, Book book, Room room) {
		model.addAttribute("room_booklist", roomService.room_booklist());
		//model.addAttribute("book_list", bookService.bookList(book));
		model.addAttribute("book_list", bookService.bookviewlist(book));
		return "book/book_view";
	}
	@RequestMapping(value = "bookingViewList")
	public String bookingViewList(Model model, Book book) {
		model.addAttribute("book_list", bookService.bookviewlist(book));
		return "book/bookingViewList";
	}
	@RequestMapping(value="booking")
	public String book(int bk_no, Model model, Date bk_date, String bk_stime, String bk_etime, int r_no) {
		System.out.println(bk_stime);
		System.out.println(bk_etime);
		Book book = new Book();
		Timestamp bk_stimeTemp = Timestamp.valueOf(bk_stime);
		Timestamp bk_etimeTemp = Timestamp.valueOf(bk_etime);
		book.setBk_stime(bk_stimeTemp);
		book.setBk_etime(bk_etimeTemp);
		book.setBk_date(bk_date);
		book.setR_no(r_no);
		if(bookService.book_Confirm(book)>=1) {
			model.addAttribute("bookConfirm", "예약중이라 예약이 가능하지않습니다.");
			return "forward:bookingView.do";
		}
		model.addAttribute("bookList", book);
		model.addAttribute("detail", bookService.book_detail(bk_no));
		return "book/book_content_view";
	}
	
	
	@RequestMapping(value="bookListView_present")
	public String bookList_present(Model model, Book book, String pageNum) {
		int pageSize = 15;
		int blockSize = 3;
		Paging paging = new Paging(bookService.bookcnt(book), pageNum, pageSize, blockSize);
		book.setStartRow(paging.getStartRow());
		book.setEndRow(paging.getEndRow());
		model.addAttribute("bookList_present", bookService.bookList_present(book));
		model.addAttribute("paging", paging);
		return "book/book_list_present";
	}
	@RequestMapping(value="bookListView_past")
	public String bookList_past(Model model, Book book, String pageNum) {
		int pageSize = 15;
		int blockSize = 3;
		Paging paging = new Paging(bookService.bookcnt(book), pageNum, pageSize, blockSize);
		book.setStartRow(paging.getStartRow());
		book.setEndRow(paging.getEndRow());
		model.addAttribute("bookList_past", bookService.bookList_past(book));
		model.addAttribute("paging", paging);
		return "book/book_list_past";
	}
}
