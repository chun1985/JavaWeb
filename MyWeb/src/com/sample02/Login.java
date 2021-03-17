
package com.sample02;

import java.io.*;
import java.time.LocalDateTime;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/Login")
public class Login extends HttpServlet implements Serializable {
	private static final long serialVersionUID = 1L;
	ServletConfig config;
	Hashtable users = new Hashtable();
	
	public Login() {
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		this.config = config;
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int x = 0, count = 0;
		//int x = 999988, count =0;
		String startDate = "";
		
		try (ObjectInputStream ois = new ObjectInputStream(
				new FileInputStream("C:/Users/leech/git/MyWeb/MyWeb/count.save"))) {
			x = (Integer) ois.readObject();
		} catch (IOException | ClassNotFoundException ex) {
		}
		if (x == 0) {
			LocalDateTime date = LocalDateTime.now();
			startDate = String.format("%d 年 %02d 月 %02d 日 %02d 時 %02d 分", 
					date.getYear(), date.getMonthValue(),date.getDayOfMonth(),
					date.getHour(), date.getMinute());
			try (ObjectOutputStream oos = new ObjectOutputStream(
					new FileOutputStream("C:/Users/leech/git/MyWeb/MyWeb/startDate.save"))) {
				oos.writeObject(startDate);
			} catch (IOException ex) {
			}
		} else {
			try (ObjectInputStream ois = new ObjectInputStream(
					new FileInputStream("C:/Users/leech/git/MyWeb/MyWeb/startDate.save"))) {
				startDate = (String) ois.readObject();
			} catch (IOException | ClassNotFoundException ex) {
			}
		}
		String errMsg = (String) request.getAttribute("errMsg");
		if ("y".equals(errMsg) == false) {
			if (x < 1000000) {
				++x;
			} else {
				x = 1000000;
			}
		}
		try (ObjectOutputStream oos = new ObjectOutputStream(
				new FileOutputStream("C:/Users/leech/git/MyWeb/MyWeb/count.save"))) {
			oos.writeObject(x);
		} catch (IOException ex) {
		}
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
			
		HttpSession session = request.getSession();
		String update = (String) session.getAttribute("update");
		if ("y".equals(update)) {
			users = (Hashtable) session.getAttribute("usersNew");
		} else {
			ServletContext sc =config.getServletContext();
			users = (Hashtable) sc.getAttribute("users");
		}
		Set<String> keys = users.keySet();
		String usersID = "<h4>已註冊帳號:<p><font color=\"#0000a0\">";
        for (String key : keys) {
        	count++;
        	usersID += String.format("%s<br>", key);
        }
        
		PrintWriter out = response.getWriter();
		out.println("<html><head><title>電子寵物兔登入</title></head><body>");
		out.println("<br><h4>於 <font color='#ff8000'>" + startDate + "</font> 開始計算</h4>");
		out.println("<h4>瀏覽次數:&nbsp");
		if (x == 1000000) {
			out.println(x + " 以上</h4>");
		} else {
			out.println(x + "</h4>");
		}
		out.print(usersID + "</font><p>");
		
		out.print("<form action='/MyWeb/Robbit/invaSession.jsp' method='post'>");
		if(count>3) {
		out.print("<input type='submit' value='清除註冊帳號' /></form>");
		}else {
			out.print("<input type='submit' value='清除註冊帳號' Disabled /></form>");
		}
		
		out.print("<form action='LoginServlet' method='post'>");
		out.print("帳號 :&nbsp; <input type='text' name='userid' size='10'/><br>");
		out.print("<br> 密碼 : &nbsp;<input type='password' name='password' size='10'/><br>");
		if ("y".equals(errMsg)) {
			out.print("<br><font color=\"#ff0000\">帳號或密碼輸入錯誤!!</font><br>");
		}
		out.print("<br> <input type='submit' value='登入'/></form>");
		out.print("<form action='/MyWeb/Robbit/Register.jsp' method='post'>");
		out.print("<input type='submit' value='註冊' /></form>");
		out.print("</body></html>");
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
