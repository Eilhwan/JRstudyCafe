package com.jr.studycafe.controller;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jr.studycafe.dto.FileUpDto;
import com.jr.studycafe.service.RecruitBoardService;
@Controller
public class CkeditorFileUploadController {
	@Autowired
	private RecruitBoardService rbService;
	@RequestMapping(value="rbWriteFileupload", method=RequestMethod.POST)
	public String rbWriteFileupload(FileUpDto fileUploadVO, HttpServletRequest request , Model model){
		fileUploadVO = rbService.fileUp(fileUploadVO, request);
		model.addAttribute("filePath", fileUploadVO.getAttachPath() + fileUploadVO.getFilename());  
		//model.addAttribute("filename", fileUploadVO.getFilename()); //결과값을
		return "board/ckeditorImageUpload";
    }
}
