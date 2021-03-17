<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> 
<%@taglib uri ="favorite" prefix = "f" %>
<%@page import = " java.time.*" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
<h1>現在時刻:</h1>
<font color="#ff0000"><f:nowTimeMsg/></font><br>
<font color="#ffabab"><f:nowTimeMsg addSec = "y" /></font>
<f:dividingLine/>
<%
Instant startTime = Instant.parse("2020-07-31T23:59:59Z");
Instant finishTime1 = Instant.parse("2020-08-01T00:00:55Z");
Instant finishTime2 = Instant.parse("2020-08-01T00:52:07Z");
Instant finishTime3 = Instant.parse("2020-08-01T21:00:12Z");
Instant finishTime4 = Instant.parse("2020-08-01T22:43:17Z");
Instant finishTime5 = Instant.parse("2020-08-04T00:00:07Z");
Instant finishTime6 = Instant.parse("2020-08-04T00:27:14Z");
Instant finishTime7 = Instant.parse("2020-08-04T10:22:17Z");
%>
<table border ="1">
<tr><td>計時器1: </td><td><font color="#ff00ff"><f:Timer finishTime="<%=finishTime1%>" startTime="<%=startTime%>" set="d"/></font></td></tr>
<tr><td>計時器2: </td><td><font color="#ff00ff"><f:Timer finishTime="<%=finishTime2%>" startTime="<%=startTime%>" set="d"/></font></td></tr>
<tr><td>計時器3: </td><td><font color="#0000ff"><f:Timer finishTime="<%=finishTime3%>" startTime="<%=startTime%>" set="d"/></font></td></tr>
<tr><td>計時器4: </td><td><font color="#0000ff"><f:Timer finishTime="<%=finishTime4%>" startTime="<%=startTime%>" set="i"/></font></td></tr>
<tr><td>計時器5: </td><td><font color="#00d1d1"><f:Timer finishTime="<%=finishTime5%>" startTime="<%=startTime%>" set="i"/></font></td></tr>
<tr><td>計時器6: </td><td><font color="#00d1d1"><f:Timer finishTime="<%=finishTime6%>" startTime="<%=startTime%>" set="i"/></font></td></tr>
<tr><td>計時器7: </td><td><font color="#00d1d1"><f:Timer finishTime="<%=finishTime7%>" startTime="<%=startTime%>" set="i"/></font></td></tr>
</table>
<font color="#969696"><f:dividingLine  length = "60"/></font>
</body>
</html>