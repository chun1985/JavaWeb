
package com.sample02;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/MyRobbit")
public class MyRobbit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ServletConfig config;
	Hashtable name = new Hashtable();
	Hashtable age = new Hashtable();
	Hashtable weight = new Hashtable();

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		this.config = config;
	}

	public MyRobbit() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String userid = (String) request.getAttribute("userid");
		
        HttpSession session = request.getSession(); 
		String update = (String)session.getAttribute("update");
        if("y".equals(update)) {
        	name = (Hashtable) session.getAttribute("nameNew");
        	age = (Hashtable) session.getAttribute("ageNew");
            weight = (Hashtable) session.getAttribute("weightNew");
		}else {
		ServletContext sc = config.getServletContext();
	    name = (Hashtable) sc.getAttribute("name");
    	age = (Hashtable)  sc.getAttribute("age");
    	weight = (Hashtable) sc.getAttribute("weight");
		}
        
		Robbit robbit = new Robbit();
		robbit.setName((String)name.get(userid));
		robbit.setAge((Integer)age.get(userid));
		robbit.setWeight((Double)weight.get(userid));
		
		PrintWriter out = response.getWriter();
		out.print("<html><head><title>電子寵物兔</title></head><body>");
		out.print("<br><h2>" + userid + "&nbsp的電子寵物兔</h2><p>");
		out.print("<table border = '1'>");
		out.print("<tr><td>名字:</td><td>" + robbit.getName() + "</td>");
		out.print("<td>年齡:</td><td>" + robbit.getAge() + "</td></tr>");
		out.print("<tr><td>體重:</td><td>" + robbit.getWeight() + "</td>");
		out.print("<td>健康狀況:</td><td>" + robbit.getIssue() + "</td></tr>");
		out.print("</table><form action = 'Login'>");
		out.print("<input type ='submit' value = '登出'/>");
		out.print("</form></body></html>");
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
