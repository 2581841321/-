package com.etoak.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 用于页面转发的Controller
 * 
 * @author et1811
 *
 */
@Controller
public class IndexController {

	@RequestMapping("/")
	public String index() {
		return "index";
	}

	@RequestMapping("/gotoAddBook")
	public String gotoAddBook() {
		return "addBook";
	}

	@RequestMapping("/gotoBookList")
	public String gotoBookList() {
		return "bookList";
	}

	@RequestMapping("/testInterceptor")
	public String testInterceptor() {
		System.out.println("处理器执行了!");
		// int i = 1 / 0;
		return "interceptor";
	}

	@RequestMapping("/gotoValidator")
	public String gotoValidator() {
		return "validator";
	}

}
