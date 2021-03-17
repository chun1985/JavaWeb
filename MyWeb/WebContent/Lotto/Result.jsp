<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:useBean id="lo" class="com.sample13.Lotto" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>選號號碼</title>
</head>
<body>
	<br>
	<h1>選號號碼</h1>
	<%
	String[] set1 = request.getParameterValues("set1");
	String[] set2 = request.getParameterValues("set2");
	String[] set3 = request.getParameterValues("set3");
	String[] set4 = request.getParameterValues("set4");
	String[] set5 = request.getParameterValues("set5");

	String[] randam = new String[] { request.getParameter("randam1"), request.getParameter("randam2"),
			request.getParameter("randam3"), request.getParameter("randam4"), request.getParameter("randam5") };
	lo.setRandam(randam);

	if (!("y".equals(randam[0]))) {
		lo.setSet1(set1);
	}
	if (!("y".equals(randam[1]))) {
		lo.setSet2(set2);
	}
	if (!("y".equals(randam[2]))) {
		lo.setSet3(set3);
	}
	if (!("y".equals(randam[3]))) {
		lo.setSet4(set4);
	}
	if (!("y".equals(randam[4]))) {
		lo.setSet5(set5);
	}
	lo.toCheak();

	if (!lo.isSetNotNull()) {
		request.setAttribute("errMsg1", "y");
	%>
	<jsp:forward page="ChooseSet.jsp"></jsp:forward>
	<%
		} else if (lo.isNotSixElement()) {
	request.setAttribute("errMsg2", "y");
	%>
	<jsp:forward page="ChooseSet.jsp"></jsp:forward>
	<%
		} else {
	out.print("共選了 " + lo.getCount() + " 組號碼<p>");
	out.print(lo.getResult());
	}
	%>
	<form action="requestAttClear.jsp" method="post">
		<input type="submit" value="重新勾選">
	</form>
	<p>
	<form action="mediumResult.jsp" method="post">
		<input type="submit" value="確認開獎">
	</form>
</body>
</html>