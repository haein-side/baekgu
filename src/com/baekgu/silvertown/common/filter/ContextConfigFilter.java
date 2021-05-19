package com.baekgu.silvertown.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import com.baekgu.silvertown.common.config.ConfigLocation;

/**
 * Servlet Filter implementation class ContextConfigFilter
 */
@WebFilter("/*")
public class ContextConfigFilter implements Filter {

   
    public ContextConfigFilter() {}

    public void init(FilterConfig fConfig) throws ServletException {
    	
	}
    
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		/* DB 접속 설정 정보 파일의 경로가 비어있는 경우 초기화 작업 */
		if(ConfigLocation.CONNECTION_CONFIG_LOCATION == null) {
			// WebContent(root context)의 경로를 찾기
			String root = request.getServletContext().getRealPath("/");
			// web.xml에 저장해놓은 parameter 가져오기 -> 경로 합치기 위함
			String connectionInfoPath = request.getServletContext().getInitParameter("connection-info");
			
			System.out.println("DB접속 경로 설정 완료");
			System.out.println("경로 : " + root + "/" + connectionInfoPath);
			
			ConfigLocation.CONNECTION_CONFIG_LOCATION = root + "/" + connectionInfoPath;
		}
		
		/* DB 접속 설정 정보 파일의 경로가 비어있는 경우 초기화 작업 */
		if(ConfigLocation.MAPPER_LOCATION == null) {
			
			String root = request.getServletContext().getRealPath("/");
			
			String mapperInfoPath = request.getServletContext().getInitParameter("mapper-location");
			
			System.out.println("mapper 경로 설정 완료");
			
			System.out.println("경로확인 : " + root + "/" + mapperInfoPath);
			
			ConfigLocation.MAPPER_LOCATION = root + "/" + mapperInfoPath;
		}
		

		chain.doFilter(request, response);
	}


	public void destroy() {}

}
