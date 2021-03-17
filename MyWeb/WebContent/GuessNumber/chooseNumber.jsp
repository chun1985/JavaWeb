<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:useBean id="gn" class="com.sample14.GuessNumber" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>請輸入 4 個數字</title>
</head>
<body>
<br><h1>玩家 1 </h1><h3>請輸入 4 個不重複的數字</h3>
<form action = "guessNumber.jsp" method = "post">
<input type ="password" name = "chooNum" size = "1"/>
<input type ="checkbox" name = "random" value ="y"/>電腦決定
<p><%
gn.resetCountC();
gn.resetTimeLimit();
gn.resetTimeStart();
String errMsg1 = (String) request.getAttribute("errMsg1");
String errMsg2 = (String) request.getAttribute("errMsg2");
String errMsg3 = (String) request.getAttribute("errMsg3");
String errMsg4 = (String) request.getAttribute("errMsg4");
if("y".equals(errMsg1)){
	out.print("<font color='#ff0000'>輸入數字包含其他符號</font>");
}else if("y".equals(errMsg2)){
	out.print("<font color='#ff0000'>輸入數字少於或多於4位數</font>");
}else if("y".equals(errMsg3)){
	out.print("<font color='#ff0000'>輸入數字有重複</font>");
}else if ("y".equals(errMsg4)){
	out.print("<font color='#ff0000'>輸入欄位不可空白</font>");
}%>
<p><input type ="submit" value = "送出" />
<input type ="reset" value ="重新輸入"/>
</form>
</body>
</html>