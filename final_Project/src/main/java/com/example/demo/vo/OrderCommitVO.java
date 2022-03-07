package com.example.demo.vo;

import lombok.Data;

@Data
public class OrderCommitVO {
	private int product_no;
	private String product_img;
	private int product_cnt;   
	private String cust_id;       
	private int cart_no;       
	private String product_name;  
	private int product_price; 
	private String name;
	private String phone;
	private  String sample6_postcode;
	private String sample6_address;
	private String sample6_detailAddress;
	private int payment_code;
}
