
package com.sample02;

import java.io.*;

public class Robbit implements Serializable {
	private String name, issue;
	private int age;
	private double weight;

	public Robbit() {
	}

	public String getName() {
		return name;
	}

	public String getIssue() {
		return issue;
	}

	public int getAge() {
		return age;
	}

	public double getWeight() {
		return weight;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public void setWeight(double weight) {
		this.weight = weight;
		if (weight > 40) {
			issue = "太胖 !!";
		} else {
			issue = "健康";
		}
	}
}
