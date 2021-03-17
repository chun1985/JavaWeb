<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page errorPage="ErrorMsg.jsp"%>
<jsp:useBean id="rc" class="com.sample12.ReceiptLottery" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>統一發票對獎</title>
</head>
<body>
<br><h1>統一發票對獎</h1>
<%
String time = request.getParameter("time");
if(time == null){
	time = (String ) session.getAttribute("time");
}
else{	
	session.setAttribute("time", time);
}
if (time != "" && time != null ) {
out.print("<font color='##0000ff'>" + time.substring(0, 3) + "</font> 年 <font color='#ff0000'>" + time.substring(3, 5) + "</font> 月開獎");
}%><p>
<form action = "ReceiptNumber.jsp" method ="post">
號碼:&nbsp;<input type = "text" name = "number" size = "5">
<input type = "submit" value = "送出">
</form><p>
<form action = "ReceiptMonth.jsp" method ="post">
<input type = "submit" value = "重新選擇月份">
</form>
<p><%
String number = request.getParameter("number");
if(number != "" && number != null && time != ""){
	if(!number.matches("[0-9]+")){
		String msg = "輸入內容包含英文或其他符號";
		throw new Exception(msg);
	}else{    
		if(number.length() > 8){
			String msg = "輸入數字超過8位數";
			throw new Exception(msg);
		}else if(number.length() < 8){
		    String msg = "輸入數字少於8位數";
			throw new Exception(msg);
		}
	}
rc.setUserTime(time);
rc.setUserNum(number);
rc.doResult();
out.print(rc.getTheResult());
}else if(number == ""){
	out.print("<font color='#ff0000'>請輸入號碼</font>");
}else if(time == ""){
request.setAttribute("nullMsg", "y");
%>
<jsp:forward page="ReceiptMonth.jsp"></jsp:forward>
<%}%>
</body>
</html>