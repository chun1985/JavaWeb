
package com.sample13;

import java.util.Random;
import java.util.TreeSet;

public class Lotto {
	private String randam[] = new String[5];
	private String[] set1 = new String[6];
	private String[] set2 = new String[6];
	private String[] set3 = new String[6];
	private String[] set4 = new String[6];
	private String[] set5 = new String[6];
	private TreeSet<Integer> tree1 = new TreeSet<>();
	private TreeSet<Integer> tree2 = new TreeSet<>();
	private TreeSet<Integer> tree3 = new TreeSet<>();
	private TreeSet<Integer> tree4 = new TreeSet<>();
	private TreeSet<Integer> tree5 = new TreeSet<>();
	private boolean set1NotNull;
	private boolean set2NotNull;
	private boolean set3NotNull;
	private boolean set4NotNull;
	private boolean set5NotNull;
	private boolean notSixElement;
	private int count = 0;
	private String result = "";
	private TreeSet<Integer> treeR = randamNum();
	private String show = "";

	public Lotto() {
	}

	public void setRandam(String[] randam) {
		this.randam = randam;
	}

	public void setSet1(String[] set1) {
		this.set1 = set1;
	}

	public void setSet2(String[] set2) {
		this.set2 = set2;
	}

	public void setSet3(String[] set3) {
		this.set3 = set3;
	}

	public void setSet4(String[] set4) {
		this.set4 = set4;
	}

	public void setSet5(String[] set5) {
		this.set5 = set5;
	}

	public boolean isSetNotNull() {
		return set1NotNull || set2NotNull || set3NotNull || set4NotNull || set5NotNull;
	}

	public boolean isNotSixElement() {
		return notSixElement;
	}

	public int getCount() {
		return count;
	}

	public String getResult() {
		return result;
	}

	public String getInfoTreeR() {
		String info = "";
		info += "開獎號碼: ";
		info += "<font color='#ff0000'>";
		for (int i : treeR) {
			info += String.format("%02d ", i);
		}
		info += "</font><p>";
		info += "----------------------------------------<p>";
		return info;
	}

	public String getShow() {
		return show;
	}

	public void toCheak() {
		notSixElement = false;
		count = 0;
		result = "";

		if (("y".equals(randam[0]))) {
			tree1 = randamNum();
			set1NotNull = true;
		} else {
			set1NotNull = nullCheak(set1);
		}
		if (("y".equals(randam[1]))) {
			tree2 = randamNum();
			set2NotNull = true;
		} else {
			set2NotNull = nullCheak(set2);
		}
		if (("y".equals(randam[2]))) {
			tree3 = randamNum();
			set3NotNull = true;
		} else {
			set3NotNull = nullCheak(set3);
		}
		if (("y".equals(randam[3]))) {
			tree4 = randamNum();
			set4NotNull = true;
		} else {
			set4NotNull = nullCheak(set4);
		}
		if (("y".equals(randam[4]))) {
			tree5 = randamNum();
			set5NotNull = true;
		} else {
			set5NotNull = nullCheak(set5);
		}

		if (!("y".equals(randam[0]))) {
			notSixElement = elementCheak(set1NotNull, notSixElement, set1);
		}
		if (!("y".equals(randam[1]))) {
			notSixElement = elementCheak(set2NotNull, notSixElement, set2);
		}
		if (!("y".equals(randam[2]))) {
			notSixElement = elementCheak(set3NotNull, notSixElement, set3);
		}
		if (!("y".equals(randam[3]))) {
			notSixElement = elementCheak(set4NotNull, notSixElement, set4);
		}
		if (!("y".equals(randam[4]))) {
			notSixElement = elementCheak(set5NotNull, notSixElement, set5);
		}

		if (("y".equals(randam[0]))) {
			setResult(tree1);
		} else {
			setResult(set1NotNull, set1);
		}
		if (("y".equals(randam[1]))) {
			setResult(tree2);
		} else {
			setResult(set2NotNull, set2);
		}
		if (("y".equals(randam[2]))) {
			setResult(tree3);
		} else {
			setResult(set3NotNull, set3);
		}
		if (("y".equals(randam[3]))) {
			setResult(tree4);
		} else {
			setResult(set4NotNull, set4);
		}
		if (("y".equals(randam[4]))) {
			setResult(tree5);
		} else {
			setResult(set5NotNull, set5);
		}
	}

