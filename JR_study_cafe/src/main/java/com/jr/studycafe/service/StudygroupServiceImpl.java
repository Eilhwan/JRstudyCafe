package com.jr.studycafe.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jr.studycafe.dao.StudygroupDao;
import com.jr.studycafe.dto.Studygroup;
import com.jr.studycafe.dto.Studymember;
import com.jr.studycafe.dto.Users;

@Service
public class StudygroupServiceImpl implements StudygroupService {
	@Autowired
	private StudygroupDao sdao;
	

	@Override
	public int studygroupOpen(Studygroup studygroup, MultipartHttpServletRequest mRequest) {
		int isUpload = 0;
		String uploadPath = mRequest.getRealPath("studygroupUpload/");
		String backupPath = "D:/tj/source/2nd_project/JRstudyCafe/src/main/webapp/studygroupUpload/";
		String fileName = "";
		
		Iterator<String> params = mRequest.getFileNames();	
		String param = null;
		if (params.hasNext()) {
			param = params.next();
		}
		MultipartFile mFile = mRequest.getFile(param); // 파라미터의 파일 객체
		String originalFileName = mFile.getOriginalFilename(); // 업로드 했을 때 원래 파일 이름
		fileName = originalFileName;			
		
			
		if(fileName != null && !fileName.equals("")) { // 첨부함
			if(new File(uploadPath + fileName).exists()) {
				// 첨부파일과 같은 이름의 파일이 서버에 존재하는 경우 -> 파일이름을 변경
				fileName = System.currentTimeMillis() + fileName;
			}// if - 파일이름 변경
			try {
				mFile.transferTo(new File(uploadPath+fileName));
				isUpload = filecopy(uploadPath+fileName, backupPath + fileName);//backup
			} catch (IOException e) {
				System.out.println(e.getMessage());
			} 
		}//if
		studygroup.setSg_img(fileName);
		return sdao.studygroupOpen(studygroup);
	}


	@Override
	public List<Studygroup> user_studygroup_list(HttpSession session) {
		Users users = null;
		if (session.getAttribute("users") != null) {
			users = (Users) session.getAttribute("users");
			String u_id = users.getU_id();
			return sdao.user_studygroup_list(u_id);
		}else {
			return null;
		}
	}
	
	

	private int filecopy(String serverFile, String backupFile) {
		int isCopy = 0;
		FileInputStream is = null;
		FileOutputStream os = null;
		try {
			File file = new File(serverFile);
			is = new FileInputStream(serverFile);
			os = new FileOutputStream(backupFile);
			byte[] buff = new byte[(int)file.length()];
			while(true) {
				int nReadByte = is.read(buff);
				if(nReadByte == -1) break;
				os.write(buff, 0, nReadByte);
			}
			isCopy = 1;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(os!=null) os.close();
				if(is!=null) is.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return isCopy;
	}


	@Override
	public List<Studygroup> leader_studygroup_list(HttpSession session) {
		Users users = null;
		if (session.getAttribute("users") != null) {
			users = (Users) session.getAttribute("users");
			String u_id = users.getU_id();
			return sdao.leader_studygroup_list(u_id);
		}else {
			return null;
		}
	}


	@Override
	public int studygroup_invite(Studymember studymember) {
		return sdao.studygroup_invite(studymember);
	}


	@Override
	public int dropout_member(String u_id) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public Studygroup studygroup_view(int sg_no) {
		
		return sdao.studygroup_view(sg_no);
	}


	@Override
	public int studymember_cnt(int sg_no) {
		return sdao.studymember_cnt(sg_no);
	}


	@Override
	public List<Studymember> studymember_list(int sg_no) {
		return sdao.studymember_list(sg_no);
	}


	@Override
	public Studymember studymember_view(Studymember studyMember, HttpSession session) {
		Users user = (Users) session.getAttribute("users");
		if (user == null) {
			return studyMember;
		}
		String u_id = user.getU_id();
		studyMember.setU_id(u_id);
		return sdao.studymember_view(studyMember);
		
	}


	@Override
	public Studygroup findWithsgname(String sg_name) {
		return sdao.findWithsgname(sg_name);
	}

	

}
