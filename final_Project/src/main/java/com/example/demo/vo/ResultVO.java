package com.example.demo.vo;

import java.util.List;

import lombok.Data;

@Data
public class ResultVO {
	private List<ProductVO> list;
	private int totalPage ;

}
