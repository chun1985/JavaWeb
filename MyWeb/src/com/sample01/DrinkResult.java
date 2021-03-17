
package com.sample01;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DrinkResult")
public class DrinkResult extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ServletConfig config;

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		this.config = config;
	}

	public DrinkResult() {
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<html><head><title>點餐資訊</title></head><body>");
		if (request.getParameterValues("drink") != null && request.getParameter("custName") != "") {
			String[] paramValues = request.getParameterValues("drink");
			String custName = request.getParameter("custName");
			HttpSession session = request.getSession();
			session.setAttribute("custName", custName);
			int[] qtys = new int[] { 0, 0, 0 };
			try {
				for (int i = 0; i < paramValues.length; i++) {
					if ("redTea".equals(paramValues[i])) {
						qtys[0] = Integer.parseInt(request.getParameter("redQty"));
					} else if ("greenTea".equals(paramValues[i])) {
						qtys[1] = Integer.parseInt(request.getParameter("greenQty"));
					} else if ("coffee".equals(paramValues[i])) {
						qtys[2] = Integer.parseInt(request.getParameter("coffeeQty"));
					}
				}
			} catch (Exception e) {
				request.setAttribute("error", "y");
				RequestDispatcher rd = request.getRequestDispatcher("/Drink/DrinkMenu.jsp");
				rd.forward(request, response);
			}
			ServletContext sc = config.getServletContext();
			int[] price = { (Integer) sc.getAttribute("redTeaPrice"), (Integer) sc.getAttribute("greenTeaPrice"),
					(Integer) sc.getAttribute("coffeePrice"), (Integer) sc.getAttribute("bigBagPrice"),
					(Integer) sc.getAttribute("smallBagPrice") };
			int total = 0;
			out.print("<br>" + custName + " 您好<p>");
			for (int i = 0; i < paramValues.length; i++) {
				if ("redTea".equals(paramValues[i])) {
					out.print("紅茶 " + qtys[0] + " 杯 * 單價 " + price[0] + " 元 = " + qtys[0] * price[0] + " 元<br>");
					total += qtys[0] * price[0];
				} else if ("greenTea".equals(paramValues[i])) {
					out.print("綠茶 " + qtys[1] + " 杯 * 單價 " + price[1] + " 元 = " + qtys[1] * price[1] + " 元<br>");
					total += qtys[1] * price[1];
				} else if ("coffee".equals(paramValues[i])) {
					out.print("咖啡 " + qtys[2] + " 杯 * 單價 " + price[2] + " 元 = " + qtys[2] * price[2] + " 元<br>");
					total += qtys[2] * price[2];
				}
			}
			String bag = request.getParameter("bag");
			int bagQty = 0;
			try {
				if ("notNeed".equals(bag) == false) {
					bagQty = Integer.parseInt(request.getParameter("bagQty"));
				}
			} catch (Exception e) {
				request.setAttribute("error", "y");
				RequestDispatcher rd = request.getRequestDispatcher("/Drink/DrinkMenu.jsp");
				rd.forward(request, response);
			}
			if (!("notNeed".equals(bag))) {
				out.print("<br>小計: " + total + " 元<br>");
				out.print("<br>加購:<br>");
			}
			if ("big".equals(bag)) {
				out.print("大塑膠袋 " + bagQty + " 個 * 單價 " + price[3] + " 元 = " + bagQty * price[3] + " 元<br>");
				total += bagQty * 2;
			} else if ("small".equals(bag)) {
				out.print("小塑膠袋 " + bagQty + " 個 * 單價 " + price[4] + " 元 = " + bagQty * price[4] + " 元<br>");
				total += bagQty * 1;
			}
			session.setAttribute("total", total);
			out.print("<br>總共: " + total + " 元<br>");
			out.print("<form action='Drink/DrinkMenu.jsp' method='post'>");
			out.print("<input type ='submit' value = '重新勾選'/></form>");
			out.print("<form action='Pay' method='post'>");
			out.print("<input type ='submit' value = '結帳'/>");
			out.print("</form></body></html>");
			out.close();
		} else {
			out.print("</body></html>");
			if (request.getParameterValues("drink") == null && request.getParameter("custName") != "") {
				request.setAttribute("nullCode", "0");
			} else if (request.getParameterValues("drink") != null && request.getParameter("custName") == "") {
				request.setAttribute("nullCode", "1");
			} else {
				request.setAttribute("nullCode", "2");
			}
			RequestDispatcher rd = request.getRequestDispatcher("/Drink/DrinkMenu.jsp");
			rd.forward(request, response);
		}
	}
}
