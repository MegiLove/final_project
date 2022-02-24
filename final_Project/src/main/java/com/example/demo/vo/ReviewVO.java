package com.example.demo.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ReviewVO {
	private int review_no;
	private String review_title;
	private String review_content;
	private String review_img;
	private int review_code;
	private int detail_no;
	private MultipartFile uploadFile;
}
