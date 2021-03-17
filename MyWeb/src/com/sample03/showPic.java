
package com.sample03;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/showPic")
public class showPic extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, FileNotFoundException {
		String select = request.getParameter("select");
		response.setContentType("image/jpeg");
		File f = new File("");
		if (select.equals("showPic")) {
			f = new File("C:/Users/leech/git/MyWeb/MyWeb/Sample.jpg");
		}
		byte[] bytearray = new byte[(int) f.length()];
		FileInputStream is = new FileInputStream(f);
		is.read(bytearray);
		OutputStream os = response.getOutputStream();
		os.write(bytearray);
		os.flush();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, FileNotFoundException {
		doGet(request, response);
	}
}
