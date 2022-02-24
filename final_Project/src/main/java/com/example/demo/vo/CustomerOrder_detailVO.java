package com.example.demo.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CustomerOrder_detailVO {

	private int detail_no;
	private int order_no;	
	private int product_no;	
	private int detail_price;	
	private int detail_cnt;	
}
