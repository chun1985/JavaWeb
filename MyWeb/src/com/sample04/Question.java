
package com.sample04;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/Question")
public class Question extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Question() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		Cookie[] ck = request.getCookies();
		boolean find = false;
		String strTime = "";
		if (ck != null) {
			for (int i = 0; i < ck.length; i++) {
				if (ck[i].getName().equals("strTime")) {
					find = true;
					strTime = ck[i].getValue();
					strTime = java.net.URLDecoder.decode(strTime, "utf-8");
					break;
				}
			}
		}
		if (strTime != "") {
			out.println("<br><h2>於 <font color='#ff8000'>" + strTime + "</font> 已做過問卷</h2>");
			out.println("<form action='/MyWeb/QuesCooClear' method='post'>");
			out.println("<input type='submit' value='清除問卷紀錄' />");
			out.println("</form>");
		} else {
			out.println("<br>");
		}
		out.println("<h1>巨匠電腦問卷調查</h1>");
		out.println("<form action='/MyWeb/QuestionTal' method='post'>");
		out.println("1.授課老師上課方式?<p>");
		out.println("<input type='radio' name='q1' value='20'>非常滿意<p>");
		out.println("<input type='radio' name='q1' value='15'>滿意<p>");
		out.println("<input type='radio' name='q1' value='10'>尚可<p>");
		out.println("<input type='radio' name='q1' value='5'>不滿意<p>");
		out.println("2.授課老師進度安排?<p>");
		out.println("<input type='radio' name='q2' value='20'>非常滿意<p>");
		out.println("<input type='radio' name='q2' value='15'>滿意<p>");
		out.println("<input type='radio' name='q2' value='10'>尚可<p>");
		out.println("<input type='radio' name='q2' value='5'>不滿意<p>");
		out.println("3.授課老師問題回答?<p>");
		out.println("<input type='radio' name='q3' value='20'>非常滿意<p>");
		out.println("<input type='radio' name='q3' value='15'>滿意<p>");
		out.println("<input type='radio' name='q3' value='10'>尚可<p>");
		out.println("<input type='radio' name='q3' value='5'>不滿意<p>");
		out.println("4.客服人員問題處理方式?<p>");
		out.println("<input type='radio' name='q4' value='20'>非常滿意<p>");
		out.println("<input type='radio' name='q4' value='15'>滿意<p>");
		out.println("<input type='radio' name='q4' value='10'>尚可<p>");
		out.println("<input type='radio' name='q4' value='5'>不滿意<p>");
		out.println("5.客服人員問題處理速度?<p>");
		out.println("<input type='radio' name='q5' value='20'>非常滿意<p>");
		out.println("<input type='radio' name='q5' value='15'>滿意<p>");
		out.println("<input type='radio' name='q5' value='10'>尚可<p>");
		out.println("<input type='radio' name='q5' value='5'>不滿意<p>");
		if (find == false) {
			out.println("<input type='submit' value='送出' />");
			find = true;
		} else
			out.println("<input type='submit' value='送出' disabled />");
		out.println("</form>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
