
package com.sample02;

import java.util.Hashtable;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	Hashtable users = new Hashtable();
	ServletConfig config;

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		this.config = config;
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws javax.servlet.ServletException, java.io.IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws javax.servlet.ServletException, java.io.IOException {
		ServletContext sc = config.getServletContext();
		HttpSession session = req.getSession();
		String update = (String) session.getAttribute("update");
		if ("y".equals(update)) {
			users = (Hashtable) session.getAttribute("usersNew");
		} else {
			users = (Hashtable) sc.getAttribute("users");
		}
		String userid = req.getParameter("userid");
		String password = req.getParameter("password");

		if (userid != null && password != null && password.equals(users.get(userid))) {
			req.setAttribute("userid", userid);
			ServletContext ct = getServletContext();
			RequestDispatcher rd = ct.getRequestDispatcher("/MyRobbit");
			rd.forward(req, res);
			return;
		} else {
			req.setAttribute("errMsg", "y");
			RequestDispatcher rd = req.getRequestDispatcher("/Login");
			rd.forward(req, res);
			return;
		}
	}
}
