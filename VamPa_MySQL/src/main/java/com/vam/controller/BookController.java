package com.vam.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;

import com.vam.mapper.AttachMapper;
import com.vam.model.AttachImageVO;

@Controller
public class BookController {
	
	private static final Logger logger = LoggerFactory.getLogger(BookController.class);
	
	@Autowired
	private AttachMapper attachMapper;
	
	//메인 페이지 이동
	@GetMapping(value = "/main")
	public void mainPageGET() {
		
		logger.info("메인 페이지 진입");
		
	}
	
	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String fileName) throws Exception {
		
		File file = new File("C:\\workspaceSTS4\\upload\\" + fileName);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/* 이미지 정보 반환 */
	@GetMapping(value="/getAttachList")
	public ResponseEntity<List<AttachImageVO>> getAttachList(int bookId) throws Exception {
		
		return new ResponseEntity(attachMapper.getAttachList(bookId), HttpStatus.OK);
	}

}
