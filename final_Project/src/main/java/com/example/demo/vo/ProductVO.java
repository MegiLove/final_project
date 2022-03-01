package com.example.demo.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductVO {

	private int product_no;
	private String product_name;
	private int product_price;
	private String product_desc;
	private Date product_date;
	private String product_img;
	private int product_margin;
	private String category_code;
	private String product_detail;
	private MultipartFile uploadFile;
	private MultipartFile uploadFiledetail;

}
