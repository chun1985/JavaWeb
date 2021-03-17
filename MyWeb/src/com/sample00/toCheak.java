
package com.sample00;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.*;
import javax.servlet.*;

public class toCheak implements Filter {
	private FilterConfig filterConfig;

	public void init(FilterConfig filterConfig) {
		this.filterConfig = filterConfig;
		System.out.println("----- Filter initialized -----");
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html><head></head><body>");
		out.println("<br><h3> ----- Filter Msg ----- </h3>");
		out.println("</body></html>");
		filterChain.doFilter(request, response);
	}

	public void destroy() {
		System.out.println("----- Filter destroy -----");
	}
}
