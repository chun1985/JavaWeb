<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>請輸入三角形資訊</title>
</head>
<body>
<br><h2>請輸入三角形資訊</h2>
<form action ="/MyWeb/Select/Triangle_Area/UsebeanTriangle.jsp" method = "post">
底:&nbsp;<input type = "text" name ="base" size = "1" /><br>
高:&nbsp;<input type = "text" name ="high" size = "1" /><p>
<input type ="submit" value ="送出" />
</form>
<form  action = "/MyWeb/Select/selectPage.jsp" method = "post">
<input type = "submit" value = "回選擇頁面"/>
</form>
</body>
</html>