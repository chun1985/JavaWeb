
package com.sample01;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/Order")
public class Order extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ServletConfig config;

	public Order() {
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		this.config = config;
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<html><head><title>訂單已確認</title></head><body>");
		out.print("<br><h3>訂單已確認</h3>");
		out.print("<h4>謝謝惠顧</h4>");
		out.print("<form action ='Drink/DrinkMenu.jsp' method = 'post'/>");
		out.print("<input type = 'submit' value = '回首頁'/>");
		out.print("</form></body></html>");
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
