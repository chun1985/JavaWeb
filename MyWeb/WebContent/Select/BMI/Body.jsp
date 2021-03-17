<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.net.URLEncoder , java.time.LocalDateTime"%>
<%@ page errorPage="ErrorMsg.jsp"%>
<jsp:useBean id="body" class="com.sample08.Body" scope="session" />
<%try{ %>
<jsp:setProperty property="*" name="body" />
<%}catch(Exception e){
	String msg = "輸入內容包含其他符號";
	throw new Exception(msg);
} 
if(body.getHeight()<1){
	String msg = "輸入身高 < 1";
	throw new Exception(msg);
}else if(body.getWeight()<1){
	String msg = "輸入體重 < 1";
	throw new Exception(msg);
}%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>BMI結果</title>
</head>
<body>
	<br>
	<%
	String visitTime = "", status = "";
	int count = 0;
	Cookie[] ck = request.getCookies();
	if (ck != null) {
		for (int i = 0; i < ck.length; i++) {
			if (ck[i].getName().equals("visitTime")) {
		visitTime = ck[i].getValue();
		visitTime = java.net.URLDecoder.decode(visitTime, "Big5");
		count++;
			} else if (ck[i].getName().equals("status")) {
		status = ck[i].getValue();
		status = java.net.URLDecoder.decode(status, "Big5");
		count++;
			}
			if (count == 2) {
		break;
			}
		}
	}
	if (visitTime != "") {
		out.print("上次於 <font color='#0080ff'>" + visitTime + " </font>檢測<p>");
	}
	if (status != "") {
		out.print("結論為 "+status);
		out.print("<br>------------------------------------------------------------<br><h2>本次量測</h2>");
	}else{
		out.print("<br>");	
	}		
	%>
	身高:&nbsp;<jsp:getProperty name="body" property="height" />&nbsp;
	體重:&nbsp;<jsp:getProperty name="body" property="weight" /><br>
	的BMI:&nbsp;<%=body.BMI()%><p>
	結論:&nbsp;<%= body.Status()%>
	<%@ include file="dateMsg.jsp" %>
	<%
		visitTime = dateMsg;
	    status = body.Status();
		Cookie cookie = new Cookie("visitTime", URLEncoder.encode(visitTime, "Big5"));
		cookie.setMaxAge(3600 * 24 * 90);
		response.addCookie(cookie);
		cookie = new Cookie("status", URLEncoder.encode(status, "Big5"));
		cookie.setMaxAge(3600 * 24 * 90);
		response.addCookie(cookie);
	%>
<p><form  action = "/MyWeb/Select/BMI/InputBody.jsp" method = "post">
<input type = "submit" value = "重新輸入"/>
</form><p>
<form  action = "/MyWeb/Select/selectPage.jsp" method = "post">
<input type = "submit" value = "回選擇頁面"/>
</form>	
</body>
</html>