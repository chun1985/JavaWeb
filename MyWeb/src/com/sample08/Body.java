
package com.sample08;

public class Body {
	private double height, weight;

	public Body() {
	}

	public double getHeight() {
		return height;
	}

	public void setHeight(double height) {
		this.height = height;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

	public String BMI() {
		double x = height / 100;
		return String.format("%.2f", weight / Math.pow(x, 2));
	}

	public String Status() {
		double b = Double.parseDouble(BMI());
		if (b < 18.5)
			return "<font color='#ff0000'>過輕</font>";
		else if (b < 24)
			return "<font color='#00ff00'>正常</font>";
		else if (b < 27)
			return "<font color='#ff8000'>輕度肥胖</font>";
		else if (b < 30)
			return "<font color='#ff8000'>中度肥胖</font>";
		else
			return "<font color='#ff0000'>重度肥胖</font>";
	}
}
