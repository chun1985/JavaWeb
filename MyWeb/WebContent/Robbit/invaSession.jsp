<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>session invalidate</title>
</head>
<body>
<%
session.invalidate();
%>
<br><h1>session invalidate</h1>
<font color="#ff0000">重新啟動</font>伺服器後<p>
<font color="#ff0000">註冊帳號</font>即可消除
</body>
</html>