package com.app.geometry;

public class Point2D {
	private double x;
	private double y;
	
	public Point2D(){	
	}
	
	public Point2D(double x,double y){
		this.x=x;
		this.y=y;
	}
	
	public String getDetails() {
		return "Point2D : [x : "+x+", y : "+y+" ]";
	}
	
	public boolean isEqual(Point2D p) {
		return this.x==p.x && this.y==p.y;
	}
	
	public double calculateDistance(Point2D p) {
		return Math.sqrt( Math.pow((p.x-this.x),2) + Math.pow((p.y-this.y),2));
	}
}
