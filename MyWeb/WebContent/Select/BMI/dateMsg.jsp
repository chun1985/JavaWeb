<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.net.URLEncoder , java.time.LocalDateTime"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
</head>
<body>
<%
String dateMsg = "";
LocalDateTime time = LocalDateTime.now();
/*dateMsg = String.format("%d 年 %02d 月 %02d 日 %02d 時 %02d 分 %02d 秒", 
		time.getYear(), time.getMonthValue(),time.getDayOfMonth(),
        time.getHour(), time.getMinute(), time.getSecond());*/

dateMsg = String.format("%d 年 %02d 月 %02d 日 %02d 時 %02d 分",
		time.getYear(), time.getMonthValue(),time.getDayOfMonth(),
		time.getHour(), time.getMinute());
%>
</body>
</html>