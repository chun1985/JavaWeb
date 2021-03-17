
package com.sample01;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/Pay")
public class Pay extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Pay() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<html><head><title>付款方式</title></head><body>");
		out.print("<br>" + session.getAttribute("custName") + " 您好<p>");
		out.print("總共: " + session.getAttribute("total") + " 元<br>");
		out.print("請選擇付款方式:<br>");
		out.print("<form action='Message' method='post'>");
		out.print("<input type='radio' name='pay' value='小額支付'> 小額支付<p>");
		out.print("<input type='radio' name='pay' value='信用卡'> 信用卡<p>");
		out.print("<input type='radio' name='pay' value='現場付款' checked> 現場付款<p>");
		out.print("<input type='submit' value='確認'/>");
		out.print("</form></body></html>");
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
