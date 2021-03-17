
package com.sample01;

import javax.servlet.*;

public class Price implements ServletContextListener {
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		ServletContext sc = sce.getServletContext();
		sc.log("----- Price Destroyed -----");
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		ServletContext sc = sce.getServletContext();
		sc.setAttribute("redTeaPrice", 20);
		sc.setAttribute("greenTeaPrice", 25);
		sc.setAttribute("coffeePrice", 50);
		sc.setAttribute("bigBagPrice", 2);
		sc.setAttribute("smallBagPrice", 1);
		sc.log("----- Price Initialized -----");
	}
}
