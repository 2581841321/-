package com.etoak.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.etoak.bean.User;
import com.etoak.service.UserService;

@Controller
public class LoginController {

	@Autowired
	UserService userService;

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(HttpServletRequest request, //
			@RequestParam String name, //
			@RequestParam String password) {
		User user = userService.queryUser(name, password);

		// 如果查询不到用户，直接掉跳转到登录页面/pages/login.jsp
		if (user == null) {
			return "login";
		}

		// 将密码置为null
		user.setPassword(null);
		request.getSession().setAttribute("user", user);
		return "redirect:/";
	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		session.invalidate();
		return "login";
	}

}
