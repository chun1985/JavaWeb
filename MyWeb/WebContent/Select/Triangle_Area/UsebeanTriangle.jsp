<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page errorPage="ErrorMsg.jsp"%>
<jsp:useBean id="TriangleArea" scope="session"
	class="com.sample07.TriangleArea" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>三角形面積</title>
</head>
<body>
	<%
		double base = 0, high = 0;
	try {
		base = Double.parseDouble(request.getParameter("base"));
		high = Double.parseDouble(request.getParameter("high"));
	} catch (Exception e) {
		String msg = "輸入內容包含其他符號";
		throw new Exception(msg);
	}
	if (base < 1) {
		String msg = "底邊 < 1";
		throw new Exception(msg);
	} else if (high < 1) {
		String msg = "高度 < 1";
		throw new Exception(msg);
	} else {
		TriangleArea.setBase(base);
		TriangleArea.setHigh(high);
	}
	%>
	<br>
	<h2>三角形面積</h2>
	<%
		out.print("底 " + base + " * 高 " + high);
	%>
	<br>
	<%
		out.print("面積 = " + TriangleArea.getArea());
	%>
<p><form  action = "/MyWeb/Select/Triangle_Area/Input.jsp" method = "post">
<input type = "submit" value = "重新輸入"/>
</form><p>
<form  action = "/MyWeb/Select/selectPage.jsp" method = "post">
<input type = "submit" value = "回選擇頁面"/>
</form>
</body>
</html>