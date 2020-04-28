package com.jr.studycafe.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jr.studycafe.dao.RoomDao;
import com.jr.studycafe.dto.Room;
import com.jr.studycafe.util.Paging;

@Repository
public class RoomServiceImpl implements RoomService {
	@Autowired
	private RoomDao rdao;
	
	@Override
	public Room room_detail(int r_no) {
		
		return rdao.room_detail(r_no);
	}

	@Override
	public List<Room> room_list(String pageNum) {
		int pageSize = 10;
		int blockSize = 10;
		Room rooms = new Room();
		Paging paging = new Paging(rdao.room_cnt(), pageNum, pageSize, blockSize);
		rooms.setStartRow(paging.getStartRow());
		rooms.setEndRow(paging.getEndRow());
		
		return rdao.room_list(rooms);
	}

	@Override
	public int room_cnt() {
		
		return rdao.room_cnt();
	}

	@Override
	public int room_register(Room room, MultipartHttpServletRequest mRequest) {
		int isUpload = 0;
		String uploadPath = mRequest.getRealPath("roomimgUpload/");
		String backupPath = "D:/java2/source/2nd_project/JRstudyCafe/src/main/webapp/roomimgUpload/";
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
		room.setR_image(fileName);
		rdao.room_register(room);
		if (rdao.room_register(room) != 0) {
			room_option_register(room);			
		}
		return isUpload;
	}

	@Override
	public int room_option_register(Room room) {
	
		
		
		return rdao.room_option_register(room);
	}

	@Override
	public int room_modify(Room room) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int room_option_modify(Room room) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int room_delete(int r_no) {
		// TODO Auto-generated method stub
		return 0;
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
	public List<Room> room_booklist() {
		
		return rdao.room_booklist();
	}
}
