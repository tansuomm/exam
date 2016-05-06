package org.yohta.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class SessionFilter
 */
public class SessionFilter implements Filter {
	FilterConfig fConfig;
	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		String nologinPaths = fConfig.getInitParameter("noLoginPaths");
		//req.setCharacterEncoding("UTF-8");
		String charset = fConfig.getInitParameter("charset");
		if(charset==null){
			charset="utf-8";
		}
		req.setCharacterEncoding(charset);
		
		if(nologinPaths!=null){
			String[] strArr = nologinPaths.split(";");
			for(int i = 0;i<strArr.length;i++){
				if(strArr[i]==null||"".equals(strArr[i])){
					continue;
				}
				if(req.getRequestURI().indexOf(strArr[i])!=-1){
					chain.doFilter(request, response);
					return;
				}
			}
		}
		if(session.getAttribute("username")!=null){
			chain.doFilter(request, response);
		}else{
			res.sendRedirect("/login/loginPre");
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		this.fConfig=fConfig;
	}

}
