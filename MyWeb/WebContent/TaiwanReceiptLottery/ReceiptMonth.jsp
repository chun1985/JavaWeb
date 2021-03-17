<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
    .font3{font-size : 0.5cm}
</style>
<meta charset="utf-8">
<title>請選擇開講月份</title>
</head>
<body>
<br><jsp:include page="/Profile/Profile.jsp"/>
<h1>統一發票對獎</h1>
<h2>請選擇開講月份</h2>
<% 
session.removeAttribute("time");
%>
<form action = "ReceiptNumber.jsp" method ="post">
<select id="sec1" name="time">
<option value="10801">108年01月開獎</option>
<option value="10803">108年03月開獎</option>
<option value="10805">108年05月開獎</option>
<option value="10807">108年07月開獎</option>
<option value="10809">108年09月開獎</option>
<option value="10811">108年11月開獎</option>
<option value="" selected >請選擇開獎月份</option>
</select>
<input type = "submit" value = "送出">
</form><p>
<script>
$(document).ready(function(){
	  $("#sec1").addClass("font3");
	});
</script>
<% 
String nullMsg = (String) request.getAttribute("nullMsg");
if("y".equals(nullMsg) ){
out.print("<font color='#ff0000'>請選擇開獎月份</font>");
}%>
</body>
</html>