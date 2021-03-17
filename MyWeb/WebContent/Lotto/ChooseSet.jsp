<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>請選擇號碼</title>
</head>
<body>
	<br>
	<h1>請選擇號碼</h1>
	<%
	String errMsg1 = (String) request.getAttribute("errMsg1");
	String errMsg2 = (String) request.getAttribute("errMsg2");

	if ("y".equals(errMsg1)) {
	%>
	<font color="#ff0000">請至少勾選一組號碼</font><p>
	<%} else if ("y".equals(errMsg2)) {
	%>
	<font color="#ff0000">一組號碼不可超過或少於 6 個號碼</font><p>
	<%}%>
	<form action="Result.jsp" method="post">
		<h3>第一組號碼</h3>
		<input type="checkbox" name="set1" value="01" />01 
		<input type="checkbox" name="set1" value="02" />02 
		<input type="checkbox" name="set1" value="03" />03 
		<input type="checkbox" name="set1" value="04" />04 
		<input type="checkbox" name="set1" value="05" />05
		<input type="checkbox" name="set1" value="06" />06 
		<input type="checkbox" name="set1" value="07" />07 
		<input type="checkbox" name="set1" value="08" />08 
		<input type="checkbox" name="set1" value="09" />09 
		<input type="checkbox" name="set1" value="10" />10
		<input type="checkbox" name="randam1" value="y" />電腦選號<br> 
		<input type="checkbox" name="set1" value="11" />11 
		<input type="checkbox" name="set1" value="12" />12 
		<input type="checkbox" name="set1" value="13" />13 
		<input type="checkbox" name="set1" value="14" />14 
		<input type="checkbox" name="set1" value="15" />15
		<input type="checkbox" name="set1" value="16" />16 
		<input type="checkbox" name="set1" value="17" />17 
		<input type="checkbox" name="set1" value="18" />18 
		<input type="checkbox" name="set1" value="19" />19 
		<input type="checkbox" name="set1" value="20" />20<br>
		<input type="checkbox" name="set1" value="21" />21 
		<input type="checkbox" name="set1" value="22" />22 
		<input type="checkbox" name="set1" value="23" />23 
		<input type="checkbox" name="set1" value="24" />24
		<input type="checkbox" name="set1" value="25" />25 
		<input type="checkbox" name="set1" value="26" />26 
		<input type="checkbox" name="set1" value="27" />27 
		<input type="checkbox" name="set1" value="28" />28 
		<input type="checkbox" name="set1" value="29" />29
		<input type="checkbox" name="set1" value="30" />30<br> 
		<input type="checkbox" name="set1" value="31" />31 
		<input type="checkbox" name="set1" value="32" />32 
		<input type="checkbox" name="set1" value="33" />33 
		<input type="checkbox" name="set1" value="34" />34
		<input type="checkbox" name="set1" value="35" />35 
		<input type="checkbox" name="set1" value="36" />36 
		<input type="checkbox" name="set1" value="37" />37 
		<input type="checkbox" name="set1" value="38" />38 
		<input type="checkbox" name="set1" value="39" />39
		<input type="checkbox" name="set1" value="40" />40<br> 
		<input type="checkbox" name="set1" value="41" />41 
		<input type="checkbox" name="set1" value="42" />42 
		<input type="checkbox" name="set1" value="43" />43 
		<input type="checkbox" name="set1" value="44" />44
		<input type="checkbox" name="set1" value="45" />45 
		<input type="checkbox" name="set1" value="46" />46 
		<input type="checkbox" name="set1" value="47" />47 
		<input type="checkbox" name="set1" value="48" />48 
		<input type="checkbox" name="set1" value="49" />49
		
		<h3>第二組號碼</h3>
		<input type="checkbox" name="set2" value="01" />01 
		<input type="checkbox" name="set2" value="02" />02 
		<input type="checkbox" name="set2" value="03" />03 
		<input type="checkbox" name="set2" value="04" />04 
		<input type="checkbox" name="set2" value="05" />05
		<input type="checkbox" name="set2" value="06" />06 
		<input type="checkbox" name="set2" value="07" />07 
		<input type="checkbox" name="set2" value="08" />08 
		<input type="checkbox" name="set2" value="09" />09 
		<input type="checkbox" name="set2" value="10" />10
		<input type="checkbox" name="randam2" value="y" />電腦選號<br> 
		<input type="checkbox" name="set2" value="11" />11 
		<input type="checkbox" name="set2" value="12" />12 
		<input type="checkbox" name="set2" value="13" />13 
		<input type="checkbox" name="set2" value="14" />14 
		<input type="checkbox" name="set2" value="15" />15
		<input type="checkbox" name="set2" value="16" />16 
		<input type="checkbox" name="set2" value="17" />17 
		<input type="checkbox" name="set2" value="18" />18 
		<input type="checkbox" name="set2" value="19" />19 
		<input type="checkbox" name="set2" value="20" />20<br>
		<input type="checkbox" name="set2" value="21" />21 
		<input type="checkbox" name="set2" value="22" />22 
		<input type="checkbox" name="set2" value="23" />23 
		<input type="checkbox" name="set2" value="24" />24
		<input type="checkbox" name="set2" value="25" />25 
		<input type="checkbox" name="set2" value="26" />26 
		<input type="checkbox" name="set2" value="27" />27 
		<input type="checkbox" name="set2" value="28" />28 
		<input type="checkbox" name="set2" value="29" />29
		<input type="checkbox" name="set2" value="30" />30<br> 
		<input type="checkbox" name="set2" value="31" />31 
		<input type="checkbox" name="set2" value="32" />32 
		<input type="checkbox" name="set2" value="33" />33 
		<input type="checkbox" name="set2" value="34" />34
		<input type="checkbox" name="set2" value="35" />35 
		<input type="checkbox" name="set2" value="36" />36 
		<input type="checkbox" name="set2" value="37" />37 
		<input type="checkbox" name="set2" value="38" />38 
		<input type="checkbox" name="set2" value="39" />39
		<input type="checkbox" name="set2" value="40" />40<br> 
		<input type="checkbox" name="set2" value="41" />41 
		<input type="checkbox" name="set2" value="42" />42 
		<input type="checkbox" name="set2" value="43" />43 
		<input type="checkbox" name="set2" value="44" />44
		<input type="checkbox" name="set2" value="45" />45 
		<input type="checkbox" name="set2" value="46" />46 
		<input type="checkbox" name="set2" value="47" />47 
		<input type="checkbox" name="set2" value="48" />48 
		<input type="checkbox" name="set2" value="49" />49
		
		<h3>第三組號碼</h3>
		<input type="checkbox" name="set3" value="01" />01 
		<input type="checkbox" name="set3" value="02" />02 
		<input type="checkbox" name="set3" value="03" />03 
		<input type="checkbox" name="set3" value="04" />04 
		<input type="checkbox" name="set3" value="05" />05
		<input type="checkbox" name="set3" value="06" />06 
		<input type="checkbox" name="set3" value="07" />07 
		<input type="checkbox" name="set3" value="08" />08 
		<input type="checkbox" name="set3" value="09" />09 
		<input type="checkbox" name="set3" value="10" />10
		<input type="checkbox" name="randam3" value="y" />電腦選號<br> 
		<input type="checkbox" name="set3" value="11" />11 
		<input type="checkbox" name="set3" value="12" />12 
		<input type="checkbox" name="set3" value="13" />13 
		<input type="checkbox" name="set3" value="14" />14 
		<input type="checkbox" name="set3" value="15" />15
		<input type="checkbox" name="set3" value="16" />16 
		<input type="checkbox" name="set3" value="17" />17 
		<input type="checkbox" name="set3" value="18" />18 
		<input type="checkbox" name="set3" value="19" />19 
		<input type="checkbox" name="set3" value="20" />20<br>
		<input type="checkbox" name="set3" value="21" />21 
		<input type="checkbox" name="set3" value="22" />22 
		<input type="checkbox" name="set3" value="23" />23 
		<input type="checkbox" name="set3" value="24" />24
		<input type="checkbox" name="set3" value="25" />25 
		<input type="checkbox" name="set3" value="26" />26 
		<input type="checkbox" name="set3" value="27" />27 
		<input type="checkbox" name="set3" value="28" />28 
		<input type="checkbox" name="set3" value="29" />29
		<input type="checkbox" name="set3" value="30" />30<br> 
		<input type="checkbox" name="set3" value="31" />31 
		<input type="checkbox" name="set3" value="32" />32 
		<input type="checkbox" name="set3" value="33" />33 
		<input type="checkbox" name="set3" value="34" />34
		<input type="checkbox" name="set3" value="35" />35 
		<input type="checkbox" name="set3" value="36" />36 
		<input type="checkbox" name="set3" value="37" />37 
		<input type="checkbox" name="set3" value="38" />38 
		<input type="checkbox" name="set3" value="39" />39
		<input type="checkbox" name="set3" value="40" />40<br> 
		<input type="checkbox" name="set3" value="41" />41 
		<input type="checkbox" name="set3" value="42" />42 
		<input type="checkbox" name="set3" value="43" />43 
		<input type="checkbox" name="set3" value="44" />44
		<input type="checkbox" name="set3" value="45" />45 
		<input type="checkbox" name="set3" value="46" />46 
		<input type="checkbox" name="set3" value="47" />47 
		<input type="checkbox" name="set3" value="48" />48 
		<input type="checkbox" name="set3" value="49" />49
		
		<h3>第四組號碼</h3>
		<input type="checkbox" name="set4" value="01" />01 
		<input type="checkbox" name="set4" value="02" />02 
		<input type="checkbox" name="set4" value="03" />03 
		<input type="checkbox" name="set4" value="04" />04 
		<input type="checkbox" name="set4" value="05" />05
		<input type="checkbox" name="set4" value="06" />06 
		<input type="checkbox" name="set4" value="07" />07 
		<input type="checkbox" name="set4" value="08" />08 
		<input type="checkbox" name="set4" value="09" />09 
		<input type="checkbox" name="set4" value="10" />10
		<input type="checkbox" name="randam4" value="y" />電腦選號<br> 
		<input type="checkbox" name="set4" value="11" />11 
		<input type="checkbox" name="set4" value="12" />12 
		<input type="checkbox" name="set4" value="13" />13 
		<input type="checkbox" name="set4" value="14" />14 
		<input type="checkbox" name="set4" value="15" />15
		<input type="checkbox" name="set4" value="16" />16 
		<input type="checkbox" name="set4" value="17" />17 
		<input type="checkbox" name="set4" value="18" />18 
		<input type="checkbox" name="set4" value="19" />19 
		<input type="checkbox" name="set4" value="20" />20<br>
		<input type="checkbox" name="set4" value="21" />21 
		<input type="checkbox" name="set4" value="22" />22 
		<input type="checkbox" name="set4" value="23" />23 
		<input type="checkbox" name="set4" value="24" />24
		<input type="checkbox" name="set4" value="25" />25 
		<input type="checkbox" name="set4" value="26" />26 
		<input type="checkbox" name="set4" value="27" />27 
		<input type="checkbox" name="set4" value="28" />28 
		<input type="checkbox" name="set4" value="29" />29
		<input type="checkbox" name="set4" value="30" />30<br> 
		<input type="checkbox" name="set4" value="31" />31 
		<input type="checkbox" name="set4" value="32" />32 
		<input type="checkbox" name="set4" value="33" />33 
		<input type="checkbox" name="set4" value="34" />34
		<input type="checkbox" name="set4" value="35" />35 
		<input type="checkbox" name="set4" value="36" />36 
		<input type="checkbox" name="set4" value="37" />37 
		<input type="checkbox" name="set4" value="38" />38 
		<input type="checkbox" name="set4" value="39" />39
		<input type="checkbox" name="set4" value="40" />40<br> 
		<input type="checkbox" name="set4" value="41" />41 
		<input type="checkbox" name="set4" value="42" />42 
		<input type="checkbox" name="set4" value="43" />43 
		<input type="checkbox" name="set4" value="44" />44
		<input type="checkbox" name="set4" value="45" />45 
		<input type="checkbox" name="set4" value="46" />46 
		<input type="checkbox" name="set4" value="47" />47 
		<input type="checkbox" name="set4" value="48" />48 
		<input type="checkbox" name="set4" value="49" />49
		
		<h3>第五組號碼</h3>
		<input type="checkbox" name="set5" value="01" />01 
		<input type="checkbox" name="set5" value="02" />02 
		<input type="checkbox" name="set5" value="03" />03 
		<input type="checkbox" name="set5" value="04" />04 
		<input type="checkbox" name="set5" value="05" />05
		<input type="checkbox" name="set5" value="06" />06 
		<input type="checkbox" name="set5" value="07" />07 
		<input type="checkbox" name="set5" value="08" />08 
		<input type="checkbox" name="set5" value="09" />09 
		<input type="checkbox" name="set5" value="10" />10
		<input type="checkbox" name="randam5" value="y" />電腦選號<br> 
		<input type="checkbox" name="set5" value="11" />11 
		<input type="checkbox" name="set5" value="12" />12 
		<input type="checkbox" name="set5" value="13" />13 
		<input type="checkbox" name="set5" value="14" />14 
		<input type="checkbox" name="set5" value="15" />15
		<input type="checkbox" name="set5" value="16" />16 
		<input type="checkbox" name="set5" value="17" />17 
		<input type="checkbox" name="set5" value="18" />18 
		<input type="checkbox" name="set5" value="19" />19 
		<input type="checkbox" name="set5" value="20" />20<br>
		<input type="checkbox" name="set5" value="21" />21 
		<input type="checkbox" name="set5" value="22" />22 
		<input type="checkbox" name="set5" value="23" />23 
		<input type="checkbox" name="set5" value="24" />24
		<input type="checkbox" name="set5" value="25" />25 
		<input type="checkbox" name="set5" value="26" />26 
		<input type="checkbox" name="set5" value="27" />27 
		<input type="checkbox" name="set5" value="28" />28 
		<input type="checkbox" name="set5" value="29" />29
		<input type="checkbox" name="set5" value="30" />30<br> 
		<input type="checkbox" name="set5" value="31" />31 
		<input type="checkbox" name="set5" value="32" />32 
		<input type="checkbox" name="set5" value="33" />33 
		<input type="checkbox" name="set5" value="34" />34
		<input type="checkbox" name="set5" value="35" />35 
		<input type="checkbox" name="set5" value="36" />36 
		<input type="checkbox" name="set5" value="37" />37 
		<input type="checkbox" name="set5" value="38" />38 
		<input type="checkbox" name="set5" value="39" />39
		<input type="checkbox" name="set5" value="40" />40<br> 
		<input type="checkbox" name="set5" value="41" />41 
		<input type="checkbox" name="set5" value="42" />42 
		<input type="checkbox" name="set5" value="43" />43 
		<input type="checkbox" name="set5" value="44" />44
		<input type="checkbox" name="set5" value="45" />45 
		<input type="checkbox" name="set5" value="46" />46 
		<input type="checkbox" name="set5" value="47" />47 
		<input type="checkbox" name="set5" value="48" />48 
		<input type="checkbox" name="set5" value="49" />49
		
		<p><input type="submit" value="提交">
		<input type="reset"value="重新勾選">
	</form>
</body>
</html>