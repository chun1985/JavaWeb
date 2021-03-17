
package com.sample02;

import java.util.*;
import javax.servlet.*;

public class RobbitData implements ServletContextListener {
	Hashtable users = new Hashtable();
	Hashtable name = new Hashtable();
	Hashtable age = new Hashtable();
	Hashtable weight = new Hashtable();
	Set usersCheck = new HashSet();

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		ServletContext sc = sce.getServletContext();
		sc.log("----- RobbitData Destroyed -----");
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		users.put("mizumori71", "00000000");
		name.put("mizumori71","不死兔");
		age.put("mizumori71",3);
		weight.put("mizumori71",30.1);

		users.put("mizumori54", "00000000");
		name.put("mizumori54","好想兔");
		age.put("mizumori54",5);
		weight.put("mizumori54",42.2);

		users.put("chika0801", "00000000");
		name.put("chika0801","蘿蔔兔");
		age.put("chika0801",1);
		weight.put("chika0801",10.7);
				
		usersCheck.add("mizumori71");
		usersCheck.add("mizumori54");
		usersCheck.add("chika0801");
		
		ServletContext sc = sce.getServletContext();
		sc.setAttribute("users", users);
		sc.setAttribute("name", name);
		sc.setAttribute("age", age);
		sc.setAttribute("weight", weight);
		sc.setAttribute("usersCheck", usersCheck);
		
		sc.log("----- RobbitData Initialized -----");
	}
}
