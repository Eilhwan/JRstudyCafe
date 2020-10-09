package com.jr.studycafe.service;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jr.studycafe.dao.FreeBoardDao;
import com.jr.studycafe.dto.FileUpVO;
import com.jr.studycafe.dto.FreeBoard;
@Service
public class FreeBoardServiceImpl implements FreeBoardService {
	@Autowired
	private FreeBoardDao bDao;
	private String backupPath = "C:\\mega_IT\\source\\10_project\\JRstudyCafe\\src\\main\\webapp\\freeBoardFileUp\\"; 
	@Override
	public List<FreeBoard> freeBoardList(FreeBoard b) {
		return bDao.freeBoardList(b);
	}
	@Override
	public int freeBoardCnt(FreeBoard b) {
		return bDao.freeBoardCnt(b);
	}
	@Override
	public int freeBoardUserWrite(MultipartHttpServletRequest mRequest, FreeBoard b) {
		String uploadPath = mRequest.getRealPath("freeBoardFileUp/");
		Iterator<String> params = mRequest.getFileNames();
		String filename = "";
		if(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param);
			filename = mFile.getOriginalFilename();
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
		return bDao.freeBoardUserWrite(b);
	}
	@Override
	public int freeBoardAdminWrite(MultipartHttpServletRequest mRequest, FreeBoard b) {
		String uploadPath = mRequest.getRealPath("freeBoardFileUp/");
		Iterator<String> params = mRequest.getFileNames();
		String filename = "";
		if(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param);
			filename = mFile.getOriginalFilename();
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
		return bDao.freeBoardAdminWrite(b);
	}

	@Override
	public FreeBoard freeBoardDetail(int fb_no) {
		return bDao.freeBoardDetail(fb_no);
	}

	@Override
	public int freeBoardUpdate(MultipartHttpServletRequest mRequest, FreeBoard b) {
		String uploadPath = mRequest.getRealPath("freeBoardFileUp/");
		Iterator<String> params = mRequest.getFileNames();
		String filename = "";
		if(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param);
			filename = mFile.getOriginalFilename();
			if(filename!=null && !filename.equals("")) {
				if(new File(uploadPath + filename).exists()) {
					filename = System.currentTimeMillis() + "_" + filename;
				}
				try {
					mFile.transferTo(new File(uploadPath + filename));
					System.out.println("서버파일 : " + uploadPath + filename);
					System.out.println("서버파일 : " + backupPath + filename);
					int result = filecopy(uploadPath + filename, backupPath + filename);
					System.out.println(result == 1? uploadPath + filename+"파일 복사 성공" : backupPath + filename+"파일 복사 실패");
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}//if
		return bDao.freeBoardUpdate(b);
	}

	@Override
	public int freeBoardDelete(int fb_no) {
		return bDao.freeBoardDelete(fb_no);
	}
	@Override
	public int freeBoardHit(int fb_no) {
		return bDao.freeBoardHit(fb_no);
	}

	@Override
	public FileUpVO fileUp(FileUpVO fileUpVO, HttpServletRequest request) {
		String rootPath = request.getRealPath("/");
		String attachPath = "freeBoardFileUp/";
		MultipartFile upload = fileUpVO.getUpload();
		String filename = "";
		
		if(upload != null){
	    	filename = System.currentTimeMillis() + upload.getOriginalFilename();
	    	fileUpVO.setFilename(filename);
	     	try{
	     		File file = new File(rootPath + attachPath + filename);
	     		upload.transferTo(file);
	     	}catch(IOException e){
	     		e.printStackTrace();
	     	}  
	     	
	     	fileUpVO.setAttachPath(attachPath);
	     	fileUpVO.setFilename(filename);
	     }
		 
		int result = filecopy(rootPath + attachPath + filename, backupPath+filename);
		if(result==1) {
			System.out.println(filename+" 파일 백업 성공");
		}
		return fileUpVO;
	}
	
	private int filecopy(String serverFile, String backupFile) {
		int isCopy = 0;
		FileInputStream is = null;
		FileOutputStream os = null;
		try {
			is = new FileInputStream(serverFile);
			os = new FileOutputStream(backupFile);
			System.out.println("백업"+backupFile);
			File sFile = new File(serverFile);
			byte[] buff = new byte[(int)sFile.length()];
			while(true) {
				int nRead = is.read(buff);
				if(nRead == -1) {
					break;
				}
				System.out.println("dd");
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
	@Override
	public void insert50() {
		FreeBoard freeBoard = new FreeBoard();
		for(int i=4 ; i<54 ; i++) {
			freeBoard.setU_id("user");
			freeBoard.setFb_name(i+"번째 글제목");
			freeBoard.setFb_content(i+"번째 글내용입니다.");
			bDao.freeBoardUserWrite(freeBoard);
		}
	}
	@Override
	public int freeLikesInsert(FreeBoard b) {
		return bDao.freeLikesInsert(b);
	}
	@Override
	public int freeLikesCnt(FreeBoard b) {
		return bDao.freeLikesCnt(b);
	}
}
