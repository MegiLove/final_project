package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CustomerVO {

	private String cust_id;
	private String cust_pwd;
	private String cust_name;
	private String cust_phone;
	private String cust_email;
	private String cust_addr1;
	private String cust_addr2;
	private String cust_addr3;
	private String role;
}
