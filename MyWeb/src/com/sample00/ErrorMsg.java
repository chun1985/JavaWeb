
package com.sample00;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ErrorMsg")
public class ErrorMsg extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String str;
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html><head><title>錯誤訊息</title></head><body>");
		out.println("<br><h2>錯誤訊息</h2>");
		out.println("<p><table border ='1'>");
		out.println("<tr><td>message:</td><td><font color='#ff0000'>" + request.getAttribute("javax.servlet.error.message") + "</font></td></tr>");
		out.println("<tr><td>code:</td><td>" + request.getAttribute("javax.servlet.error.status_code") + "</td></tr>");
		out.println("<tr><td>type:</td><td>" + request.getAttribute("javax.servlet.error.exception_type") + "</td></tr>");
		out.println("<tr><td>exception:</td><td>" + request.getAttribute("javax.servlet.error.exception") + "</td></tr>");
		out.println("<tr><td>URL:</td><td><font color='#ff0000'>" + request.getAttribute("javax.servlet.error.request_uri") + "</font></td></tr>");
		out.println("<tr><td>servlet:</td><td><font color='#ff0000'>" + request.getAttribute("javax.servlet.error.servlet_name") + "</font></td></tr>");
		out.println("</table></body></html>");
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, FileNotFoundException {
		doGet(request, response);
	}
}
