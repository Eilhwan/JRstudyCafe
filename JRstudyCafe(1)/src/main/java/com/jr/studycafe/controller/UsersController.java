package com.jr.studycafe.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jr.studycafe.dao.UsersDao;
import com.jr.studycafe.dto.Messanger;
import com.jr.studycafe.dto.Users;
import com.jr.studycafe.service.MessangerService;
import com.jr.studycafe.service.UsersService;
import com.jr.studycafe.util.Paging;

@Controller
public class UsersController {
	@Autowired
	private UsersService uService;
	@Autowired
	private UsersDao usersDao;
	@Autowired
	private MessangerService mService;

	
	@ModelAttribute
	public String messageCnt(HttpSession session, Model model) {
		if (session.getAttribute("users") != null) {
			Users user = (Users) session.getAttribute("users");
			String u_id = user.getU_id();			
			model.addAttribute("msgcnt", mService.unReadMsgCnt(u_id));
		}
		return "main/header";
	}
	@RequestMapping(value = "main")
	public String main() {
		
		return"main/main";
	}
	
	// join 뷰페이지
	@RequestMapping(value = "joinView", method = RequestMethod.GET)
	public String joinView() {
		
		return"users/join_view";
	}
	// id 중복확인
	@RequestMapping(value = "idConfirm", method = RequestMethod.GET)
	public String idConfirm(Model model, String u_id) {
		int result = uService.u_idCofirm(u_id);
		if(result==1) {
			model.addAttribute("result", "중복된 ID입니다.");
			return "users/idConfirm";
		}else {
			model.addAttribute("result", "사용가능한 ID입니다.");
			return "users/idConfirm";
		}
	}
	
	// join 처리
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(HttpSession httpSession, Model model, Users users, MultipartHttpServletRequest mRequest) {
		int result = uService.u_join(users, httpSession, mRequest);
		if(result ==1) {
			return"forward:loginView.do";
		}else {
			model.addAttribute("joinResult", "회원가입실패");
			return"forward:joinView.do";
		}
	}
	
	// login 뷰페이지
	@RequestMapping(value = "loginView")
	public String loginView() {
		
		return"users/login_view";
	}
	
	// login 처리 
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginw(HttpSession httpSession, Model model, String u_id, String u_pw) {
		String result = uService.loginCheck(u_id, u_pw, httpSession);
		if(result.equals("로그인 성공")) {
			return"redirect:main.do";
		}else {
			model.addAttribute("u_id", u_id);
			model.addAttribute("u_pw", u_pw);
			model.addAttribute("result", result);			
			return "forward:loginView.do";
		}
	
	}
	
	// 아이디 찾기 뷰페이지
	@RequestMapping(value = "idfindView", method = RequestMethod.GET)
	public String idfindView() {
			
	return"users/uidfind_view";
	}
	
	// 아이디 찾기
	@RequestMapping(value = "idfind", method = RequestMethod.POST)
	public String u_findId(String u_email, String u_name, HttpServletResponse response) throws IOException {
	response.setCharacterEncoding("UTF-8");
	PrintWriter out = response.getWriter();
	if(usersDao.u_findId(u_email, u_name) == true) {
		Users u = usersDao.u_getId(u_email, u_name);
		String id= u.getU_id();
		out.write("({'result':입력하신 정보와 일치하는 아이디는 " +id+"입니다.'})");
	}else {
		out.write("({'result': '입력하신 정보로 찾을 수 없습니다.'})");
	}
	return"users/login_view";
	}
	
	// 비밀번호 찾기 뷰페이지
	@RequestMapping(value = "pwfindView", method = RequestMethod.GET)
	public String pwfindView() {
			
	return"users/upwfind";
	}
	
