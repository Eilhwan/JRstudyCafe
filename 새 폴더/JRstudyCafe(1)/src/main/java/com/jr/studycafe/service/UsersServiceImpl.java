package com.jr.studycafe.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.util.Iterator;
import java.util.UUID;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jr.studycafe.dao.UsersDao;
import com.jr.studycafe.dto.Users;
@Service
public class UsersServiceImpl implements UsersService {
	@Autowired
	private UsersDao uDao; 
	@Autowired
	private JavaMailSenderImpl mailSender;
	@Override
	public Users u_getUsers(String u_id) {
		return uDao.u_getUsers(u_id);
	}
	@Override
	public int u_idCofirm(String u_id) {
		return uDao.u_idCofirm(u_id);
	}
	String backupPath = "D:\\mega_IT\\source\\10_2nd Project\\JRstudyCafe\\src\\main\\webapp\\usersImgFileUp/";
	
	@Override
	public int u_join(Users users, HttpSession httpSession, MultipartHttpServletRequest mRequest) {
		
		String uploadPath = mRequest.getRealPath("usersImgFileUp/");
		Iterator<String> params = mRequest.getFileNames(); // temp_bimg1, ...
		String u_image = "";
		
		while(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param); // 파라미터에 연결된 파일 객체
			u_image= mFile.getOriginalFilename(); 
			if(u_image!=null && !u_image.equals("")) {
				//파일첨부 했다
				if(new File(uploadPath+u_image).exists()) {
					//서버에 같은 파일이름의 있을 때 첨부한 파일이름을 교체
					u_image = System.currentTimeMillis()+"_"+u_image;
				}//if
				try {
					mFile.transferTo(new File(uploadPath+u_image)); //서버에 저장
					System.out.println("서버파일 : "+uploadPath+u_image);
					System.out.println("백업파일 : "+backupPath+u_image);
					int result = 
						fileCopy(uploadPath+u_image, backupPath+u_image); //파일 카피
					
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}else {
				
			}//if
		}//while
		users.setU_image(u_image);
		httpSession.setAttribute("u_id", users.getU_id());
		return uDao.u_join(users);
	}

	

	

	@Override
	public String loginCheck(String u_id, String u_pw, HttpSession httpSession) {
		String result = "로그인 성공";
		Users us = uDao.u_getUsers(u_id);
		if(us == null) {
			result = "유효하진 않는 아이디입니다.";
		}else if(!us.getU_pw().equals(u_pw)) {
			result = "비밀번호가 맞지 않습니다.";
		}else {
			if(us.getU_status()==1) {
				httpSession.setAttribute("users", us);
				httpSession.setAttribute("u_id", u_id);
			}else {
				result = "가입하지 않은 아이디이거나, 잘못된 비밀번호입니다";
			}
		}
		return result;
	}

	@Override
	public Users u_idfind(Users users, HttpSession httpSession) {
		
		return uDao.u_idfind(users);
	}
	
