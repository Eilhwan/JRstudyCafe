package com.jr.studycafe.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jr.studycafe.dto.Admin;
import com.jr.studycafe.dto.Messanger;
import com.jr.studycafe.dto.Room;
import com.jr.studycafe.dto.Users;
import com.jr.studycafe.service.AdminService;
import com.jr.studycafe.service.MessangerService;
import com.jr.studycafe.service.RoomService;
import com.jr.studycafe.util.Paging;

@Controller
@RequestMapping("admin")
public class AdminController {
	@Autowired
	private AdminService aService;
	@Autowired
	private RoomService rService;
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
	
	@RequestMapping(value="adminLoginView", method=RequestMethod.GET)
	public String adminLoginView() {
		return "admin/admin_login_view";
	}
	@RequestMapping(value="adminLogin", method=RequestMethod.POST)
	public String adminLogin(Admin admin, HttpSession session, Model model) {
		if (aService.loginChk_admin(admin) == 0) {
			model.addAttribute("result_msg", "아이디와 비밀번호를 확인해주세요.");
		}else {
			aService.login_admin(admin, session);
			model.addAttribute("result_msg", "로그인 되었습니다.");
			
		}
		return "redirect:../main.do";
	}
	@RequestMapping(value="listUser", method=RequestMethod.GET)
	public String listUser(String pageNum, Model model) {
		int pageSize = 10;
		int blockSize = 10;
		Paging paging = new Paging(aService.get_users_tot(), pageNum, pageSize, blockSize);
		model.addAttribute("users", aService.list_users(pageNum));
		model.addAttribute("paging", paging);

		return "admin/admin_user_list";
	}
	@RequestMapping(value="adminEnrollView")
	public String adminEnrollView() {
		return "admin/admin_enroll_view";
	}
	@RequestMapping(value = "adminIdConfirm", method = RequestMethod.GET)
	public String idConfirm(Model model, String a_id) {
		int result = aService.a_idConfirm(a_id);
		if(result==1) {
			model.addAttribute("result", "중복된 ID입니다.");
			return "admin/admin_idConfirm";
		}else {
			model.addAttribute("result", "사용가능한 ID입니다.");
			return "admin/admin_idConfirm";
		}
	}
	@RequestMapping(value="adminEnroll", method=RequestMethod.POST)
	public String adminEnroll(Model model, Admin admin) {
		int result = aService.insert_admin(admin);
		if(result ==1) {
			return "forward:listAdmin.do";
		}else {
			model.addAttribute("insertResult", "관리자 등록에 실패하였습니다.");
			return "forward:adminEnrollView.do";
		}
	}
	@RequestMapping(value="listAdmin")
	public String adminEnroll(String pageNum, Model model, Admin admin) {
		int pageSize = 5;
		int blockSize = 5;
		Paging paging = new Paging(aService.get_admins_tot(), pageNum, pageSize, blockSize);
		model.addAttribute("admins", aService.list_admins(pageNum));
		model.addAttribute("paging", paging);
		return "admin/admin_admin_list";
	}
	@RequestMapping(value="adminDelete", method = RequestMethod.GET)
	public String adminDelete(String a_id, Model model) {
		int result = aService.delete_admin(a_id);
		if(result ==1) {
			model.addAttribute("deleteResult", "관리자("+a_id+") 삭제에 성공하였습니다.");
		}else {
			model.addAttribute("deleteResult", "관리자("+a_id+") 삭제에 실패하였습니다.");
		}
		return "forward:listAdmin.do";
	}
	@RequestMapping(value="studyroomList", method= {RequestMethod.GET, RequestMethod.POST})
	public String studyroomList(String pageNum, Model model) {
		int pageSize = 10;
		int blockSize = 10;
		Paging paging = new Paging(rService.room_cnt(), pageNum, pageSize, blockSize);
		model.addAttribute("rooms", rService.room_list(pageNum));
		model.addAttribute("paging", paging);

		return "admin/studyroom_list_view";
	}
	@RequestMapping(value="studyroomInsertView", method=RequestMethod.GET)
	public String studyroomInsertView(String pageNum, Model model) {
		return "admin/studyroom_insert_view";
	}
	
	@RequestMapping(value="studyroomDetail", method=RequestMethod.GET)
	public String studyroomDetail(int r_no, String pageNum, Model model) {
		model.addAttribute("room", rService.room_detail(r_no));
		return "admin/studyroom_detail_view";
	}
	
	@RequestMapping(value="studyroomInsert", method=RequestMethod.POST)
	public String studyroomInsert(MultipartHttpServletRequest mRequest, Room room, Model model) {
		
		rService.room_register(room, mRequest);
		return "forward:studyroomList.do";
	}
	@RequestMapping(value="searchUser", method=RequestMethod.GET)
	public String searchUser(Admin admin, String pageNum, Model model) {
		int pageSize = 10;
		int blockSize = 10;
		Paging paging = new Paging(aService.get_users_tot(), pageNum, pageSize, blockSize);
		model.addAttribute("paging", paging);
		model.addAttribute("users", aService.search_user(admin));
		return "admin/admin_user_list";
	}
	@RequestMapping(value="userProfile", method=RequestMethod.GET)
	public String userProfile(String u_id, Model model) {
		model.addAttribute("users", aService.user_profile(u_id));
		return "admin/user_profile";
	}
	@RequestMapping(value="adminMessagner", method=RequestMethod.GET)
	public String adminMessagner(Users users) {
		
		return "admin/admin_message";
	}
	//여기부터
	@RequestMapping(value="adminMessagnerSend", method=RequestMethod.POST)
	public String adminMessagnerSend(Messanger messanger, HttpSession session) {
		Admin admin = (Admin) session.getAttribute("admin");
		messanger.setM_sender(admin.getA_id());
		System.out.println(messanger);
		mService.messangerSend(messanger);
		return "admin/admin_message";
	}
	@RequestMapping(value="userBlack", method=RequestMethod.GET)
	public String adminMessagnerSend(String u_id) {
		aService.black_user(u_id);
		
		return "forward:listUser.do";
	}
	@RequestMapping(value="deleteRoom", method=RequestMethod.GET)
	public String deleteRoom(int r_no) {
		rService.room_delete(r_no);
		return "forward:studyroomList.do";
	}
	@RequestMapping(value="studyroomModifyView", method=RequestMethod.GET)
	public String modifyRoomView(int r_no, Model model) {
		model.addAttribute("room", rService.room_detail(r_no));
		return "admin/studyroom_modify_view";
	}
	@RequestMapping(value="studyroomModify", method=RequestMethod.POST)
	public String modifyRoom(MultipartHttpServletRequest mRequest, Room room) {
		rService.room_modify(room, mRequest);
		return "forward:studyroomList.do";
	}
}
