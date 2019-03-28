package com.etoak.controller;

import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.etoak.bean.Book;
import com.etoak.bean.BookVo;
import com.etoak.bean.Student;
import com.etoak.commons.Page;
import com.etoak.service.BookService;

/**
 * REST方式实现增删查改
 * 
 * @author et1811
 *
 */
@Controller
public class BookController {

	@Autowired
	BookService bookService;

	/**
	 * 添加图书：POST方式
	 * 
	 * @param file
	 * @param book
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/book", method = RequestMethod.POST)
	public String book(@RequestParam("pic") MultipartFile file, //
			Book book) throws Exception {
		bookService.addBook(file, book);

		// 新增完成后，页面重定向到书籍列表页面
		return "redirect:/gotoBookList";
	}

	/**
	 * GET方式获取列表
	 * 
	 * @param book
	 * @param page
	 * @return
	 */
	@RequestMapping(value = "/books", method = RequestMethod.GET)
	@ResponseBody
	public Page<BookVo> queryBookList(Book book, Page<Book> page) {
		return bookService.queryBookList(book, page);
	}

	/**
	 * POST方式更新
	 * 
	 * @param id
	 * @param file
	 * @param book
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/book/{id}", method = RequestMethod.POST)
	public String updateBook(@PathVariable("id") int id, //
			@RequestParam("pic") MultipartFile file, //
			Book book) throws Exception {
		book.setId(id);
		bookService.updateBook(file, book);

		// 修改完成后，页面重定向到书籍列表页面
		return "redirect:/gotoBookList";
	}

	/**
	 * DELETE方式实现删除
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/book/{id}", method = RequestMethod.DELETE)
	public String deleteBook(@PathVariable("id") int id) {
		bookService.deleteBook(id);

		// 删除完成后，页面重定向到书籍列表页面
		return "redirect:/gotoBookList";
	}

	@RequestMapping("/testVlidator")
	public String testVlidator(@Valid Student stu, //
			BindingResult result, //
			Map<String, Object> map) {
		
		List<ObjectError> allErrors = result.getAllErrors();
		if (!CollectionUtils.isEmpty(allErrors)) {
			StringBuffer buf = new StringBuffer();
			for (ObjectError error : allErrors) {
				String msg = error.getDefaultMessage();
				buf.append(msg).append(",");
			}
			String error = buf.toString();
			error = error.substring(0, error.lastIndexOf(","));
			map.put("error", error);
		}

		return "validator";
	}

}
