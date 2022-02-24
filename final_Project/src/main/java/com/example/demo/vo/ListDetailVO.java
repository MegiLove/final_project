package com.example.demo.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ListDetailVO {

	private int order_no;	
	private String product_img;	
	private String product_name;	
	private int product_price;	
	private int detail_cnt;	
	private int status_code;	
	private int detail_price;	
	private int payment_code;	
	private String cust_name;	
	private String cust_phone;	
	private String cust_addr1;	
	private String cust_addr2;	
	private String cust_addr3;	
}
