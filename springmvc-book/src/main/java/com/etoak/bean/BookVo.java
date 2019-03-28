package com.etoak.bean;

import lombok.Data;

@Data
public class BookVo {

	private Integer id;

	private String bookName;

	private String author;

	private String price;

	private Integer category;

	private String categoryName;
	
	private String coverPath;

	private String publishDate;

	private String createTime;

	private String updateTime;

}
