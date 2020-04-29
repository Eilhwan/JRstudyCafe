package com.jr.studycafe.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jr.studycafe.dao.RecruitBoardDao;
import com.jr.studycafe.dto.FileUpDto;
import com.jr.studycafe.dto.RecruitBoard;

@Service
public class RecruitBoardServiceImpl implements RecruitBoardService{
	@Autowired
	private RecruitBoardDao rbdao;
	private String backupPath = "D:/tj/source/2nd_project/JRstudyCafe(1)/src/main/webapp/backup_rb/";
	@Override
	public List<RecruitBoard> list_rb(RecruitBoard recruitBoard) {
		return rbdao.list_rb(recruitBoard);
	}

	@Override
	public RecruitBoard detail_rb(int rb_no) {
		hit_rb(rb_no);
		return rbdao.detail_rb(rb_no);
	}

	@Override
	public List<RecruitBoard> search_rb(RecruitBoard recruitBoard) {
		return rbdao.search_rb(recruitBoard);
	}

	@Override
	public int modify_rb(MultipartHttpServletRequest mRequest, RecruitBoard recruitBoard, Model model) {
		String uploadPath = mRequest.getRealPath("backup_rb/");
		Iterator<String> params = mRequest.getFileNames();
		String filename = "";
		
		if(params.hasNext()) {
			String param = params.next();
			System.out.println("파라미터 이름  : "+param);
			MultipartFile mFile = mRequest.getFile(param);
			filename = mFile.getOriginalFilename();
			System.out.println("파일이름 : "+filename);
			if(filename!=null && !filename.equals("")) {
				if(new File(uploadPath + filename).exists()) {
					filename = System.currentTimeMillis() + "_" + filename;
				}
				try {
					mFile.transferTo(new File(uploadPath + filename));
					System.out.println("서버파일 : " + uploadPath + filename);
					System.out.println("서버파일 : " + backupPath + filename);
					int result = filecopy(uploadPath + filename, backupPath + filename);
					System.out.println(result == 1? "파일 복사 성공" : "파일 복사 실패");
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}//if
		int rb_no = Integer.parseInt(mRequest.getParameter("rb_no"));
		String rb_name = mRequest.getParameter("rb_name");
		String rb_content = mRequest.getParameter("rb_content");
		RecruitBoard rb = new RecruitBoard();
		rb.setRb_no(rb_no);
		rb.setRb_name(rb_name);
		rb.setRb_content(rb_content);
		int result = 0;
		try {
			result = rbdao.modify_rb(rb);
			model.addAttribute("successMsg", "글 수정이 완료되었습니다");
		}catch (Exception e) {
			model.addAttribute("failMsg", "글 수정에 실패했습니다");
		}
		return result;
	}

	@Override
	public int delete_rb(int rb_no) {
		return rbdao.delete_rb(rb_no);
	}

	@Override
	public int hit_rb(int rb_no) {
		return rbdao.hit_rb(rb_no);
	}

	@Override
	public int cnt_rb(RecruitBoard recruitBoard) {
		return rbdao.cnt_rb(recruitBoard);
	}

	@Override
	public int write_rb(MultipartHttpServletRequest mRequest, RecruitBoard recruitBoard) {
		String uploadPath = mRequest.getRealPath("backup_rb/");
		Iterator<String> params = mRequest.getFileNames();
		String filename = "";
		if(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param);
			filename = mFile.getOriginalFilename();
			System.out.println("filename" + filename);
			if(filename!=null && !filename.equals("")) {
				if(new File(uploadPath + filename).exists()) {
					filename = System.currentTimeMillis() + "_" + filename;
				}
				try {
					mFile.transferTo(new File(uploadPath + filename));
					System.out.println("서버파일 : " + uploadPath + filename);
					System.out.println("서버파일 : " + backupPath + filename);
					int result = filecopy(uploadPath + filename, backupPath + filename);
					System.out.println(result == 1? "파일 복사 성공" : "파일 복사 실패");
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}//if
		return rbdao.write_rb(recruitBoard);
	}
	@Override
	public FileUpDto fileUp(FileUpDto fileUpDto, HttpServletRequest request) {
		String rootPath = request.getRealPath("/");
		String attachPath = "backup_rb/";
		String uploadPath = request.getRealPath("backup_rb/");
		System.out.println("서버로 여기로 보낸다 : "+rootPath + attachPath);
		MultipartFile upload = fileUpDto.getUpload();
		String filename = "";
		
		if(upload != null){
	    	filename = System.currentTimeMillis() + upload.getOriginalFilename();
	    	fileUpDto.setFilename(filename);
	     	try{
	     		File file = new File(rootPath + attachPath + filename);
	     		upload.transferTo(file);
	     	}catch(IOException e){
	     		e.printStackTrace();
	     	}  
	     	
	     	fileUpDto.setAttachPath(attachPath);
	     	fileUpDto.setFilename(filename);
	     }
		 
		int result = filecopy(rootPath + attachPath + filename, backupPath+filename);
		if(result==1) {
			System.out.println(filename+" 파일 백업 성공");
		}
		return fileUpDto;
	}
	
	private int filecopy(String serverFile, String backupFile) {
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
				if(nRead == -1) {
					break;
				}
				System.out.println("write");
				os.write(buff, 0, nRead);
			}
			isCopy = 1;
		} catch (FileNotFoundException e) {
			System.out.println("복사 예외0 : "+e.getMessage());
		} catch (IOException e) {
			System.out.println("복사 예외1 : "+e.getMessage());
		} finally {
			try {
				if(os!=null) {
					os.close();
				}
				if(is!=null) {
					is.close();
				}
			}catch (Exception e) {
			}
		}
		return isCopy;
	}
}
