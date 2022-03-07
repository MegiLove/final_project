package com.example.demo.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ListQnaVO {
	private String qna_title;
	private String qna_content;
	private String qna_img;
	private Date qna_date;
	private String qna_answer;
	private String cust_id;
}
