<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>點位置與圓的大小</title>
</head>
<body>
<br><h2>點位置與圓的大小</h2>
請輸入:
<form  action = "/MyWeb/Select/CirclePoint/Circle.jsp" method = "post">
<br>圓心X軸座標:&nbsp;<input type = "text" name = "Xcenter" size = "1" />
<br>圓心Y軸座標:&nbsp;<input type = "text" name = "Ycenter" size = "1" />
<br>半徑:&nbsp;<input type = "text" name = "r" size = "1" />
<br>點X軸座標:&nbsp;<input type = "text" name = "Xpoint" size = "1" />
<br>點Y軸座標:&nbsp;<input type = "text" name = "Ypoint" size = "1" />
<p><input type = "submit" value = "送出"/>
</form>
<form  action = "/MyWeb/Select/selectPage.jsp" method = "post">
<input type = "submit" value = "回選擇頁面"/>
</form>
</body>
</html>