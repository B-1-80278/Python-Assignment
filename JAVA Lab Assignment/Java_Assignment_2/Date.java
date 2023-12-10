//package q3;

class Date {
	private int dd;
	private int mm;
	private int yy;
	
	Date(){}
	
	Date(int dd,int mm,int yy){
		this.dd=dd;
		this.mm=mm;
		this.yy=yy;
	}
	
	void setDay(int dd) {
		this.dd=dd;
	}
	int getDay() {
		return this.dd;
	}
	
	void setMonth(int mm) {
		this.mm=mm;
	}
	int getMonth() {
		return this.mm;
	}
	
	void setYear(int yy) {
		this.yy=yy;
	}
	int getYear() {
		return this.yy;
	}
	
	void displayDate() {
		System.out.println(this.mm+"/"+this.dd+"/"+this.yy);
	}
}