	private int fileCopy(String serverFile, String backupFile) {
		int isCopy = 0;
		FileInputStream is = null;
		FileOutputStream os = null;
		try {
			is = new FileInputStream(serverFile);
			os = new FileOutputStream(backupFile);
			File sFile = new File(serverFile);
			byte[] buff = new byte[(int)sFile.length()];
			while(true) {
				int nRead = is.read(buff);
				if(nRead== -1) break;
				os.write(buff, 0, nRead);
			}
			isCopy = 1;
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(os!=null) os.close();
				if(is!=null) is.close();
			} catch (Exception e) { }
		}
		return isCopy;
	}

	@Override
	public int u_modify(Users users, HttpSession httpSession, MultipartHttpServletRequest mRequest) {
		String uploadPath = mRequest.getRealPath("usersImgFileUp/");
		Iterator<String> params = mRequest.getFileNames(); // temp_bimg1, ...
		String u_image = "";
		
		while(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param); // 파라미터에 연결된 파일 객체
			u_image= mFile.getOriginalFilename(); 
			if(u_image!=null && !u_image.equals("")) {
				//파일첨부 했다
				if(new File(uploadPath+u_image).exists()) {
					//서버에 같은 파일이름의 있을 때 첨부한 파일이름을 교체
					u_image = System.currentTimeMillis()+"_"+u_image;
				}//if
				try {
					mFile.transferTo(new File(uploadPath+u_image)); //서버에 저장
					System.out.println("서버파일 : "+uploadPath+u_image);
					System.out.println("백업파일 : "+backupPath+u_image);
					int result = 
						fileCopy(uploadPath+u_image, backupPath+u_image); //파일 카피
					
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}else {
				
			}//if
		}//while
		
		users = new Users();
		users.setU_id(mRequest.getParameter("u_id"));
		users.setU_pw(mRequest.getParameter("u_pw"));
		users.setU_name(mRequest.getParameter("u_name"));
		users.setU_nickname(mRequest.getParameter("u_nickname"));
		users.setU_phone(mRequest.getParameter("u_phone"));
		users.setU_tel(mRequest.getParameter("u_tel"));
		users.setU_email(mRequest.getParameter("u_email"));
		users.setU_addr(mRequest.getParameter("u_addr"));
		users.setU_birth(Date.valueOf(mRequest.getParameter("u_birth")));
		httpSession.setAttribute("users", users);
		return uDao.u_modify(users);
	}
	@Override
	public int u_pwfind(final Users users) {
		final String uuid = (UUID.randomUUID().toString().replaceAll("-", "")).substring(0, 10); // -를 제거해 주었다.
		final Users us = uDao.u_getUsers(users.getU_id());
		System.out.println("비밀번호 :"+users.getU_pw());
		
		MimeMessagePreparator message = new MimeMessagePreparator() {
			String content = 
				"<tbody>\r\n" + 
				"		<tr>\r\n" + 
				"		<td>\r\n" + 
				"	       <div style=\"padding:51px 20px 56px 20px;\">\r\n" + 
				"	       <a href=\"http://localhost:8181/studycafe/main.do\" target=\"_blank\" rel=\"noreferrer noopener\" style=\"text-decoration: none;\">\r\n" + 
				"	       <h1>JRstudy</h1>\r\n" + 
				"	       </a>\r\n" + 
				"	       </div>\r\n" + 
				"       	   <div style=\"width:100%; padding:0 20px; margin:0 auto; font-family:Malgun Gothic; box-sizing:border-box;\">\r\n" + 
				"           <div style=\"font-size:28px; font-weight:bold; color:#000; padding-bottom:15px; border-bottom:4px solid #000; height:30px; line-height:28px;\">임시 비밀번호 발급</div>\r\n" + 
				"           <div style=\"font-size:18px; font-weight:bold; margin:39px 0 0 0; line-height:18px; color:#666\"> "+us.getU_name()+"님의 요청에 의해 임시 비밀번호를 발급해 드립니다.</div>\r\n" + 
				"           <div style=\"font-size:14px; color:#666; line-height:22px; margin:20px 0 0 0\">로그인 후에 비밀번호를 반드시 변경해주십시오.</div>\r\n" + 
				"           <div style=\"font-size:18px; font-weight:bold; background:#eee; padding:11px 12px 11px 20px; margin-top:40px;\">\r\n" + 
				"           <span style=\"display:inline-block; height:30px; line-height:30px;\">회원정보</span>\r\n" + 
				"           </div>\r\n" + 
				"           <table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" style=\"width:100%; border:1px solid #eee; border-bottom:0;\">\r\n" + 
				"           <tbody><tr><th colspan=\"1\" rowspan=\"1\" style=\"width:80px; font-size:14px; font-weight:bold; border-bottom:1px solid #eee; padding:16px 20px 15px 20px; text-align:left;\">\r\n" + 
				"			비밀번호</th><td style=\"font-size:14px; color:#999; line-height:22px; border-bottom:1px solid #eee; padding:16px 0 15px 0\"> "+uuid+" </td></tr>\r\n" + 
				"            </tbody></table>\r\n" + 
				"            <div style=\"font-size:14px; color:#999; margin-top:35px; line-height:22px;\">본 메일은 발신 전용 메일이며, 회신되지 않으므로 문의사항은 홈페이지 내 고객센터를 이용해주세요.</div>\r\n" + 
				"            <div style=\"font-size:14px; color:#999; line-height:22px; margin:0 0 30px 0;\">COPYRIGHTS (C)JRstudy ALL RIGHTS RESERVED.</div>\r\n" + 
				"            </div>\r\n" + 
				"          </td>\r\n" + 
				"          </tr>\r\n" + 
				"      </tbody>";
				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					mimeMessage.setRecipient(Message.RecipientType.TO, 
							new InternetAddress(users.getU_email()));
					mimeMessage.setFrom(new InternetAddress("studyroom1125@gmail.com "));
					mimeMessage.setSubject("[JRstudy] 임시 비밀번호 발급");
					mimeMessage.setText(content, "utf-8", "html");
				}
			};
			mailSender.send(message);
			users.setU_pw(uuid);
			int result = uDao.u_pwfind(users);
			
			return result;
	}

}
