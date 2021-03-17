
package com.sample02;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ServletConfig config;

	public RegisterServlet() {
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
		ServletContext sc = config.getServletContext();

		Hashtable users = new Hashtable();
		Hashtable name = new Hashtable();
		Hashtable age = new Hashtable();
		Hashtable weight = new Hashtable();
		Set usersCheck = new HashSet();

		String newUser = request.getParameter("newUser");
		String newPass1 = request.getParameter("newPass1");
		String newPass2 = request.getParameter("newPass2");
		String newName = request.getParameter("newName");

		HttpSession session = request.getSession();
		// 初始化 usersCheck 只會有一次
		usersCheck = (HashSet) sc.getAttribute("usersCheck");
		// 判斷是否有重複帳號
		boolean boo1 = usersCheck.add(newUser);
		if (boo1) {
			usersCheck.remove(newUser);
		}
		// 判斷密碼是否包含特殊符號
		boolean boo2 = newUser.matches("[a-zA-Z0-9]+");
		boolean boo3 = newPass1.matches("[a-zA-Z0-9]+");
		// 判斷密碼是否少於8位數
		boolean boo4 = newPass1.length() > 7;
		// 判斷密碼是否包含大小寫英文及數字
		boolean boo5 = cheakPWfont(newPass1);
		// 判斷名字是否為全中文
		boolean boo6 = newName.matches("[\\u4e00-\\u9fa5]+");
		// 判斷名字是否為全英文
		boolean boo7 = newName.matches("[a-zA-Z]+");

		if (boo1 && boo2 && boo3 && boo4 && boo5 && (boo6 || boo7)) {
			if (newPass1.equals(newPass2)) {
				int newAge = 1;
				double newWeight = (double) (new Random().nextInt(20) + 10) / 10;

				users = (Hashtable) sc.getAttribute("users");
				name = (Hashtable) sc.getAttribute("name");
				age = (Hashtable) sc.getAttribute("age");
				weight = (Hashtable) sc.getAttribute("weight");

				users.put(newUser, newPass1);
				name.put(newUser, newName);
				age.put(newUser, newAge);
				weight.put(newUser, newWeight);
				usersCheck.add(newUser);

				session.setAttribute("update", "y");
				session.setAttribute("usersNew", users);
				session.setAttribute("nameNew", name);
				session.setAttribute("ageNew", age);
				session.setAttribute("weightNew", weight);
				session.setAttribute("usersCheckNew", usersCheck);

				PrintWriter out = response.getWriter();
				out.println("<html><head><title>帳號註冊完成</title></head><body>");
				out.print("<br><h1>帳號註冊完成</h1><p>");
				out.print("輸入的帳號: <font color = \"#ff0000\" >" + newUser + "</font>");
				out.print("<br>輸入的密碼: <font color = \"#ff0000\" >*****" + newPass1.substring(5, newPass1.length())
						+ "</font>");
				out.print("<br>輸入的寵物名: <font color = \"#ff0000\" >" + newName + "</font>");
				out.print("<br>輸入的年齡: <font color = \"#ff0000\" >" + newAge + "</font>");
				out.print("<br>輸入的體重: <font color = \"#ff0000\" >" + newWeight + "</font>");
				out.print(
						"<br><form action = '/MyWeb/Login' method = 'post'><input  type='submit'  value ='回登入頁面'></form>");
				out.print("</body></html>");
				out.close();
			} else {
				request.setAttribute("errMsg6", "y");
				RequestDispatcher rd = request.getRequestDispatcher("/Robbit/Register.jsp");
				rd.forward(request, response);
			}
		} else if (boo1 == false) {
			request.setAttribute("errMsg1", "y");
			RequestDispatcher rd = request.getRequestDispatcher("/Robbit/Register.jsp");
			rd.forward(request, response);
		} else if (boo4 == false) {
			request.setAttribute("errMsg2", "y");
			RequestDispatcher rd = request.getRequestDispatcher("/Robbit/Register.jsp");
			rd.forward(request, response);
		} else if (boo5 == false) {
			request.setAttribute("errMsg3", "y");
			RequestDispatcher rd = request.getRequestDispatcher("/Robbit/Register.jsp");
			rd.forward(request, response);
		} else if ((boo6 || boo7) == false) {
			request.setAttribute("errMsg4", "y");
			RequestDispatcher rd = request.getRequestDispatcher("/Robbit/Register.jsp");
			rd.forward(request, response);
		} else {
			request.setAttribute("errMsg5", "y");
			RequestDispatcher rd = request.getRequestDispatcher("/Robbit/Register.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private boolean cheakPWfont(String str) {
		boolean boo1 = false;
		boolean boo2 = false;
		boolean boo3 = false;

		for (int i = 0; i < str.length(); i++) {
			if (str.substring(i, i + 1).matches("[A-Z]")) {
				boo1 = true;
				break;
			}
		}
		for (int j = 0; j < str.length(); j++) {
			if (str.substring(j, j + 1).matches("[a-z]")) {
				boo2 = true;
				break;
			}
		}
		for (int k = 0; k < str.length(); k++) {
			if (str.substring(k, k + 1).matches("[0-9]")) {
				boo3 = true;
				break;
			}
		}
		return boo1 && boo2 && boo3;
	}
}
