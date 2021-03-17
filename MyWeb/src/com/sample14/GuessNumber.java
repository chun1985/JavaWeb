
package com.sample14;

import java.time.*;
import java.util.Random;

public class GuessNumber {
	private String chooNum = "";
	private String guessNum = "";
	private Arrange arrange = new Arrange();
	private boolean notDupliNum;
	private Instant timeStart;
	private String msg = "";
	private String guessedMsg = "";
	private boolean timeLimit;
	private int countC = 0;

	public GuessNumber() {
	}

	public void setChooNum(String chooNum) {
		this.chooNum = chooNum;
	}

	public void setGuessNum(String guessNum) {
		this.guessNum = guessNum;
	}

	public boolean isNotDupliNum() {
		return notDupliNum;
	}

	public Instant getTimeStart() {
		return timeStart;
	}

	public String getMsg() {
		return msg;
	}

	public String getGuessedMsg() {
		return guessedMsg;
	}

	public boolean isTimeLimit() {
		return timeLimit;
	}

	public int randomNum() {
		int setNum = new Random().nextInt(8642) + 1234;
		return setNum;
	}

	public void toCheak(String number) {
		arrange.setNotDupliNum(number);
		notDupliNum = arrange.isNotDupliNum();
	}

	public void Result() {
		int countB = 0, countA = 0;
		if (countC == 0) {
			timeStart = Instant.now();
			msg = "";
		}
		countC++;
		countB = arrange.ArrangeB(chooNum, guessNum);
		countA = arrange.ArrangeA(chooNum, guessNum);
		if (chooNum.equals(guessNum)) {
			Instant timeFinsh = Instant.now();
			String msgTemp = msg;
			msg = String.format(
					" <font color='#00d100'>%s</font><p> 恭喜在第 <font color='#ff0000'>%d</font> 次猜中了<p>花費時間為: ", chooNum,
					countC);
			guessedMsg = msg + timer(timeStart, timeFinsh) + msgTemp;
			resetCountC();
		} else {
			String msgTemp = msg;
			msg = String.format("%d. <font color='#ff0000'>%s</font><p>"
					+ "<font color='#9300ff'>%d A</font> <font color='#00d1d1'>%d B</font><br>"
					+ "----------------------------------------<p>", countC, guessNum, countA, countB - countA);
			msg += msgTemp;
		}
	}

	public void timeCheak() {
		Instant timeNow = Instant.now();
		Duration timeCount = Duration.between(timeStart, timeNow);
		if (timeCount.toMinutes() > 0) {
			timeLimit = true;
			timeStart = null;
		}
	}

	private String timer(Instant timeStart, Instant timeFinsh) {
		String timeMsg = "";
		Duration timeCount = Duration.between(timeStart, timeFinsh);
		timeMsg += String.format("<font color='#0000ff'>%d</font> 分 ", timeCount.toMinutes());
		timeMsg += String.format("<font color='#0000ff'>%d</font> 秒<p>----------------------------------------<p>",
				(timeCount.toMillis() / 1000 - timeCount.toMinutes() * 60));
		return timeMsg;
	}

	public void resetTimeStart() {
		timeStart = null;
	}

	public void resetCountC() {
		countC = 0;
	}

	public void resetTimeLimit() {
		timeLimit = false;
	}
}
