package com.etoak.commons;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

/**
 * 全局异常处理
 * 
 * @author et1811
 *
 */
@ControllerAdvice
public class ControllerException {

	/**
	 * 拦截Exception以及其所有的子类型异常
	 * 
	 * @param e
	 * @return
	 */
	@ExceptionHandler(Exception.class)
	public String handleException(Exception e) {
		System.out.println("异常！！！！");
		// e.printStackTrace();
		return "error";
	}

}
