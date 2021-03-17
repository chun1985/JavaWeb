<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>COOKIE清除</title>
</head>
<body>
<%
Cookie cookie = new Cookie("visitTime", "");
cookie.setMaxAge(0);
response.addCookie(cookie);
cookie = new Cookie("status", "");
cookie.setMaxAge(0);
response.addCookie(cookie);
out.println("<br><h2>身體量測紀錄</h2><h4>已刪除。</h4>");
%>
</body>
</html>