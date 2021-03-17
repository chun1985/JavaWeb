<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:useBean id="gn" class="com.sample14.GuessNumber" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>請猜 4 個數字</title>
</head>
<body>
	<br><h1>玩家 2</h1>
	<h3>請猜 4 個數字</h3>
	<form action="guessNumber.jsp" method="post">
	<input type="text" name="guessNum" size="1" /> <input type="checkbox" name="giveUp" value="y">放棄 !! 看答案<p><%
			String chooNum = request.getParameter("chooNum");
			String random = request.getParameter("random");
			String guessNum = request.getParameter("guessNum");
			String giveUp = request.getParameter("giveUp");
			boolean chooOnlyNum = false, chooFourNum = false, guessOnlyNum = false, guessFourNum = false, 
					chooNotDupliNum = false, guessNotDupliNum = false;

			if ("y".equals(random)) {
				do {
					chooNum = "" + gn.randomNum();
					gn.toCheak(chooNum);
					chooNotDupliNum = gn.isNotDupliNum();
				} while (!chooNotDupliNum);
				    chooOnlyNum = true;
				    chooFourNum = true;
			}
			if (chooNum == null) {
				chooNum = (String) session.getAttribute("chooNum");
			} else if (chooNum == "") {
				String errMsg = "y";
				request.setAttribute("errMsg4", errMsg);%>
			<jsp:forward page="chooseNumber.jsp"></jsp:forward><%
			} else {
			    session.setAttribute("chooNum", chooNum);
			}
			if (guessNum != "" && guessNum != null) {
			    guessOnlyNum = guessNum.matches("[0-9]+");
			    guessFourNum = guessNum.length() == 4;
			if (guessOnlyNum && guessFourNum) {
				gn.toCheak(guessNum);
				guessNotDupliNum = gn.isNotDupliNum();
			}
			if (!guessOnlyNum && !"y".equals(giveUp)) {
				out.print("<font color='#ff0000'>輸入數字包含其他符號</font>");
			} else if (!guessFourNum && !"y".equals(giveUp)) {
				out.print("<font color='#ff0000'>輸入數字少於或多於4位數</font>");
			} else if (!guessNotDupliNum && !"y".equals(giveUp)) {
				out.print("<font color='#ff0000'>輸入數字有重複</font>");
			}
			} else if (guessNum == "" && !"y".equals(giveUp)) {
			    out.print("<font color='#ff0000'>輸入欄位不可空白</font>");
			}%><p><%
			if (gn.getTimeStart() != null) {
		        gn.timeCheak();
		    }
		    if ("y".equals(giveUp) || chooNum.equals(guessNum)) {%>
			<input type="submit" value="送出" Disabled /> <input type="reset" value="重新輸入" Disabled /><p><%
		    } else if (gn.isTimeLimit()) {%>
			<input type="submit" value="送出" Disabled /> <input type="reset" value="重新輸入" Disabled /><p>
			<font color='#ff0000'>超過時間 !!</font> 自動結束遊戲 !!<%
			    gn.resetCountC();
			    session.removeAttribute("chooNum");
			} else {%>
			<input type="submit" value="送出" /> <input type="reset" value="重新輸入" /><%
			}%></form><%
		    if (!"y".equals(random) && chooNum != "" && chooNum != null) {
		        chooOnlyNum = chooNum.matches("[0-9]+");
		        chooFourNum = chooNum.length() == 4;
		       if (chooOnlyNum && chooFourNum) {
			       gn.toCheak(chooNum);
			       chooNotDupliNum = gn.isNotDupliNum();
		       }
	        }
	        if ("y".equals(giveUp)) {
		        out.print("玩家 1 輸入的數字為: <font color='#ff0000'>" + chooNum + "</font>");
		        gn.resetTimeStart();
		        gn.resetCountC();
		        session.removeAttribute("chooNum");
	        }
	        if (chooNotDupliNum && guessNotDupliNum && !gn.isTimeLimit()) {
		        gn.setChooNum(chooNum);
		        gn.setGuessNum(guessNum);
		        gn.Result();
		    if (chooNum.equals(guessNum)) {
			    out.print(gn.getGuessedMsg());
			    gn.resetTimeStart();
			    session.removeAttribute("chooNum");
		    } else {
			    out.print(gn.getMsg());
		    }
	        } else if (!chooOnlyNum) {
		        String errMsg = "y";
		        request.setAttribute("errMsg1", errMsg);%>
	        <jsp:forward page="chooseNumber.jsp"></jsp:forward><%
	        } else if (!chooFourNum) {
	            String errMsg = "y";
	            request.setAttribute("errMsg2", errMsg);%>
	        <jsp:forward page="chooseNumber.jsp"></jsp:forward><%
            } else if (!chooNotDupliNum) {
	            String errMsg = "y";
	            request.setAttribute("errMsg3", errMsg);%>
	        <jsp:forward page="chooseNumber.jsp"></jsp:forward><%
	        }
	        if(gn.isTimeLimit()){
	        gn.resetTimeLimit();
	        }%>
</body>
</html>