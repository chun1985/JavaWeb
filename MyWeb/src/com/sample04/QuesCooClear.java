
package com.sample04;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/QuesCooClear")
public class QuesCooClear extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cookie strTime = new Cookie("strTime", "");
		strTime.setMaxAge(0);
		response.addCookie(strTime);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html><head><meta http-equiv=\"Expires\" content=\"0\">");
		out.println("<title>問卷填寫紀錄已清除</title></head><body>");
		out.println("<br><h2>問卷填寫紀錄</h2><h4>已清除</h4>");
		out.println("<form action='/MyWeb/Question' method='post'>");
		out.println("<input type='submit' value='重新填寫問卷' />");
		out.println("</form></body></html>");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
