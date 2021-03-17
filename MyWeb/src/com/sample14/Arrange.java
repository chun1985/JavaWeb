
package com.sample14;

public class Arrange {
	private boolean notDupliNum; //判別數字有無重複

	public Arrange() {
	}

	public boolean isNotDupliNum() {
		return notDupliNum;
	}

	public void setNotDupliNum(String num) {
		loop: for (int i = 0; i < 3; i++) {
			for (int j = i + 1; j < 4; j++) {
				if (num.charAt(i) == num.charAt(j)) {
					notDupliNum = false;
					break loop;
				} else {
					notDupliNum = true;
				}
			}
		}
	}

	public int ArrangeB(String num1, String num2) {
		int count = 0;
		for (int i = 0; i < 4; i++) {
			for (int j = 0; j < 4; j++) {
				if (num1.charAt(i) == num2.charAt(j)) {
					count++;
				}
			}
		}
		return count;
	} // public static boolean ArrangeA

	public int ArrangeA(String num1, String num2) {
		int count = 0;
		for (int i = 0; i < 4; i++) {
			if (num1.charAt(i) == num2.charAt(i)) {
				count++;
			}
		}
		return count;
	} // public static boolean ArrangeB
}// public class Arrange
