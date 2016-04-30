package com.king.core;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.king.bean.User;
public class PermissionInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		System.out.println("��������..........");
		User user =(User)request.getSession().getAttribute("user");
		if(user!=null && user.getUserName().equals("king")){
			return true;
		}else{
			response.sendRedirect(request.getContextPath()+"/success");	
			return false;
		}
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("�������ִ�еķ���..........");
		
	}
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		System.out.println("��Ӧ�Ѿ�����Ⱦ�ɹ���ִ�еķ���..........");
		
	}

}
