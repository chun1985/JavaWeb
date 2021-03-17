<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import = "java.util.*" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>選課結果</title>
</head>
<body>
<br>
<h1>選課結果</h1>
<%
Hashtable userPW = new Hashtable();
userPW.put("jack","0000");
userPW.put("tom","1111");
userPW.put("ted","2222");
userPW.put("jon","3333");

Hashtable userData = new Hashtable();
userData.put("jack","120");
userData.put("tom","80");
userData.put("ted","160");
userData.put("jon","30");

Hashtable userZHname = new Hashtable();
userZHname.put("jack","傑克");
userZHname.put("tom","湯姆");
userZHname.put("ted","泰迪");
userZHname.put("jon","約翰");
%>
<% 
String name = request.getParameter("user");
String pass = request.getParameter("pass");
if(name != "" && pass != "" && pass.equals(userPW.get(name))){
String choose = request.getParameter("choose");
int userPoint = 0,userPointBefore = 0, coursePoint =0;
boolean boo = false;
userPointBefore = Integer.parseInt((String)userData.get(name));
userPoint = userPointBefore;

if("Java".equals(choose)){
	coursePoint = Integer.parseInt(config.getInitParameter("Java"));
	if(userPoint>coursePoint){
		userPoint -= coursePoint;
    	boo = true;
    }
}else if("Android".equals(choose)){
	coursePoint = Integer.parseInt(config.getInitParameter("Android"));
	if(userPoint>coursePoint){
		userPoint -= coursePoint;
    	boo = true;
    }
}else if("PHP".equals(choose)){
	coursePoint = Integer.parseInt(config.getInitParameter("PHP"));
	if(userPoint>coursePoint){
		userPoint -= coursePoint;
    	boo = true;
    }
}else if("VB".equals(choose)){
	coursePoint = Integer.parseInt(config.getInitParameter("VB"));
	if(userPoint>coursePoint){
		userPoint -= coursePoint;
    	boo = true;
    }
}else if("".equals(choose)){
	request.setAttribute("noChoose","y");
%>
	<jsp:forward page="Course.jsp"/>	
<%}
String nameZH = (String)userZHname.get(name);
out.print("<font color='#0080ff'>"+nameZH +"</font> 您好<p>");
if(boo){
	out.print("您原本點數為 <font color='#ff0000'>"+userPointBefore+"</font><br>");
    out.print("選擇 <font color='#ff0000'>"+choose+"</font> 課程後<p>");
}
out.print("您剩下點數 <font color='#ff0000'>" +userPoint +"</font> 點");
if(!boo){
	out.print("<p>不夠你選 <font color='#ff0000'>" +choose +"</font> 課程");
	out.print("<br>" +choose +" 課程，需要 <font color='#ff0000'>"+coursePoint+"</font> 點");
}
}else{
	request.setAttribute("err","y");%>
  <jsp:forward page="Course.jsp"/>
<%}%>
<p><form action = "Course.jsp" method ="post">
<input type = "submit" value ="回選課頁面" />
</form></body>
</body>
</html>