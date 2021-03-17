<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>請輸入身高體重</title>
</head>
<body>
<br>
<h2>請輸入身高體重</h2>
<form  action="/MyWeb/Select/BMI/Body.jsp" method="post">            
 身高:&nbsp;<input type="text" name="height" size="1"/><br>
 體重:&nbsp;<input type="text" name="weight" size="1"/><p>           
<input type="submit" value="送出"/>
</form>
<form  action = "/MyWeb/Select/selectPage.jsp" method = "post">
<input type = "submit" value = "回選擇頁面"/>
</form>
</body>
</html>