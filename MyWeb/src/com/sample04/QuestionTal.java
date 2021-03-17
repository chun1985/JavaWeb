
package com.sample04;

import java.io.*;
import java.net.URLEncoder;
import java.time.LocalDateTime;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/QuestionTal")
public class QuestionTal extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public QuestionTal() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		int tal = 0;
		Enumeration data = request.getParameterNames();
		String name;
		while (data.hasMoreElements()) {
			name = (String) data.nextElement();
			tal += Integer.parseInt(request.getParameter(name));
		}
		out.println("<br><font size='5'>問卷分數為: " + tal + "分</font><p>");
		LocalDateTime time = LocalDateTime.now();
		String strTime = String.format("%d 年 %02d 月 %02d 日 %02d 時 %02d 分", time.getYear(), time.getMonthValue(),
				time.getDayOfMonth(), time.getHour(), time.getMinute());
		Cookie cookie = new Cookie("strTime", URLEncoder.encode(strTime, "utf-8"));
		cookie.setMaxAge(3600 * 24 * 90);
		response.addCookie(cookie);
		out.println("<html><head><title>謝謝你的作答</title></head>");
		out.println("<body><h1>謝謝你的作答</h1>");
		out.println("<form action='/MyWeb/Question' method='post'>");
		out.println("<input type='submit' value='返回頁面' />");
		out.println("</form></body></html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
