package hujw;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

//@WebFilter(filterName="log",urlPatterns= {"/*"})
public class LogFilter implements Filter {
	private FilterConfig config;
	@Override
	public void destroy() {
		this.config=null;
	}
	//执行过滤
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		ServletContext context=config.getServletContext();
		long befor=System.currentTimeMillis();
		System.out.println("开始过滤");
		HttpServletRequest hsr=(HttpServletRequest) request;
		System.out.println("Filter  已经截获到用户请求地址"+hsr.getServletPath());
		chain.doFilter(request, response);
		long after =System.currentTimeMillis();
		System.out.println("请求被定位到:"+hsr.getRequestURL()+"所花的时间:"+(after-befor));
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		this.config=config;
	}

}
