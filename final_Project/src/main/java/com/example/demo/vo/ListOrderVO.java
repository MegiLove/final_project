package com.example.demo.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ListOrderVO {
	private Date order_date;
	private int order_no;
	private int status_code;
}
