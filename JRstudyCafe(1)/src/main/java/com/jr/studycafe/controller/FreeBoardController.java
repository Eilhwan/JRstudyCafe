package com.jr.studycafe.controller;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jr.studycafe.dto.FreeBoard;
import com.jr.studycafe.service.FreeBoardService;
import com.jr.studycafe.util.Paging;

@Controller
public class FreeBoardController {
	@Autowired
	private FreeBoardService bService;
	private int writable = 0;
	private int hitable = 1;
	@RequestMapping(value="freeBoardList")
	public String freeBoardList(Model model, FreeBoard b, String pageNum) {
		int pageSize = 15;
		int blockSize = 3;
		hitable = 1;
		Paging paging = new Paging(bService.freeBoardCnt(b), pageNum, pageSize, blockSize);
		b.setStartRow(paging.getStartRow());
		b.setEndRow(paging.getEndRow());
		model.addAttribute("freeBoardList", bService.freeBoardList(b));
		model.addAttribute("paging", paging);
		return "freeBoard/list";
	}
	@RequestMapping(value="dummyinsert", method = RequestMethod.GET)
	public String dummyinsert() {
		bService.insert50();
		return "redirect:freeBoardList.do";
	}
	@RequestMapping(value="freeBoardDetail", method = RequestMethod.GET)
	public String detail(FreeBoard b, Model model ) {
		if(hitable == 1) {
			bService.freeBoardHit(b.getFb_no());
			model.addAttribute("detail", bService.freeBoardDetail(b.getFb_no()));
			model.addAttribute("freeLikesCnt", bService.freeLikesCnt(b));
			hitable = 0;
			return "freeBoard/detail";
		} else {
			model.addAttribute("detail", bService.freeBoardDetail(b.getFb_no()));
			model.addAttribute("freeLikesCnt", bService.freeLikesCnt(b));
			return "freeBoard/detail";
		}
	}
	@RequestMapping(value="freeBoardUsersWriteView", method = RequestMethod.GET)
	public String freeBoardUsersWriteView(String u_id, String u_nickname, Model model) {
		writable = 1;
		model.addAttribute("u_id", u_id);
		model.addAttribute("u_nickname", u_nickname);
		return "freeBoard/usersWriteForm";
	}
	@RequestMapping(value="userWrite", method = RequestMethod.POST)
	public String userWrite(FreeBoard b, MultipartHttpServletRequest mRequest) {
		if(writable == 1) {
			bService.freeBoardUserWrite(mRequest, b);
			writable = 0;
		}
		return "forward:freeBoardList.do";
	}
	@RequestMapping(value="freeBoardAdminWriteView", method = RequestMethod.GET)
	public String freeBoardAdminWriteView(String a_id, String a_name, Model model) {
		writable = 1;
		model.addAttribute("a_id", a_id);
		model.addAttribute("a_name", a_name);
		return "freeBoard/adminWriteForm";
	}
	@RequestMapping(value="adminWrite", method = RequestMethod.POST)
	public String adminWrite(FreeBoard b, MultipartHttpServletRequest mRequest) {
		if(writable == 1) {
			bService.freeBoardAdminWrite(mRequest, b);
			writable = 0;
		}
		return "forward:freeBoardList.do";
	}
	@RequestMapping(value="freeBoardDelete", method = RequestMethod.GET)
	public String freeBoardDelete(int fb_no, Model model) {
		int result = bService.freeBoardDelete(fb_no);
		if(result ==1) {
			model.addAttribute("freeBoardDeleteResult",fb_no+"번 글 삭제에 성공하였습니다.");
		}else {
			model.addAttribute("freeBoardDeleteResult",fb_no+"번 글 삭제에 실패하였습니다.");
		}
		return "forward:freeBoardList.do";
	}
	@RequestMapping(value="likeUp")
	public String likeUp(FreeBoard b) {
		bService.freeLikesInsert(b);
		return "forward:freeBoardDetail.do";
	}
	@RequestMapping(value="freeBoardModifyView")
	public String freeBoardModifyView(int fb_no, Model model) {
		model.addAttribute("modifyView", bService.freeBoardDetail(fb_no));
		return "freeBoard/modifyForm";
	}
	@RequestMapping(value="freeBoardModify", method = RequestMethod.POST)
	public String freeBoardModify(FreeBoard b, MultipartHttpServletRequest mRequest) {
			bService.freeBoardUpdate(mRequest, b);
		return "forward:freeBoardList.do";
	}
}
