<%-- 
    Document   : JSTL_Function
    Created on : 2013/11/3, 下午 02:08:15
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>JSP Page</title>
    </head>
    <body>
    <br>
    <h1>JSTL 函式運用</h1>
    <table border = "1">
        <tr><td>fn:length <font color="#ff0000">" Hello "</font> :</td><td>${fn:length("Hello")}</td></tr>
        <tr><td>fn:indexOf <font color="#ff0000">" java web demo "," web "</font> :</td><td> ${fn:indexOf("java web demo","web")}</td></tr>
        <tr><td>fn:toLowerCase <font color="#ff0000">" HELLO "</font> :</td><td> ${fn:toLowerCase("HELLO")}</td></tr>               
        <tr><td>fn:substring <font color="#ff0000">" Hello everybody ", 3, 10</font> :</td><td> ${fn:substring("Hello everybody",3,10)}</td></tr>
        <tr><td>fn:substringAfter <font color="#ff0000">" java web demo ","web "</font> :</td><td> ${fn:substringAfter("java web demo","web")}</td></tr> 
        <tr><td>fn:trim <font color="#ff0000">"    java web demo     "</font> :</td><td>${fn:trim("    java web demo     ") }</td></tr>
        <tr><td>fn:replace <font color="#ff0000">" java web demo "," ", "_"</font> :</td><td> ${fn:replace("java web demo"," ", "_")}</td></tr>
        <tr><td>fn:toUpperCase <font color="#ff0000">" java_web_demo "</font> :</td><td> ${fn:toUpperCase("java_web_demo")}</td></tr>
        <tr><td>fn:startsWith <font color="#ff0000">" java web demo "," jav "</font> :</td><td> ${fn:startsWith("java web demo","jav")}</td></tr> 
        <tr><td>fn:endsWith <font color="#ff0000">" java web demo "," mo "</font> :</td><td>${fn:endsWith("java web demo","mo")}</td></tr>
        <tr><td>fn:containsIgnoreCase <font color="#ff0000">" java web demo "," WEB "</font> :</td><td>${fn:containsIgnoreCase("java web demo","WEB")}</td></tr>
        <tr><td>fn:contains <font color="#ff0000">" java web demo "," web "</font> :</td><td> ${fn:contains("java web demo","web")}</td></tr>       
    </table></body>
</html>
