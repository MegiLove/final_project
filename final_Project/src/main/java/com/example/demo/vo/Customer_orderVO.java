package com.example.demo.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Customer_orderVO {
	private int order_no;
	private String cust_id;
	private Date order_date;
	private String order_addr1;
	private String order_addr2;
	private String order_addr3;
	private int status_code;
	private int payment_code;
	
}
