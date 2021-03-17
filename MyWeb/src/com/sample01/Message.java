
package com.sample01;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/Message")
public class Message extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Message() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<html><head><title>結帳資訊</title></head><body>");
		HttpSession session = request.getSession();
		String custName = (String) session.getAttribute("custName");
		String pay = request.getParameter("pay");
		session.setAttribute("pay", pay);
		out.print("<br>" + custName + " 您好<p>");
		out.print("付款方式為 " + pay + "<br>");
		out.print("<form action='Pay' method='post'>");
		out.print("<input type ='submit' value = '重新選擇'/></form>");
		out.print("<form action ='Order' method = 'post'/>");
		out.print("<input type = 'submit' value = '確認'/>");
		out.print("</form></body></html>");
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
