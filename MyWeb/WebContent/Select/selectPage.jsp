<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>選擇頁面</title>
</head>
<body>
<br>
<h1>請選擇執行項目</h1>
<form action="selectPage.jsp" method="post">
計算&nbsp;<select name="choose">
<option value="1">圓心與點的關係</option>
<option value="2">三角形面積</option>
<option value="3">BMI</option>
<option value="0" selected >請選擇執行項目</option>
</select>
<p><input type="submit" value="送出"/>
</form>
<%
String choose = request.getParameter("choose");
if("1".equals(choose)){%>
	<jsp:forward page="CirclePoint/InputPoint.jsp"/>
<%}else if("2".equals(choose)){%>
	<jsp:forward page="Triangle_Area/Input.jsp"/>
<% }else if("3".equals(choose)){%>
	<jsp:forward page="BMI/InputBody.jsp"/>
<% }else if("0".equals(choose)){%>
	<font color="#ff0000">請選擇執行項目</font>   
<% }%>
</body>
</html>