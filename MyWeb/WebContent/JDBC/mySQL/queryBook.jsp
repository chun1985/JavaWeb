<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>
<%@page errorPage="ErrorMsg.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
    <br><h1>書籍查詢系統</h1>
	<form action="queryBook.jsp" method="post">
	    <input type="radio" name="choose" value="name" checked>輸入書名關鍵字:<br>
		<input type="text" name="bookname" size="14" /><p> 
		<input type="radio" name="choose" value="number">價格
		<input type="text" name="num" size="3" /><br>以下的書籍<p>
		<input type="submit" value="送出" >
		<input type ="reset" value ="重新輸入" >
	</form>
	<%
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	// 載入驅動程式
	Class.forName("com.mysql.jdbc.Driver");
	//連線
	con = DriverManager.getConnection("jdbc:mysql://localhost/bookdb", "root", "");
	stmt = con.createStatement();
	String bookname = request.getParameter("bookname");
	String strBookNum = request.getParameter("num");
	String choose = request.getParameter("choose");
	String sql = "";
	int booknum = 0;
	if (bookname != "" && bookname != null && "name".equals(choose)) {
		sql = ("select * from book where name like '%" + bookname + "%' ");
	} else if (strBookNum != "" && strBookNum != null && "number".equals(choose)) {
		try {	
			booknum = Integer.parseInt(strBookNum);
			sql = "select * from book where price < '" + booknum + "' ";
		} catch (Exception e) {
			String msg = "輸入數值包含其他符號";
			throw new Exception(msg);
		}
	} else if (bookname == "" || strBookNum == "" ) {
		out.println("輸入的關鍵字 <font color='#ff0000'>\" 不可空白 \"</font> ");
	}
	if (sql != null && sql != "") {
		rs = stmt.executeQuery(sql);
		rs.next();
		if (rs.getRow() > 0) {
			out.print("<table border='1'>");
			out.print("<tr><td>num<td>name<td>price<td>image");
			do //讀取一筆
			{
		out.println("<tr>");
		out.println("<td>" + rs.getString("num"));
		out.println("<td>" + rs.getString("name"));
		out.println("<td>" + rs.getString("price"));
		out.println("<td>" + rs.getString("image"));
			} while (rs.next());
			out.println("</table>");
		} else {
			if("name".equals(choose)){
			out.println("沒有符合關鍵字為<font color='#ff0000'> \" " + bookname + " \" </font>的書籍");
			}else if("number".equals(choose)){
			out.println("沒有符合<font color='#ff0000'> \" 價格 " + booknum + " 以下 \" </font>的書籍");
		}
		}
	}
	out.close();
	stmt.close();
	%>
</body>
</html>