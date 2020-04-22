package com.jr.studycafe.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jr.studycafe.dao.ReviewDao;
import com.jr.studycafe.dto.FileUpVO;
import com.jr.studycafe.dto.Review;
import com.jr.studycafe.dto.Users;

@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	private ReviewDao rDao;
	private String backupPath = "D:\\mega_IT\\source\\10_2nd Project\\JRstudyCafe\\src\\main\\webapp\\reviewFileUp\\";
	
	// 게시물 목록 보기
	@Override
	public List<Review> review_list(Review review) {
		
		return rDao.review_list(review);
	}
	
	// 게시물 쓰기
	@Override
	public int review_write(Review review, HttpSession httpSession) {
		
		String u_id = "";
		if(httpSession.getAttribute("users")!=null) {
			u_id = ((Users)httpSession.getAttribute("users")).getU_id();
		}
		review.setU_id(u_id);
		// 나중에 없앨것
		review.setR_no(1);
		return rDao.review_write(review);
	}
	
	// 게시물 수정
	@Override
	public int review_modify(Review review) {
		
		return rDao.review_modify(review);
	}

	// 게시물 정보조회
	@Override
	public Review review_detail(int rv_no) {
		rDao.review_hitup(rv_no);
		return rDao.review_detail(rv_no);
	}

	//게시물 삭제
	@Override
	public int review_delete(int rv_no) {
		
		return rDao.review_delete(rv_no);
	}
	
	// 글개수 가져오기
	@Override
	public int review_cnt(Review review) {
		
		return rDao.review_cnt(review);
	}

	@Override
	public FileUpVO fileUp(FileUpVO fileUpVO, HttpServletRequest request) {
		String rootPath = request.getRealPath("/");
		String attachPath = "reviewFileUp/";
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
	public int rvlike_Insert(Review review, HttpSession httpSession) {
		String u_id = "";
		if(httpSession.getAttribute("users")!=null) {
			u_id = ((Users)httpSession.getAttribute("users")).getU_id();
		}
		review.setU_id(u_id);
		return rDao.rvlike_Insert(review);
	}

	@Override
	public int rvlike_Delete(int likeno) {
		return rDao.rvlike_Delete(likeno);
	}

	@Override
	public Review rvlike_Chk(Review review, HttpSession httpSession) {
		String u_id = "";
		if(httpSession.getAttribute("users")!=null) {
			u_id = ((Users)httpSession.getAttribute("users")).getU_id();
		}
		review.setU_id(u_id);
		return rDao.rvlike_Chk(review);
	}

	@Override
	public int rvLike_Insert_Delete(Review review, HttpSession httpSession) {
		String u_id = "";
		if(httpSession.getAttribute("users")!=null) {
			u_id = ((Users)httpSession.getAttribute("users")).getU_id();
		}
		review.setU_id(u_id);
		Review rvlike_Chk = rDao.rvlike_Chk(review);
		if(rvlike_Chk!=null) {
			return rDao.rvlike_Delete(rvlike_Chk.getLikeno());
		}else if(rvlike_Chk==null) {
			return rDao.rvlike_Insert(review);
		}else {
			return 0;
		}
	}

	

}
