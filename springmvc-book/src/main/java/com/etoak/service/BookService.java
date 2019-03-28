package com.etoak.service;

import org.springframework.web.multipart.MultipartFile;

import com.etoak.bean.Book;
import com.etoak.bean.BookVo;
import com.etoak.commons.Page;

public interface BookService {

	/**
	 * 添加书籍
	 * 
	 * @param file
	 * @param book
	 * @return
	 */
	public int addBook(MultipartFile file, Book book) throws Exception;

	/**
	 * 查询书籍列表
	 * 
	 * @param book
	 * @param page
	 * @return
	 */
	public Page<BookVo> queryBookList(Book book, Page<Book> page);

	/**
	 * 更新书籍
	 * 
	 * @param file
	 * @param book
	 * @return
	 */
	public int updateBook(MultipartFile file, Book book) throws Exception;

	/**
	 * 删除书籍
	 * 
	 * @param id
	 * @return
	 */
	public int deleteBook(int id);

}
