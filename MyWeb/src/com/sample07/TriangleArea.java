
package com.sample07;

public class TriangleArea {
	private double base;
	private double high;
	private double area;

	public void setBase(double base) {
		this.base = base;
	}

	public void setHigh(double high) {
		this.high = high;
	}

	public double getArea() {
		area = base * high / 2;
		return area;
	}
}
