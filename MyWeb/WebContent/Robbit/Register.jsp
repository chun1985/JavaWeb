<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page errorPage="ErrorMsg.jsp"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>帳號註冊</title>
</head>
<body>
<br><h1>帳號註冊</h1>
<%
String errMsg1 = (String)request.getAttribute("errMsg1");
String errMsg2 = (String)request.getAttribute("errMsg2");
String errMsg3 = (String)request.getAttribute("errMsg3");
String errMsg4 = (String)request.getAttribute("errMsg4");
String errMsg5 = (String)request.getAttribute("errMsg5");
String errMsg6 = (String)request.getAttribute("errMsg6");
%>
<form action ="/MyWeb/RegisterServlet" method ="post">
帳號:&nbsp;<input type = "text" name = "newUser" size ="10">
<% if("y".equals(errMsg1)){%>
<font color = "#ff0000" >此帳號已有人使用</font><br>
<%}else if("y".equals(errMsg5)){%>
<font color = "#ff0000" >輸入欄位包含其他符號或空白</font>	
<% } %> <p>
密碼:&nbsp;<input type = "password" name = "newPass1" size ="10">
<% if("y".equals(errMsg6)){%>
<font color = "#ff0000" >輸入密碼不一致</font>	
<% }else if("y".equals(errMsg2)){%>
<font color = "#ff0000" >請輸入8位數以上的密碼</font>	
<% }else if("y".equals(errMsg3)){%>
<font color = "#ff0000" >請輸入包含大小寫英文及數字的密碼</font>	
<% } %> <p>
密碼確認:&nbsp;<input type = "password" name = "newPass2" size ="10"><p>
寵物名:&nbsp;<input type = "text" name = "newName" size ="10">
<% if("y".equals(errMsg4)){%>
<font color = "#ff0000" >請輸入純中文或純英文名字</font>
<% }%><p>
<input type = "submit" value = "註冊">
<input type = "reset" value ="重新輸入">
</form></body>
</html>