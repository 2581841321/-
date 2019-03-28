package com.etoak.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.etoak.bean.User;

public class LoginInterceptor implements HandlerInterceptor {

	/**
	 * preHandle方法在处理器执行之前被调用<BR>
	 * 1.返回true <BR>
	 * 1-1.执行下一个拦截器的preHandle方法<BR>
	 * 1-2.执行被拦截的Controller <BR>
	 * 1-3从最后一个拦截器倒序执行所有的postHandle() <BR>
	 * 1-4再从最后一个拦截器往回执行所有的afterCompletion() <BR>
	 * 
	 * 2.如果返回false <BR>
	 * 从当前的拦截器往回执行所有拦截器的afterCompletion()<BR>
	 * 
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String contextPath = request.getContextPath();

		// 1.获取Session
		HttpSession session = request.getSession();

		// 2.取出Session中user对象
		User user = (User) session.getAttribute("user");

		// 3.如果user为null,直接跳到登录页面
		if (user == null) {
			response.sendRedirect("http://localhost:8080" + contextPath + "/pages/login.jsp");
			return false;
		}

		return true;
	}

	/**
	 * 在处理器执行完成后,渲染视图之前执行;可在modelAndView中添加数据
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

	/**
	 * 渲染页面完成后执行afterCompletion,可用于清理资源等
	 */
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}

}
