package com.etoak.service.impl;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.etoak.bean.Book;
import com.etoak.bean.BookVo;
import com.etoak.commons.Page;
import com.etoak.mapper.BookMapper;
import com.etoak.service.BookService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class BookServiceImpl implements BookService {

	@Autowired
	BookMapper bookMapper;

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public int addBook(MultipartFile file, Book book) throws Exception {
		this.handleFile(file, book);
		return bookMapper.addBook(book);
	}

	@Override
	public Page<BookVo> queryBookList(Book book, Page<Book> page) {
		PageHelper.startPage(page.getPageNumber(), page.getPageSize());
		List<BookVo> bookList = bookMapper.queryBookList(book);
		PageInfo<BookVo> pageInfo = new PageInfo<BookVo>(bookList);
		Page<BookVo> result = new Page<BookVo>(pageInfo.getPageNum(), //
				pageInfo.getPageSize(), pageInfo.getTotal(), //
				pageInfo.getPages(), pageInfo.getList(), //
				pageInfo.getPrePage(), pageInfo.getNextPage());
		return result;
	}

	@Override
	public int updateBook(MultipartFile file, Book book) throws Exception {
		long size = file.getSize();

		// 如果有文件，表示要修改书籍封面，需要重新上传文件
		if (size > 0) {
			this.handleFile(file, book);
		}

		return bookMapper.updateBook(book);
	}

	@Override
	public int deleteBook(int id) {
		return bookMapper.deleteBook(id);
	}

	/**
	 * 处理文件上传
	 * 
	 * @param file
	 * @param book
	 * @throws Exception
	 */
	private void handleFile(MultipartFile file, Book book) throws Exception {

		// 获取文件的原始名称
		String originalFilename = file.getOriginalFilename();

		// 获取文件后缀
		String suffix = FilenameUtils.getExtension(originalFilename);
		UUID uuid = UUID.randomUUID();
		String newName = uuid.toString() + "." + suffix;
		File newFile = new File("D:/upload", newName);
		file.transferTo(newFile);

		// 设置保存路径{FastDFS、GlusterFS...}
		book.setCoverPath("/pics/" + newName);
	}

}
