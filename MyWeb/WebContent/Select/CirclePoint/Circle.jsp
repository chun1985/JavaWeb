<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page errorPage="ErrorMsg.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>點與圓的關係</title>
</head>
<body>
	<%
		double Xcenter = 0.0, Ycenter = 0.0, r = 0.0, Xpoint = 0.0, Ypoint = 0.0;
	try {
		Xcenter = Double.parseDouble(request.getParameter("Xcenter"));
		Ycenter = Double.parseDouble(request.getParameter("Ycenter"));
		r = Double.parseDouble(request.getParameter("r"));
		Xpoint = Double.parseDouble(request.getParameter("Xpoint"));
		Ypoint = Double.parseDouble(request.getParameter("Ypoint"));
	} catch (Exception e) {
		String msg = "輸入內容包含其他符號";
		throw new Exception(msg);
	}
	if (r > 0) {
		double Xdistance = doDistance(Xpoint, Xcenter);
		double Ydistance = doDistance(Ypoint, Ycenter);
		double distance = Math.sqrt(Math.pow(Xdistance, 2) + Math.pow(Ydistance, 2));
	%>
	<br>
	<h3>
		<%
			out.print("圓心與點距離: " + String.format("%.2f", distance));
		%>
	</h3>
	<h4>
		<%
			if (distance > r) {
			out.print("點在圓外");
		} else {
			out.print("點在圓內");
		}
		} else {
		String msg = "輸入半徑 < 1";
		throw new Exception(msg);
		}
		%>
	</h4>
	<%!private double doDistance(double p1, double p2) {
		double distance = p1 - p2;
		if (distance < 0) {
			distance = -distance;
		}
		return distance;
	}%>
<p><form  action = "/MyWeb/Select/CirclePoint/InputPoint.jsp" method = "post">
<input type = "submit" value = "重新輸入"/>
</form><p>
<form  action = "/MyWeb/Select/selectPage.jsp" method = "post">
<input type = "submit" value = "回選擇頁面"/>
</form>
</body>
</html>