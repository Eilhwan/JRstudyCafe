package com.jr.studycafe.dto;

import org.springframework.web.multipart.MultipartFile;

public class FileUpDto {
	private String attachPath; //이미지가 저장될 경로
    private String filename; //파일이름
    private MultipartFile upload;
    
	public String getAttachPath() {
		return attachPath;
	}
	public void setAttachPath(String attachPath) {
		this.attachPath = attachPath;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
}