	// 비밀번호 찾기 
	@RequestMapping(value = "pwfind", method = RequestMethod.GET)
	public String pwfind(Model model, Users users) {
		Users us = uService.u_getUsers(users.getU_id());
		if(users.getU_id()!=null && !users.getU_id().equals("")) {
			if(us!=null) {
				if(us.getU_email().equals(users.getU_email())) {
					model.addAttribute("u_id", users.getU_id());
					model.addAttribute("resultupwfind", "임시 비밀번호 전송완료");
					uService.u_pwfind(users);
					return "forward:loginView.do";
				}else {
					model.addAttribute("resultEmail", "이메일을 확인하세요");
					model.addAttribute("u_id", users.getU_id());
					model.addAttribute("u_email", users.getU_email());
					return "forward:pwfindView.do";
				}
			}else {
				model.addAttribute("resultId", "없는 ID입니다.");
				model.addAttribute("u_id", users.getU_id());
				return "forward:pwfindView.do";
			}
		}else {
			model.addAttribute("resultId", "ID를 입력하세요.");
			return "forward:pwfindView.do";
		}
	}
	@RequestMapping(value="logout")
	public String logout(HttpSession httpSession) {
		httpSession.invalidate();
		return "redirect:main.do";
	}
	@RequestMapping(value="modifyView")
	public String modifyView() {
		return"users/modify_view";
	}
	@RequestMapping(value="modify", method = RequestMethod.POST)
	public String modify(Users users, Model model, HttpSession httpSession, MultipartHttpServletRequest mRequest) {
		int result = uService.u_modify(users, httpSession, mRequest);
		if(result==1) {//수정성공
		model.addAttribute("modifyResult", result);
		uService.u_modify(users, httpSession, mRequest);
			return "forward:main.do";
		}else {
			return "forward:modifyView";
		}
	}

	//메신저 리스트
	@RequestMapping(value="MessangerList", method = RequestMethod.GET)
	public String MessangerList(Messanger messanger, String pageNum, HttpSession session, Model model) {
		
		int pageSize = 10;
		int blockSize = 10;
		Users users = (Users) session.getAttribute("users");
		String u_id = users.getU_id();
		System.out.println(u_id);
		Paging paging = new Paging(mService.msgCnt(u_id), pageNum, pageSize, blockSize);
		messanger.setStartRow(paging.getStartRow());
		messanger.setEndRow(paging.getEndRow());
		messanger.setM_reciever(u_id);
		model.addAttribute("messages", mService.messangerList(messanger));
		model.addAttribute("paging", paging);
		return "users/message_list";
	}
	//메시지 확인
	@RequestMapping(value="messageDetail", method = RequestMethod.GET)
	public String messageDetail(int m_no, Model model) {
		Messanger messanger = mService.messageDetail(m_no);
		if (messanger.getM_status() == 2) {
			mService.readMessage(m_no);			
		}
		model.addAttribute("message", messanger);
		return "users/message_detail";
	}
	@RequestMapping(value="messageDelete", method = RequestMethod.GET)
	public String messageDelete(String checked[], Model model) {
		
		if(mService.deleteMessage(checked) == 1) {
			model.addAttribute("resultmsg", checked.length + " 개의 메시지를 성공적으로 삭제 했습니다.");
		}else {
			model.addAttribute("resultmsg", "메시지 삭제를 실패하였습니다.");			
		}
		
		return "forward:MessangerList.do";
	}
	@RequestMapping(value="userMessagnerSendView", method=RequestMethod.GET)
	public String userMessagnerSendView() {
		
		return "users/user_message";
	}
	@RequestMapping(value="userMessagnerSend", method=RequestMethod.POST)
	public String userMessagnerSend(Messanger messanger, HttpSession session, Model model) {
		Users users = (Users) session.getAttribute("users");
		messanger.setM_sender(users.getU_id());
		int result = mService.messangerSend(messanger);
		if (result == 0) {
			model.addAttribute("resultmsg", "수신자가 존재하지 않습니다.");
			return "users/user_message";
		}
		return "redirect:MessangerList.do";
	}
	@RequestMapping(value="userProfile", method=RequestMethod.GET)
	public String userProfile(String u_id, Model model) {
		model.addAttribute("user", uService.u_getUsers(u_id));
		return "users/user_profile";
	}

}
