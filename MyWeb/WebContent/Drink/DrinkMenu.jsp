<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>飲料點餐畫面</title>
</head>
<body>
	<br><h2>飲料點餐畫面</h2>
	<form method="post" action="/MyWeb/DrinkResult">
		<b>請選種類及數量</b>
		<font color="#ff0000"><%
		String nullCode = (String)request.getAttribute("nullCode");
		String error = (String)request.getAttribute("error");
		if ("0".equals(nullCode) || "2".equals(nullCode)) {
		out.print("商品種類，沒有勾選 !!");	
		}
	    if ("y".equals(error)) {
				out.print("數量欄位，包含其他文字或符號 !!");	
		}
		%></font>
		<p>
		<table border="1">
			<tr>
				<td><input type="checkbox" name="drink" value="redTea">紅茶</td>
				<td>數量&nbsp;<input type="text" name="redQty" value="1" size="1"></td>
			</tr>
			<tr>
				<td><input type="checkbox" name="drink" value="greenTea">綠茶</td>
				<td>數量&nbsp;<input type="text" name="greenQty" value="1"
					size="1"></td>
			</tr>
			<tr>
				<td><input type="checkbox" name="drink" value="coffee">咖啡</td>
				<td>數量&nbsp;<input type="text" name="coffeeQty" value="1"
					size="1"></td>
			</tr>
		</table>
		<p>
			請問是否需要塑膠袋?<br>
		<table border="1">
			<tr>
				<td><input type="radio" name="bag" value="big" /> 大</td>
				<td><input type="radio" name="bag" value="small" /> 小</td>
				<td><input type="radio" name="bag" value="notNeed" checked />不需要</td>
			</tr>
		</table>
		數量&nbsp;<input type="text" name="bagQty" value="1" size="1"> <p>
		點餐人:&nbsp;<input type = "text" name = "custName" size ="5"/>
		<font color="#ff0000"><%
		if ("1".equals(nullCode) || "2".equals(nullCode)) {
		out.print("點餐人不可空白 !!");	
		}
		%></font>
		<p>
		<input type="submit" value="送出"> <input type="reset"
			value="重新選擇"/>
	</form>
</body>
</html>