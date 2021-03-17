<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>VMSQL_myDB_學生資料</title>
</head>
<body>
    <br><h1>VMSQL_myDB_學生資料</h1>
    <%
	String url = "jdbc:sqlserver://VMSQL:7531;databaseName=myDB";
	String user ="app";
	String pw ="app";
	
	Connection con = null;
	DatabaseMetaData metadata= null;
	Statement stmt = null;
	ResultSet rs = null;
	String sql = "";
	
	// 載入驅動程式
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	//連線
    con = DriverManager.getConnection( url + ";user=" + user + "; password=" + pw + ";");
    metadata = con.getMetaData();  
	stmt = con.createStatement();
	         
	out.print("<table border='1'>");
	out.print("<tr><td>Database Product Name:</td><td><font color='#ff0000'>"+ metadata.getDatabaseProductName()+"</font></td></tr>");
    out.print("<tr><td>Version:</td><td><font color='#ff0000'>"+ metadata.getDatabaseProductVersion()+"</font></td></tr></table>");
    
    out.print("<table border='1'>");
    out.print("<tr><td>Driver Name:</td><td><font color='#ff0000'>"+ metadata.getDriverName()+"</font></td></tr><br>");
    out.print("<tr><td>Version:</td><td><font color= '#ff0000'>"+ metadata.getDriverVersion()+"</font></td></tr></table><p>");
    
    sql = ("select * from 學生資料");
    rs = stmt.executeQuery(sql);
	rs.next();
	if (rs.getRow() > 0) {
		out.print("<table border='1'>");
		out.print("<tr><td>學號<td>姓名<td>地址<td>電話<td>生日");
		do //讀取一筆
		{
	out.println("<tr>");
	out.println("<td>" + rs.getString("學號"));
	out.println("<td>" + rs.getString("姓名"));
	out.println("<td>" + rs.getString("地址"));
	out.println("<td>" + rs.getString("電話"));
	out.println("<td>" + rs.getString("生日"));
		} while (rs.next());
		out.println("</table>");
    out.close();
	}
	%>
</body>
</html>