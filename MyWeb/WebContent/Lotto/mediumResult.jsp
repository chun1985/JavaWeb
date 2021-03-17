<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:useBean id="lo" class="com.sample13.Lotto" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>開獎結果</title>
</head>
<body>
<br><h1>開獎結果</h1>
<%
lo.readSelectNum();
out.print(lo.getInfoTreeR());
out.print(lo.getShow());
%>
</body>
</html>