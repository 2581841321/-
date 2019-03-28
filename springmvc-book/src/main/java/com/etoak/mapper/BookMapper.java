package com.etoak.mapper;

import java.util.List;

import com.etoak.bean.Book;
import com.etoak.bean.BookVo;

public interface BookMapper {

	/**
	 * 添加书籍
	 * 
	 * @param book
	 * @return
	 */
	public int addBook(Book book);

	/**
	 * 查询书籍列表
	 * 
	 * @param book
	 * @return
	 */
	public List<BookVo> queryBookList(Book book);

	/**
	 * 更新书籍
	 * 
	 * @param book
	 * @return
	 */
	public int updateBook(Book book);

	/**
	 * 删除书籍
	 * 
	 * @param id
	 * @return
	 */
	public int deleteBook(int id);
	
	

}
