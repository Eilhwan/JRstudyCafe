package com.jr.studycafe.controller;

import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jr.studycafe.dto.Book;
import com.jr.studycafe.dto.Room;
import com.jr.studycafe.dto.Users;
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
	public String booking(Model model, Book book, Room room, String u_id, String u_name) {
		model.addAttribute("room_booklist", roomService.room_booklist());
		//model.addAttribute("book_list", bookService.bookList(book));
		model.addAttribute("book_list", bookService.bookviewlist(book));
		model.addAttribute("u_id", u_id);
		model.addAttribute("u_name", u_name);
		System.out.println(bookService.bookviewlist(book));
		return "book/book_view";
	}
	@RequestMapping(value = "bookingViewList")
	public String bookingViewList(Model model, Book book) {
		model.addAttribute("book_list", bookService.bookviewlist(book));
		return "book/bookingViewList";
	}
	@RequestMapping(value="booking")
	public String book(Model model, Date bk_date, String bk_stime, String bk_etime, int r_no, Room room) {
		System.out.println(bk_stime);
		System.out.println(bk_etime);
		Book book = new Book();
		Timestamp bk_stimeTemp = Timestamp.valueOf(bk_stime);
		Timestamp bk_etimeTemp = Timestamp.valueOf(bk_etime);
		book.setBk_stime(bk_stimeTemp);
		book.setBk_etime(bk_etimeTemp);
		book.setBk_date(bk_date);
		book.setR_no(r_no);
		System.out.println(book);
		if(bookService.book_Confirm(book)>=1) {
			model.addAttribute("bookConfirm", "예약중이라 예약이 가능하지않습니다.");
			return "forward:bookingView.do";
		}
		model.addAttribute("bookList", book);
		model.addAttribute("room", room);
		model.addAttribute("roomdetail", roomService.room_detail(r_no));
		return "book/book_content_view";
	}
	@RequestMapping(value="bookingfinal")
	public String bookfinal(Model model, Book book, String tempbk_stime, String tempbk_etime) {
		System.out.println(tempbk_etime);
		System.out.println(tempbk_stime);
		book.setBk_stime(Timestamp.valueOf(tempbk_stime));
		book.setBk_etime(Timestamp.valueOf(tempbk_etime));
		System.out.println(book);
		model.addAttribute("booking", bookService.booking(book));
		return "redirect:bookListView_present.do";
	}
	
	
	@RequestMapping(value="bookdetail")
	public String bookdetail(int bk_no, Model model) {
		model.addAttribute("detail", bookService.book_detail(bk_no));
		return "book/book_content_view";
	}
	@RequestMapping(value="bookListView_present")
	public String bookList_present(Model model, Book book, String pageNum, HttpSession httpSession) {
		int pageSize = 15;
		int blockSize = 3;
		System.out.println(book);
		String u_name = ((Users)httpSession.getAttribute("users")).getU_name();
		String u_id = ((Users)httpSession.getAttribute("users")).getU_id();
		book.setSubscriber(u_name);
		Paging paging = new Paging(bookService.bookcnt_present(u_id), pageNum, pageSize, blockSize);
		book.setStartRow(paging.getStartRow());
		book.setEndRow(paging.getEndRow());
		model.addAttribute("bookList_present", bookService.bookList_present(book));
		model.addAttribute("paging", paging);
		int orderNum = paging.getStartRow();
		model.addAttribute("orderNum", orderNum);
		return "book/book_list_present";
	}
	@RequestMapping(value="bookListView_past")
	public String bookList_past(Model model, Book book, String pageNum, HttpSession httpSession) {
		int pageSize = 15;
		int blockSize = 3;
		System.out.println(book);
		String u_name = ((Users)httpSession.getAttribute("users")).getU_name();
		String u_id = ((Users)httpSession.getAttribute("users")).getU_id();
		book.setSubscriber(u_name);
		Paging paging = new Paging(bookService.bookcnt_past(u_id), pageNum, pageSize, blockSize);
		book.setStartRow(paging.getStartRow());
		book.setEndRow(paging.getEndRow());
		model.addAttribute("bookList_past", bookService.bookList_past(book));
		model.addAttribute("paging", paging);
		int orderNum = paging.getStartRow();
		model.addAttribute("orderNum", orderNum);
		return "book/book_list_past";
	}
}
