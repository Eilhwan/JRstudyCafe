package com.tj.test01.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.test01.dto.B;
import com.tj.test01.service.BService;
import com.tj.test01.service.Paging;
@Controller
public class BController {
	@Autowired
	private BService bService;
	@RequestMapping(value="list")
	public String list(Model model, B b, String pageNum) {
		Paging paging = new Paging(bService.cnt(b), pageNum);
		b.setStartRow(paging.getStartRow());
		b.setEndRow(paging.getEndRow());
		model.addAttribute("paging", paging);
		model.addAttribute("list", bService.list(b));
		return "board/list";
	}
	@RequestMapping(value="writeForm", method = RequestMethod.GET)
	public String writeForm() {
		return "board/writeForm";
	}
	@RequestMapping(value="write", method = RequestMethod.POST)
	public String write(B b, MultipartHttpServletRequest mRequest) {
		bService.write(mRequest, b);
		return "redirect:list.do";
	}
	@RequestMapping(value="detail", method = RequestMethod.GET)
	public String detail(int bno, Model model) {
		model.addAttribute("detail", bService.detail(bno));
		return "board/detail";
	}
	@RequestMapping(value="updateForm", method = RequestMethod.GET)
	public String updateForm(int bno, Model model) {
		model.addAttribute("updateDto", bService.detail(bno));
		return "board/updateForm";
	}
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(MultipartHttpServletRequest mRequest, Model model) {
		model.addAttribute("test",bService.update(mRequest, model));
		return "forward:list.do";
	}
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String delete(int bno, Model model) {
		model.addAttribute("deleteResult",bService.delete(bno));
		return "forward:list.do";
	}
}
