package com.example.demo.vo;

import java.util.Date;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Customer_orderVO {
	//int로 하면 범위를 넘어섬
	private int order_no;
	private String cust_id;	
	private Date order_date;	
	private String order_addr1;	
	private String order_addr2;	
	private String order_addr3;	
	private int status_code;	
	private int payment_code;
	
}
