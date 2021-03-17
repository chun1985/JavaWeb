<%@ page contentType="text/html;charset=big5" %>
<%@ page import="java.util.Date" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<html>
<head><title>JSTL 時間顯示</title></head>
<body>
<c:set var="pattern" value="MM/dd/yyyy hh-mm-ss" />
<fmt:setLocale value="zh_TW"/>
<br>
<h1>JSTL 時間顯示</h1>
<table border ="1">
<tr><td>short</td><td><fmt:formatDate type="both" value="${now}" dateStyle="short" timeStyle="short" /></td></tr>
<tr><td>medium</td><td><fmt:formatDate type="both" value="${now}" dateStyle="medium" timeStyle="medium" /></td></tr>
<tr><td>long</td><td><fmt:formatDate type="both" value="${now}" dateStyle="long" timeStyle="long" /></td></tr>
<tr><td>full</td><td><fmt:formatDate type="both" value="${now}" dateStyle="full" timeStyle="full" /></td></tr>
<tr><td>pattern</td><td><fmt:formatDate type="both" value="${now}" pattern="${pattern}" /></td></tr>
</table></body>
</html>