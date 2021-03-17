<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>選課系統</title>
</head>
<body>
<br>
<h1>選課系統</h1>
<form action = "total.jsp" method ="post">
帳號:&nbsp;<input type = "text" name = "user" size = "10"/>
<% 
if("y".equals(request.getAttribute("err"))){%>	
<font color="#ff0000">帳號或密碼輸入錯誤</font>
<%}
%><p>
密碼:&nbsp;<input type = "password" name = "pass" size = "10"/><p>
上&nbsp;<select name="choose">
<option value="Java">Java 90點</option>
<option value="Android">Android 60點</option>
<option value="PHP">PHP 50點</option>
<option value="VB">VB 70點</option>
<option value="" selected >請選擇課程</option>
</select>
<%if("y".equals(request.getAttribute("noChoose"))){%>
	<font color="#ff0000">請選擇課程</font>	
<% } %><p>
<input type = "submit" value ="送出" />
</form></body>
</html>