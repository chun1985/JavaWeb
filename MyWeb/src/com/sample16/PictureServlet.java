
package com.sample16;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PictureServlet")
public class PictureServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PictureServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cnt=request.getParameter("id");
		String[]  images= {"/MyWeb/images/cups.jpg","/MyWeb/images/earphone.jpg","/MyWeb/images/ipad.jpg","/MyWeb/images/lenovo.jpg","/MyWeb/images/shoes.jpg"};
		int count=Integer.parseInt(cnt)%images.length;        		
		response.getWriter().append(images[count]);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
