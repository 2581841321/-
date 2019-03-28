package com.etoak.commons;

import java.util.List;

import lombok.Data;

@Data
public class Page<T> {

	// 页码，起始页码为1
	private int pageNumber = 1;

	// 每页显示记录数
	private int pageSize = 2;

	// 总记录数
	private long total;

	// 总页数
	private int totalPages;

	// 数据
	private List<T> rows;

	// 上一页
	private int pre;

	// 下一页
	private int next;

	public Page() {
		super();
	}

	public Page(int pageNumber, int pageSize, long total, int totalPages, List<T> rows, int pre, int next) {
		this.pageNumber = pageNumber;
		this.pageSize = pageSize;
		this.total = total;
		this.totalPages = totalPages;
		this.rows = rows;
		this.pre = pre;
		this.next = next;
	}

}
