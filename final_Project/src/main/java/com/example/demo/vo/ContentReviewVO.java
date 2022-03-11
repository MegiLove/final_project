package com.example.demo.vo;

import lombok.Data;

@Data
public class ContentReviewVO {
	private int order_no;
	private int review_no;
	private String product_name;
	private String product_img;
	private String review_title;
	private String review_content;
	private String review_img;
	private String cust_id;
}