	private TreeSet<Integer> randamNum() {
		TreeSet<Integer> tree = new TreeSet<>();
		while (tree.size() < 6) {
			tree.add((new Random().nextInt(49) + 1));
		}
		return tree;
	}

	private boolean nullCheak(String[] set) {
		boolean setNotNull = set != null;
		return setNotNull;
	}

	private boolean elementCheak(boolean setNotNull, boolean notSixElement, String[] set) {
		if (setNotNull) {
			boolean setNotSixElement = set.length != 6;
			notSixElement = notSixElement || setNotSixElement;
		}
		return notSixElement;
	}

	private void setResult(boolean setNotNull, String[] set) {
		if (setNotNull) {
			count++;
			result += colorChange(count);
			for (String temp : set) {
				result += temp + " ";
			}
			result += "</font><p>";
		}
	}

	private void setResult(TreeSet<Integer> tree) {
		count++;
		result += colorChange(count);
		for (int temp : tree) {
			result += String.format("%02d ", temp);
		}
		result += "</font><p>";
	}

	private String colorChange(int count) {
		String msg = "";
		switch (count) {
		case 1:
			msg = "<font color='#4f4fff'>";
			break;
		case 2:
			msg = "<font color='#ffa600'>";
			break;
		case 3:
			msg = "<font color='#ff00ff'>";
			break;
		case 4:
			msg = "<font color='#7900d1'>";
			break;
		case 5:
			msg = "<font color='#00d1d1'>";
			break;
		}
		return msg;
	}

	public void readSelectNum() {
		count = 0;
		show = "";

		treeR = randamNum();
		if (("y".equals(randam[0]))) {
			doMediumResult(tree1);
		} else if (set1NotNull) {
			doMediumResult(set1);
		}
		if (("y".equals(randam[1]))) {
			doMediumResult(tree2);
		} else if (set2NotNull) {
			doMediumResult(set2);
		}
		if (("y".equals(randam[2]))) {
			doMediumResult(tree3);
		} else if (set3NotNull) {
			doMediumResult(set3);
		}
		if (("y".equals(randam[3]))) {
			doMediumResult(tree4);
		} else if (set4NotNull) {
			doMediumResult(set4);
		}
		if (("y".equals(randam[4]))) {
			doMediumResult(tree5);
		} else if (set5NotNull) {
			doMediumResult(set5);
		}
	}

	private void doMediumResult(TreeSet<Integer> randamNum) {
		int countR = 0;
		String msgTemp = "";
		String info = "";
		String msg = "";

		for (int i : randamNum) {
			if (treeR.contains(i)) {
				countR++;
				msgTemp += String.format("%02d ", i);
			}
		}
		info += String.format("第 %d 組號碼: ", ++count);
		info += colorChange(count);
		for (int i : randamNum) {
			info += String.format("%02d ", i);
		}
		setShow(info, msg, msgTemp, countR); 
	}

	private void doMediumResult(String[] selectNum) {
		int countR = 0;
		String msgTemp = "";
		String info = "";
		String msg = "";

		for (String s : selectNum) {
			int intS = Integer.parseInt(s);
			if (treeR.contains(intS)) {
				countR++;
				msgTemp += s + " ";
			}
		}
		info += String.format("第 %d 組號碼: ", ++count);
		info += colorChange(count);
		for (String s : selectNum) {
			info += s + " ";
		}
		setShow(info, msg, msgTemp, countR); 
	}

	private void setShow(String info, String msg, String msgTemp, int countR) {
		info += "</font>";
		msg += String.format("<p>中獎號碼: <font color='#ff0000'>%s</font><p>共 <font color='#ff0000'>%d</font> 個<p>",
				msgTemp, countR);
		show += info + msg;
		show += "----------------------------------------<p>";
	}
}
