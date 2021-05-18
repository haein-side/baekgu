package com.baekgu.silvertown.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import com.baekgu.silvertown.common.wrapper.EncryptReqeustWrapper;


/**
 * mapping expected
 * 1. /user/signup
 * 2. /business/signup
 * 3. /admin/signup
 * 
 * -> 아래 맵핑 방식을 통해 signup에 대해서만 encrypt작업을 하게 만듦.
 */
@WebFilter("/*/signup")
public class PasswordEncryptFilter implements Filter {
	// 사용자가 입력한 문자를 암호화 처리할려고하는 필터
	
    public PasswordEncryptFilter() {}

	public void destroy() {}


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest hrequest = (HttpServletRequest) request;
		
//		String uri = hrequest.getRequestURI();
//		System.out.println("uri : " + uri);
//		
//		String intent = uri.substring(uri.lastIndexOf("/"));
//		System.out.println("intent : " + intent);
//		
//		if(!"/login".equals(intent)) {
			
			EncryptReqeustWrapper wrapper = new EncryptReqeustWrapper(hrequest);
			
			chain.doFilter(wrapper, response);
//		} else {
//			chain.doFilter(request, response);
//		}
		
	}

	public void init(FilterConfig fConfig) throws ServletException {}

}
