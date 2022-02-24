package com.example.demo.vo;

import lombok.Data;

@Data
public class CartProductVO {
	private int product_no;
	private int cart_no;
	private String cust_id;
	private String product_img;
	private String product_name;
	private int product_price;
	private int product_cnt;
}
